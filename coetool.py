
"""
    Copyright (c) 2014 Javier Quintano Merino aka jaXvi
    
    This file is part of Coetool.

    Coetool is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    Coetool is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with Coetool. If not, see <http://www.gnu.org/licenses/>.

"""

import sys
import argparse
from coetoolcore import *
from coetoolgui import *


def main():
    
    parser = argparse.ArgumentParser(description='coetool: convert from .coe file (VGA mem) to image file and vice versa', epilog='Example: coetool --convert rom_vga.coe outimage.jpg')
    parser.add_argument('-c', '--convert', metavar='FILE', nargs=2, help='convert from IN_FILE to OUT_FILE (supported output formats: bmp, jpg, png, and coe )' )
    args = parser.parse_args()
    if args.convert: 
        convert(args.convert[0], args.convert[1])
    else:
        run_gui()
    
def run_gui():
    print('run gui')
    
    app = QApplication(sys.argv)
    coetoolgui = CoetoolGui()
    coetoolgui.show()
    sys.exit(app.exec_())
    
        
def convert(in_file, out_file):
    
    in_file_ext = in_file.rsplit('.',maxsplit=1)[1].lower()
    out_file_ext = out_file.rsplit('.',maxsplit=1)[1].lower()
    
    conversion = CoeConverter(in_file)
    
    if in_file_ext != 'coe' and out_file_ext != 'coe' :
        print('No .coe file')
    
    elif in_file_ext == 'coe':
            
        if out_file_ext not in ['bmp', 'jpg', 'png']:
            print('img extension unknown')
        else:
            conversion.exportImg(out_file, out_file_ext)
    
    else:
        if in_file_ext not in ['bmp', 'jpg', 'png']:
            print('img format not supported')
        else:
            conversion.createCoe(out_file)
            print('file ' + out_file + ' written to disk')


if __name__ == '__main__':
    main()
    