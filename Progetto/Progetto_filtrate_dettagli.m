%% train della cnn mediante dettagli orizzontali verticali ed obliqui estratti tramite dwt2
imds = imageDatastore('data_transform','IncludeSubfolders',true,'LabelSource','foldernames');
filter='db4';


%Classe1
for i = 1:40
    x=imread(imds.Files{i});
    [cA,cH,cV,cD]=dwt2(x,filter,'mode','per');
    
    Filename=sprintf('imgDettagli%d.tif',i);
    Filename_new=strcat('C:\Users\tomma\Documents\Università\Intelligenza Visuale\Lab_wavelet\Progetto\Filtrata_dettagli\1\',Filename);
    image_dettagli= cat(2,[cA;cV],[cH;cD]);
    normalizedData = mat2gray(image_dettagli);
    imwrite(normalizedData, Filename_new);
    
end
%Classe2
for i = 441:480
    x=imread(imds.Files{i});
    [cA,cH,cV,cD]=dwt2(x,filter,'mode','per');
    
    Filename=sprintf('imgDettagli%d.tif',i);
    Filename_new=strcat('C:\Users\tomma\Documents\Università\Intelligenza Visuale\Lab_wavelet\Progetto\Filtrata_dettagli\2\',Filename);
    image_dettagli= cat(2,[cA;cV],[cH;cD]);
    normalizedData = mat2gray(image_dettagli);
    imwrite(normalizedData, Filename_new);
    
end
%Classe4
for i = 721:760
    x=imread(imds.Files{i});
    [cA,cH,cV,cD]=dwt2(x,filter,'mode','per');
    
    Filename=sprintf('imgDettagli%d.tif',i);
    Filename_new=strcat('C:\Users\tomma\Documents\Università\Intelligenza Visuale\Lab_wavelet\Progetto\Filtrata_dettagli\4\',Filename);
    image_dettagli= cat(2,[cA;cV],[cH;cD]);
    normalizedData = mat2gray(image_dettagli);
    imwrite(normalizedData, Filename_new);
end

%Classe5
for i = 761:800
    x=imread(imds.Files{i});
    [cA,cH,cV,cD]=dwt2(x,filter,'mode','per');
    
    Filename=sprintf('imgDettagli%d.tif',i);
    Filename_new=strcat('C:\Users\tomma\Documents\Università\Intelligenza Visuale\Lab_wavelet\Progetto\Filtrata_dettagli\5\',Filename);
    image_dettagli= cat(2,[cA;cV],[cH;cD]);
    normalizedData = mat2gray(image_dettagli);
    imwrite(normalizedData, Filename_new);
    
end

%Classe6
for i = 801:840
    x=imread(imds.Files{i});
    [cA,cH,cV,cD]=dwt2(x,filter,'mode','per');
    
    Filename=sprintf('imgDettagli%d.tif',i);
    Filename_new=strcat('C:\Users\tomma\Documents\Università\Intelligenza Visuale\Lab_wavelet\Progetto\Filtrata_dettagli\6\',Filename);
    image_dettagli= cat(2,[cA;cV],[cH;cD]);
    normalizedData = mat2gray(image_dettagli);
    imwrite(normalizedData, Filename_new);
    
end

%Class7
for i = 841:880
    x=imread(imds.Files{i});
    [cA,cH,cV,cD]=dwt2(x,filter,'mode','per');
    
    Filename=sprintf('imgDettagli%d.tif',i);
    Filename_new=strcat('C:\Users\tomma\Documents\Università\Intelligenza Visuale\Lab_wavelet\Progetto\Filtrata_dettagli\7\',Filename);
    image_dettagli= cat(2,[cA;cV],[cH;cD]);
    normalizedData = mat2gray(image_dettagli);
    imwrite(normalizedData, Filename_new);
    
end

%Class8
for i = 881:920
   x=imread(imds.Files{i});
    [cA,cH,cV,cD]=dwt2(x,filter,'mode','per');
    
    Filename=sprintf('imgDettagli%d.tif',i);
    Filename_new=strcat('C:\Users\tomma\Documents\Università\Intelligenza Visuale\Lab_wavelet\Progetto\Filtrata_dettagli\8\',Filename);
    image_dettagli= cat(2,[cA;cV],[cH;cD]);
    normalizedData = mat2gray(image_dettagli);
    imwrite(normalizedData, Filename_new);
end

%Class9
for i = 921:960
    x=imread(imds.Files{i});
    [cA,cH,cV,cD]=dwt2(x,filter,'mode','per');
    
    Filename=sprintf('imgDettagli%d.tif',i);
    Filename_new=strcat('C:\Users\tomma\Documents\Università\Intelligenza Visuale\Lab_wavelet\Progetto\Filtrata_dettagli\9\',Filename);
    image_dettagli= cat(2,[cA;cV],[cH;cD]);
    normalizedData = mat2gray(image_dettagli);
    imwrite(normalizedData, Filename_new);
    
end

%Classe10
for i = 41:80
    x=imread(imds.Files{i});
    [cA,cH,cV,cD]=dwt2(x,filter,'mode','per');
    
    Filename=sprintf('imgDettagli%d.tif',i);
    Filename_new=strcat('C:\Users\tomma\Documents\Università\Intelligenza Visuale\Lab_wavelet\Progetto\Filtrata_dettagli\10\',Filename);
    image_dettagli= cat(2,[cA;cV],[cH;cD]);
    normalizedData = mat2gray(image_dettagli);
    imwrite(normalizedData, Filename_new);
    
end

%Class11
for i = 81:120
    x=imread(imds.Files{i});
    [cA,cH,cV,cD]=dwt2(x,filter,'mode','per');
    
    Filename=sprintf('imgDettagli%d.tif',i);
    Filename_new=strcat('C:\Users\tomma\Documents\Università\Intelligenza Visuale\Lab_wavelet\Progetto\Filtrata_dettagli\11\',Filename);
    image_dettagli= cat(2,[cA;cV],[cH;cD]);
    normalizedData = mat2gray(image_dettagli);
    imwrite(normalizedData, Filename_new);
    
end

%Class12
for i = 121:160
    x=imread(imds.Files{i});
    [cA,cH,cV,cD]=dwt2(x,filter,'mode','per');
    
    Filename=sprintf('imgDettagli%d.tif',i);
    Filename_new=strcat('C:\Users\tomma\Documents\Università\Intelligenza Visuale\Lab_wavelet\Progetto\Filtrata_dettagli\12\',Filename);
    image_dettagli= cat(2,[cA;cV],[cH;cD]);
    normalizedData = mat2gray(image_dettagli);
    imwrite(normalizedData, Filename_new);
    
end

%Class13
for i = 161:200
    x=imread(imds.Files{i});
    [cA,cH,cV,cD]=dwt2(x,filter,'mode','per');
    
    Filename=sprintf('imgDettagli%d.tif',i);
    Filename_new=strcat('C:\Users\tomma\Documents\Università\Intelligenza Visuale\Lab_wavelet\Progetto\Filtrata_dettagli\13\',Filename);
    image_dettagli= cat(2,[cA;cV],[cH;cD]);
    normalizedData = mat2gray(image_dettagli);
    imwrite(normalizedData, Filename_new);
    
end

%Class14
for i = 201:240
    x=imread(imds.Files{i});
    [cA,cH,cV,cD]=dwt2(x,filter,'mode','per');
    
    Filename=sprintf('imgDettagli%d.tif',i);
    Filename_new=strcat('C:\Users\tomma\Documents\Università\Intelligenza Visuale\Lab_wavelet\Progetto\Filtrata_dettagli\14\',Filename);
    image_dettagli= cat(2,[cA;cV],[cH;cD]);
    normalizedData = mat2gray(image_dettagli);
    imwrite(normalizedData, Filename_new);
    
end

%Class15
for i = 241:280
    x=imread(imds.Files{i});
    [cA,cH,cV,cD]=dwt2(x,filter,'mode','per');
    
    Filename=sprintf('imgDettagli%d.tif',i);
    Filename_new=strcat('C:\Users\tomma\Documents\Università\Intelligenza Visuale\Lab_wavelet\Progetto\Filtrata_dettagli\15\',Filename);
    image_dettagli= cat(2,[cA;cV],[cH;cD]);
    normalizedData = mat2gray(image_dettagli);
    imwrite(normalizedData, Filename_new);
    
end

%Class16
for i = 281:320
    x=imread(imds.Files{i});
    [cA,cH,cV,cD]=dwt2(x,filter,'mode','per');
    
    Filename=sprintf('imgDettagli%d.tif',i);
    Filename_new=strcat('C:\Users\tomma\Documents\Università\Intelligenza Visuale\Lab_wavelet\Progetto\Filtrata_dettagli\16\',Filename);
    image_dettagli= cat(2,[cA;cV],[cH;cD]);
    normalizedData = mat2gray(image_dettagli);
    imwrite(normalizedData, Filename_new);
    
end

%Class17
for i = 321:360
    x=imread(imds.Files{i});
    [cA,cH,cV,cD]=dwt2(x,filter,'mode','per');
    
    Filename=sprintf('imgDettagli%d.tif',i);
    Filename_new=strcat('C:\Users\tomma\Documents\Università\Intelligenza Visuale\Lab_wavelet\Progetto\Filtrata_dettagli\17\',Filename);
    image_dettagli= cat(2,[cA;cV],[cH;cD]);
    normalizedData = mat2gray(image_dettagli);
    imwrite(normalizedData, Filename_new);
    
end

%Class18
for i = 361:400
    x=imread(imds.Files{i});
    [cA,cH,cV,cD]=dwt2(x,filter,'mode','per');
    
    Filename=sprintf('imgDettagli%d.tif',i);
    Filename_new=strcat('C:\Users\tomma\Documents\Università\Intelligenza Visuale\Lab_wavelet\Progetto\Filtrata_dettagli\18\',Filename);
    image_dettagli= cat(2,[cA;cV],[cH;cD]);
    normalizedData = mat2gray(image_dettagli);
    imwrite(normalizedData, Filename_new);
    
end

%Class19
for i = 401:440
    x=imread(imds.Files{i});
    [cA,cH,cV,cD]=dwt2(x,filter,'mode','per');
    
    Filename=sprintf('imgDettagli%d.tif',i);
    Filename_new=strcat('C:\Users\tomma\Documents\Università\Intelligenza Visuale\Lab_wavelet\Progetto\Filtrata_dettagli\19\',Filename);
    image_dettagli= cat(2,[cA;cV],[cH;cD]);
    normalizedData = mat2gray(image_dettagli);
    imwrite(normalizedData, Filename_new);
    
end

%Class20
for i = 481:520
    x=imread(imds.Files{i});
    [cA,cH,cV,cD]=dwt2(x,filter,'mode','per');
    
    Filename=sprintf('imgDettagli%d.tif',i);
    Filename_new=strcat('C:\Users\tomma\Documents\Università\Intelligenza Visuale\Lab_wavelet\Progetto\Filtrata_dettagli\20\',Filename);
    image_dettagli= cat(2,[cA;cV],[cH;cD]);
    normalizedData = mat2gray(image_dettagli);
    imwrite(normalizedData, Filename_new);
    
end

%Class 21
for i = 521:560
    x=imread(imds.Files{i});
    [cA,cH,cV,cD]=dwt2(x,filter,'mode','per');
    
    Filename=sprintf('imgDettagli%d.tif',i);
    Filename_new=strcat('C:\Users\tomma\Documents\Università\Intelligenza Visuale\Lab_wavelet\Progetto\Filtrata_dettagli\21\',Filename);
    image_dettagli= cat(2,[cA;cV],[cH;cD]);
    normalizedData = mat2gray(image_dettagli);
    imwrite(normalizedData, Filename_new);
    
end

%Class 22
for i = 561:600
    x=imread(imds.Files{i});
    [cA,cH,cV,cD]=dwt2(x,filter,'mode','per');
    
    Filename=sprintf('imgDettagli%d.tif',i);
    Filename_new=strcat('C:\Users\tomma\Documents\Università\Intelligenza Visuale\Lab_wavelet\Progetto\Filtrata_dettagli\22\',Filename);
    image_dettagli= cat(2,[cA;cV],[cH;cD]);
    normalizedData = mat2gray(image_dettagli);
    imwrite(normalizedData, Filename_new);
    
end

%Class23
for i = 601:640
    x=imread(imds.Files{i});
    [cA,cH,cV,cD]=dwt2(x,filter,'mode','per');
    
    Filename=sprintf('imgDettagli%d.tif',i);
    Filename_new=strcat('C:\Users\tomma\Documents\Università\Intelligenza Visuale\Lab_wavelet\Progetto\Filtrata_dettagli\23\',Filename);
    image_dettagli= cat(2,[cA;cV],[cH;cD]);
    normalizedData = mat2gray(image_dettagli);
    imwrite(normalizedData, Filename_new);
    
end

%Class 24
for i = 641:680
    x=imread(imds.Files{i});
    [cA,cH,cV,cD]=dwt2(x,filter,'mode','per');
    
    Filename=sprintf('imgDettagli%d.tif',i);
    Filename_new=strcat('C:\Users\tomma\Documents\Università\Intelligenza Visuale\Lab_wavelet\Progetto\Filtrata_dettagli\24\',Filename);
    image_dettagli= cat(2,[cA;cV],[cH;cD]);
    normalizedData = mat2gray(image_dettagli);
    imwrite(normalizedData, Filename_new);
    
end

%Class25
for i = 681:720
    x=imread(imds.Files{i});
    [cA,cH,cV,cD]=dwt2(x,filter,'mode','per');
    
    Filename=sprintf('imgDettagli%d.tif',i);
    Filename_new=strcat('C:\Users\tomma\Documents\Università\Intelligenza Visuale\Lab_wavelet\Progetto\Filtrata_dettagli\25\',Filename);
    image_dettagli= cat(2,[cA;cV],[cH;cD]);
    normalizedData = mat2gray(image_dettagli);
    imwrite(normalizedData, Filename_new);
    
end

Dettagli_lowpass_imds= imageDatastore('Filtrata_dettagli','IncludeSubfolders',true,'LabelSource','foldernames');

%% Creo training e validation set
numTrainFiles = 32; 
[imdsTrain,imdsValidation] = splitEachLabel(Dettagli_lowpass_imds,numTrainFiles,'randomize'); %creo immagini di training e di validation

filter_size=5;
filter_numbers=15;
lgraph = layerGraph;
layers =[
    imageInputLayer([256 256 1],'Name','input') %dimensione immagine di input ( se a colori ho 3 canali, qui ne ho 4)
    
    convolution2dLayer(filter_size,filter_numbers, 'Padding','same','Name','conv_1')%dim_filtro, numero_filtri, immagine di outup deve avere stessa dimensione immagine di input
    %quindi ho 8 immagini 256 x 256. Poi tutti i layer convolutivi sono seguiti da:
    batchNormalizationLayer('Name','Norm_1') %normalizzare il dato
    reluLayer('Name','relu_1') % così funzione di attivazione si basa su dati normalizzati
    
    maxPooling2dLayer(2, 'Stride',2,'Name','Max_pooling_1')%sottocampionamento di due e prendo il massimo valore in un rettangolo [2,2]
    
    %ripeto i layer 
    convolution2dLayer(filter_size+5,filter_numbers*2, 'Padding','same','Name','conv_2')
    batchNormalizationLayer('Name','Norm_2')
    reluLayer('Name','relu_2')
    
    maxPooling2dLayer(2, 'Stride',2,'Name','Max_pooling_2')
    
    convolution2dLayer(filter_size+10,filter_numbers*4, 'Padding','same','Name','conv_3')
    batchNormalizationLayer('Name','Norm_3')
    reluLayer('Name','relu_3') 
    
    maxPooling2dLayer(2, 'Stride',2,'Name','Max_pooling_3')
    
    convolution2dLayer(filter_size+15,filter_numbers*8, 'Padding','same','Name','conv_4')
    batchNormalizationLayer('Name','Norm_4')
    reluLayer('Name','relu_4') 
    
    maxPooling2dLayer(2, 'Stride',2,'Name','Max_pooling_4')
    
    convolution2dLayer(filter_size+20,filter_numbers*16, 'Padding','same','Name','conv_5')
    batchNormalizationLayer('Name','Norm_5')
    reluLayer('Name','relu_5') 
    
    %maxPooling2dLayer(2, 'Stride',2,'Name','Max_pooling_5')
    
    %convolution2dLayer(filter_size+20,filter_numbers*32, 'Padding','same','Name','conv_6')
    %batchNormalizationLayer('Name','Norm_6')
    %reluLayer('Name','relu_6') 
    
    
    fullyConnectedLayer(24,'Name','fullyCon_1')%fa la classificanzione e in input ho il numero di calssi
    softmaxLayer('Name','softmax')%mi da le probabilità dell'immagine che appartiene ad ogni singolo layer
    classificationLayer('Name','ClassifyLayer')];%prende il max e classifica l'immagine

lgraph = addLayers(lgraph,layers);
figure
plot(lgraph)

options = trainingOptions('sgdm', ...
    'MiniBatchSize',30, ...
    'InitialLearnRate',0.0001, ...
    'MaxEpochs',50, ...
    'Shuffle','every-epoch', ...
    'ValidationData',imdsValidation  , ...
    'ValidationFrequency',10, ...
    'Verbose',false, ...
    'Plots','training-progress');


net= trainNetwork(imdsTrain , layers, options); %faccio il training


%% Verifica

YPred = classify(net,imdsValidation);
YValidation = imdsValidation.Labels; 

accuracy = sum(YPred == YValidation)/numel(YValidation)

figure;
confusionchart(YValidation,YPred)
title('Test-Set Confusion Matrix -- lowpass e dettagli')





