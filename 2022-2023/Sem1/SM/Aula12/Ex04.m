clear all
[Image, ColorMap] = imread('Parede_8bit.bmp');


Save8bitImage("test.raw", Image);
[N, M, ImageLoaded] = Load8bitImage("test.raw");
ImageLoaded = uint8(ImageLoaded);


Stream = EncodeImage_RLE(ImageLoaded)