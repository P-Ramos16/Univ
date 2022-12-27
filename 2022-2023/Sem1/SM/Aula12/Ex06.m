clear all
[Image, ColorMap] = imread('Parede_8bit.bmp');


Save8bitImage("test.raw", Image);
[N, M, ImageLoaded] = Load8bitImage("test.raw");

Stream = EncodeImage_RLE(Image);
Save8bitStream("stream.raw", N, M, Stream);

[N, M, ImageLoaded] = Load8bitStream("stream.raw");

ImageDecoded = DecodeImage_RLE(N, M, Stream);

figure(1)
image(Image)
colormap(ColorMap);
colorbar

figure(2)
image(ImageDecoded)
colormap(ColorMap);
colorbar