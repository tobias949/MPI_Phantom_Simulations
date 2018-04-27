Phantom=imread('Phantom_SIMPLE.bmp');

I=im2bw(Phantom,0.5);

Startfield=[-14.000000000000000e-03 -14.00000000000000e-03 0.000000000000000e+00];
Stopfield=[14.000000000000000e-03 14.00000000000000e-03 0.000000000000000e+00];

pix_coord(I,Startfield,Stopfield)