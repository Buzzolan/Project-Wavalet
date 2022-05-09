%% train della cnn mediante dettagli orizzontali verticali ed obliqui estratti tramite dwt2
imds = imageDatastore('data_transform','IncludeSubfolders',true,'LabelSource','foldernames');


%% Creo training e validation set
numTrainFiles = 32; 
[imdsTrain,imdsValidation] = splitEachLabel(imds,numTrainFiles,'randomize'); %creo immagini di training e di validation

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
title('Test-Set Confusion Matrix -- Wavelet Scattering')





