clear all
[Image, ColorMap] = imread('Parede_8bit.bmp');


Save8bitImage("test.raw", Image);
[N, M, ImageLoaded] = Load8bitImage("test.raw");

Stream = EncodeImage_RLE(Image);
Save8bitStream("stream.raw", N, M, Stream);