boy=imread('problem2.png');
imshow(boy);
PQ = paddedsize(size(boy));
F=fft2(boy,PQ(1),PQ(2));
F1=abs(F);
F1=log(F1+1);
F1=fftshift(F1);
F=fftshift(F);
figure()
imshow(F1,[])
[x,y]=ginput(4);
x=round(x);
y=round(y);
H1 =notch('btw', PQ(1),PQ(2),20,x(1), y(1));
H2= notch('btw', PQ(1), PQ(2),20,x(2), y(2));
H3 =notch('btw', PQ(1), PQ(2),20,x(3), y(3));
H4 =notch('btw', PQ(1), PQ(2),20,x(4), y(4));
FB = F.*H1.*H2.*H3.*H4;
FB=fftshift(FB);
FB=real(ifft2(FB));
B=FB(1:size(boy,1),1:size(boy,2));
B=uint8(B);
figure()
imshow(B)





