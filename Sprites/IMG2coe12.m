function img2 = IMG2coe12(imgfile, outfile)

% Modified by Dugan Karnazes 
% Create .coe file from .jpg image
% .coe file contains 12-bit words (bytes)
% color byte: [R3,R2,R1,R0,G3,G2,G1,G0,B3,B2,B1,B0]
% img2 = IMG2coe8(imgfile, outfile)
% img2 is 12-bit color image
% imgfile = input .jpg file
% outfile = output .coe file
% Example:
% img2 = IMG2coe8('loons240x160.jpg', 'loons240x160.coe'); 
% To run the function in MATLAB  -> img2 = IMG2coe12('wario_red-bg_small.bmp','wario.coe')

img = imread(imgfile);
height = size(img, 1);
width = size(img, 2);
s = fopen(outfile, 'wb'); %opens the output file

fprintf(s,'%s\n','; VGA Memory Map ');
fprintf(s,'%s\n','; .COE file with bin coefficients ');
fprintf(s,'; Height: %d, Width: %d\n\n', height, width);
fprintf(s,'%s\n','memory_initialization_radix=2;'); 
fprintf(s,'%s\n','memory_initialization_vector=');

cnt = 0;
img2 = img;

for r=1:height
for c=1:width
cnt = cnt + 1;
R = bitshift(img(r,c,1),-4);
G = bitshift(img(r,c,2),-4);
B = bitshift(img(r,c,3),-4);
Rb = dec2bin(R,4);
Gb = dec2bin(G,4);
Bb = dec2bin(B,4);


Outbyte = [ Rb(1:4) Gb(1:4) Bb(1:4) ];
fprintf(s,'%s',Outbyte);
fprintf(s,'\n');
end 
end


fprintf(s,'%c',';');
fclose(s);
end
