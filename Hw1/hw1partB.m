I = imread('rices.png'); % Read the image
imshow(I);
axis on;
button = 1;
i = 1;
n = 1;
while button(i) == 1
   [x,y, button] = ginput(2)
   x_n(n) = x(i); % save all points you continue getting
   x_n(n) = y(i);
   hold on
   plot(x(i),y(i),'r')
   drawnow
   n=n+1;
end
