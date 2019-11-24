f = imread('char.tif');
PQ = paddedsize(size(f));

F = fft2(f,PQ(1),PQ(2));
F = fftshift(F);

y = 0;

figure;
for x = 1:8
    y = y+25;
    H = lpfilter('ideal',PQ(1),PQ(2),y);
    H = 1-H;

    G=H.*F;

    G=ifftshift(G);
    g = real(ifft2(G));
    g = g(1:size(f,1),1:size(f,2));
    g = uint8(g);
    %b(688,688,x) = g;
    subplot(4,4,x);imshow(g);title('ideal');
end

y=0;

for x = 9:16
    y = y+25;
    H = lpfilter('btw',PQ(1),PQ(2),y);
    H = 1-H;

    G=H.*F;

    G=ifftshift(G);
    g = real(ifft2(G));
    g = g(1:size(f,1),1:size(f,2));
    g = uint8(g);
    %b(688,688,x) = g;
    subplot(4,4,x);imshow(g);title('Butterworth');
end


