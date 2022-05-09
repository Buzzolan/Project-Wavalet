function features = helperScatImages(sf,x)
% This function is only to support examples in the Wavelet Toolbox.
% It may change or be removed in a future release.

% Copyright 2018 MathWorks

smat = featureMatrix(sf,x,'transform','log');
features = mean(mean(smat,2),3);
end