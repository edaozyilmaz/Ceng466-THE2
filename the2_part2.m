%{
Eda Özyılmaz 2171882
Hilal Ünal 2172112
%}
clear;
clc;

b1 = imread('./B1.jpg');
b2 = imread('./B2.jpg');

%----------B1.png---------
B1_height = size(b1,1);
B1_width = size(b1,2);

b1_shiftf = fftshift(fft2(b1));

M=fft2(b1);
M= fftshift(M);
ab = abs(M);
ab = (ab-min(min(ab)))./ (max(max(ab))).*255;
imwrite(ab,'parıltıilk_b1.jpg');

filter_b1 = zeros(B1_height,B1_width);

mid_x = (B1_height-1)/2;
mid_y = (B1_width-1)/2;


for x=1:B1_height
    for y=1:B1_width
        
        dist = ((x-mid_x).^2 + (y-mid_y).^2).^0.5;
        %Ideal Low Pass filter
        if(dist>=30)
            filter_b1(x,y) = 1/(1+(30/dist).^2);
        end
    end
end
b1_mult = b1_shiftf .* filter_b1;
b1_output = ifft2(ifftshift(b1_mult));

imwrite(uint8(real(b1_output)), 'B1_output.jpg');
M=fft2(b1_output);
M= fftshift(M);
ab = abs(M);
ab = (ab-min(min(ab)))./ (max(max(ab))).*255;
imwrite(ab,'parıltıson_b1.jpg');


%----------B2.png---------
B2_height = size(b2,1);
B2_width = size(b2,2);

b2_shiftf = fftshift(fft2(b2));

M=fft2(b2);
M= fftshift(M);
ab = abs(M);
ab = (ab-min(min(ab)))./ (max(max(ab))).*255;
imwrite(ab,'parıltıilk_b2.jpg');

filter_b2 = zeros(B2_height,B2_width);

mid_x = (B2_height-1)/2;
mid_y = (B2_width-1)/2;


for x=1:B2_height
    for y=1:B2_width
        
        dist = ((x-mid_x).^2 + (y-mid_y).^2).^0.5;
        %Ideal Low Pass filter
        if(dist>=40)
            filter_b2(x,y) = 1/(1+(40/dist).^4);
        end
    end
end
b2_mult = b2_shiftf .* filter_b2;
b2_output = ifft2(ifftshift(b2_mult));

imwrite(uint8(real(b2_output)), 'B2_output.jpg');
M=fft2(b2_output);
M= fftshift(M);
ab = abs(M);
ab = (ab-min(min(ab)))./ (max(max(ab))).*255;
imwrite(ab,'parıltıson_b2.jpg');
