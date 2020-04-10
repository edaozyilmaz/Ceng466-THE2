%{
Eda Özyılmaz 2171882
Hilal Ünal 2172112
%}

a1 = imread('./A1.png');
a2 = imread('./A2.png');
a3 = imread('./A3.png');

%--------A3.png---------
A3_height = size(a3, 1);
A3_width = size(a3, 2);

a3_shiftf = fftshift(fft2(a3));

M=fft2(a3);
M= fftshift(M);
ab = abs(M);
ab = (ab-min(min(ab)))./ (max(max(ab))).*255;
imwrite(ab,'parıltıilk_a3.png');


filter_a3 = ones(A3_height,A3_width);

dist1min = 280;
dist1max = 320;
dist2min = 65;
dist2max = 85;

mid_x = (A3_height-1)/2;
mid_y = (A3_width-1)/2;

for x=1:A3_height
    for y=1:A3_width
        
        dist = ((x-mid_x).^2 + (y-mid_y).^2).^0.5;
        %Ideal Low Pass filter
        if(dist>=30)
            filter_a3(x,y) = 0;
        end
    end
end
a3_mult = a3_shiftf .* filter_a3;
a3_output = ifft2(ifftshift(a3_mult));

imwrite(uint8(real(a3_output)), 'A3_output.png');
M=fft2(a3_output);
M= fftshift(M);
ab = abs(M);
ab = (ab-min(min(ab)))./ (max(max(ab))).*255;
imwrite(ab,'parıltıson_a3.png');

%--------A2.png---------
A2_height = size(a2, 1);
A2_width = size(a2, 2);

a2_shiftf = fftshift(fft2(a2));

M=fft2(a2);
M= fftshift(M);
ab = abs(M);
ab = (ab-min(min(ab)))./ (max(max(ab))).*255;
imwrite(ab,'parıltıilk_a2.png');

filter_a2 = ones(A2_height,A2_width);

dist3min = 280;
dist3max = 320;
dist4min = 62;
dist4max = 88;

mid_x = (A2_height-1)/2;
mid_y = (A2_width-1)/2;

for x=1:A2_height
    for y=1:A2_width
        
        dist = ((x-mid_x).^2 + (y-mid_y).^2).^0.5;
        if((dist<=dist3max && dist>=dist3min)||(dist<=dist4max && dist>=dist4min))
            filter_a2(x,y) = 0;
        end
    end
end
a2_mult = a2_shiftf .* filter_a2;
a2_output = ifft2(ifftshift(a2_mult));

imwrite(uint8(real(a2_output)), 'A2_output.png');

M=fft2(a2_output);
M= fftshift(M);
ab = abs(M);
ab = (ab-min(min(ab)))./ (max(max(ab))).*255;
imwrite(ab,'parıltıson_a2.png');

%--------A1.png---------
A1_height = size(a1, 1);
A1_width = size(a1, 2);

a1_shiftf = fftshift(fft2(a1));

M=fft2(a1);
M= fftshift(M);
ab = abs(M);
ab = (ab-min(min(ab)))./ (max(max(ab))).*255;
imwrite(ab,'parıltıilk_a1.png');

filter_a1 = ones(A1_height,A1_width);

dist3min = 280;
dist3max = 320;
dist4min = 62;
dist4max = 88;

mid_x = (A1_height-1)/2;
mid_y = (A1_width-1)/2;

for x=1:A1_height
    for y=1:A1_width
        
        dist = ((x-mid_x).^2 + (y-mid_y).^2).^0.5;
        if(dist>=20)
            filter_a1(x,y) = exp(-dist.^2/(2*(30.^2)));
        end
        if(dist>20 && y==mid_y+1) 
            filter_a1(x,y) = 0;
        end
    end
end
a1_mult = a1_shiftf .* filter_a1;
a1_output = ifft2(ifftshift(a1_mult));

imwrite(uint8(real(a1_output)), 'A1_output.png');

M=fft2(a1_output);
M= fftshift(M);
ab = abs(M);
ab = (ab-min(min(ab)))./ (max(max(ab))).*255;
imwrite(ab,'parıltıson_a1.png');
