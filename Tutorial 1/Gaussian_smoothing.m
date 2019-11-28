function output = Gaussian_smoothing(imageGreyScale,kernelSize,smoothArg)

h = fspecial('gaussian',kernelSize,smoothArg);
imageGreyScale = imfilter(imageGreyScale, h);

output = imageGreyScale;
end