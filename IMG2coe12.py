"""
Translate image file to Xilinx .coe with 12-bit RGB words (4 bits per channel).
Based on IMG2coe12.m (modified by Dugan Karnazes).
Color format: [R3,R2,R1,R0,G3,G2,G1,G0,B3,B2,B1,B0]
"""

import argparse
from pathlib import Path
from typing import Optional

import numpy as np
from PIL import Image


def img2coe12(
    imgfile: str,
    outfile: str,
    out_width: Optional[int] = None,
    out_height: Optional[int] = None,
    transparent_key: Optional[int] = 0xFFF,
) -> None:
    """
    Create .coe file from image (e.g. .jpg, .bmp, .png).
    Each pixel becomes one 12-bit word: RRRRGGGGBBBB (4 bits per channel).
    For images with transparency (e.g. PNG), transparent pixels are written as
    transparent_key (default pure white 0xFFF) so the driver can treat them as
    transparent and show the background.

    Args:
        imgfile: Path to input image file.
        outfile: Path to output .coe file.
        out_width: If set, resize image to this width before writing (default: keep original).
        out_height: If set, resize image to this height before writing (default: keep original).
        transparent_key: 12-bit value to write for transparent pixels (default 0xFFF = pure white).
    """
    img_pil = Image.open(imgfile)
    if img_pil.mode != "RGBA":
        img_pil = img_pil.convert("RGB")
    if out_width is not None and out_height is not None:
        try:
            resample = Image.Resampling.LANCZOS
        except AttributeError:
            resample = Image.LANCZOS  # Pillow < 9.1
        img_pil = img_pil.resize((out_width, out_height), resample)
    img = np.array(img_pil)
    height, width = img.shape[0], img.shape[1]
    has_alpha = img.ndim == 3 and img.shape[2] == 4
    # 12-bit transparent key for COE (default 0xFFF = pure white, driver treats as transparent)
    key_12 = transparent_key & 0xFFF
    key_bin = format(key_12, "012b")

    with open(outfile, "w") as f:
        f.write("; VGA Memory Map \n")
        f.write("; .COE file with bin coefficients \n")
        f.write(f"; Height: {height}, Width: {width}\n\n")
        f.write("memory_initialization_radix=2;\n")
        f.write("memory_initialization_vector=\n")

        # Brown (saddle brown) in 4-bit RGB: R=8, G=4, B=1
        brown_12 = (8 << 8) | (4 << 4) | 1
        brown_bin = format(brown_12, "012b")

        for r in range(height):
            for c in range(width):
                if has_alpha and img[r, c, 3] < 128:
                    f.write(key_bin + "\n")
                    continue
                R = img[r, c, 0] >> 4
                G = img[r, c, 1] >> 4
                B = img[r, c, 2] >> 4
                # Convert black pixels to brown
                if img[r, c, 0] == 0 and img[r, c, 1] == 0 and img[r, c, 2] == 0:
                    out_word = brown_bin
                else:
                    out_word = format(R, "04b") + format(G, "04b") + format(B, "04b")
                f.write(out_word + "\n")

        f.write(";")


if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        description="Convert an image to a Xilinx .coe file (12-bit RGB, 4 bits per channel)."
    )
    parser.add_argument(
        "image",
        type=str,
        help="Path to input image (e.g. .jpg, .bmp, .png)",
    )
    parser.add_argument(
        "output",
        type=str,
        nargs="?",
        default=None,
        help="Path to output .coe file (default: same name as image with .coe extension)",
    )
    parser.add_argument(
        "--size",
        type=int,
        nargs=2,
        metavar=("WIDTH", "HEIGHT"),
        default=None,
        help="Resize image to WIDTH x HEIGHT before writing .coe (e.g. --size 16 16 for 16x16)",
    )
    parser.add_argument(
        "--transparent-key",
        type=lambda s: int(s, 0),
        default=0xFFF,
        metavar="HEX",
        help="12-bit value for transparent pixels in hex (default: 0xFFF = pure white). Driver treats as transparent.",
    )
    args = parser.parse_args()

    imgfile = args.image
    outfile = args.output
    if outfile is None:
        outfile = Path(imgfile).with_suffix(".coe")

    out_size = args.size
    img2coe12(
        imgfile,
        str(outfile),
        out_width=out_size[0] if out_size else None,
        out_height=out_size[1] if out_size else None,
        transparent_key=args.transparent_key,
    )
    print(f"Wrote {outfile}")
