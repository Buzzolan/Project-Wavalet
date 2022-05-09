datasetPath = fullfile('./','uiuc-texture-gray-256x256-CASIAV3names');
imds = imageDatastore(datasetPath, 'IncludeSubfolders',true,'LabelSource','foldernames');%contiene riferimenti alle immagini
%i label sono i nomi delle cartelle


figure; 
perm = randperm(960,20); 
	for i = 1:20 subplot(4,5,i); 
	imshow(imds.Files{perm(i)}); 
end 
labelCount = countEachLabel(imds)
img = readimage(imds,1); size(img)
imshow(img)
%%
%numero di immagini per ogni classe all'interno del training
numTrainFiles = 32; 
[imdsTrain,imdsValidation] = splitEachLabel(imds,numTrainFiles,'randomize'); %creo immagini di training e di validation


layers = [ %guarda tutorial per descrizione di ogni layer
	imageInputLayer([256 256 1])%dati presi dalla cnn, dim immagini e numero di canali (1=scala grigio, 3=RGB)

	convolution2dLayer(9,15,'Padding','same')%filtri 3 per tre, 8 (numero di filtri) nodi, non sono ottimali per il nostro problema
    %l'immagine di output deve essere della stessa di input=Pudding 
    batchNormalizationLayer %layer di normalizzazione del dato cosi la relu si basa su dati normalizzati
	reluLayer

	maxPooling2dLayer(2,'Stride',2) %sottocampionamento di ordine di due= immagini 128x128	
	
	convolution2dLayer(9,30,'Padding','same')%ho 16 filtri applicati, quindi da 8 immagini ne ricavo 16
    batchNormalizationLayer 
	reluLayer 	

	maxPooling2dLayer(2,'Stride',2) %immagine 64x64	e sono 16x8 immagini
	
	convolution2dLayer(9,60,'Padding','same')%ho 32 filtri , quindi 8x18x32 immagini
    batchNormalizationLayer 
	reluLayer 	
    %ho 3 blocchi di convoluzione 
    convolution2dLayer(9,120,'Padding','same')%ho 32 filtri , quindi 8x18x32 immagini
    batchNormalizationLayer 
	reluLayer 	
    
    maxPooling2dLayer(2,'Stride',2) %immagine 64x64	e sono 16x8 immagini
    
    convolution2dLayer(9,240,'Padding','same')%ho 16 filtri applicati, quindi da 8 immagini ne ricavo 16
    batchNormalizationLayer 
	reluLayer 	

	fullyConnectedLayer(24) %mi serve come classificazione, in input ha il numero di classi
	softmaxLayer %restituisce probabilità di lassificazione per ogni immagine, prende output fully e applica fun soft e da probabiltà tra zero e uno e sommi ad uno. e probabilità di una immagine che appartenga ad una classe	
	classificationLayer]; %prende la probabilità più alta della classe e la classifica con quella 


options = trainingOptions('sgdm', ... 	
	'InitialLearnRate',0.0001, ... 	
	'MaxEpochs',10, ... 	
	'Shuffle','every-epoch', ... 	
	'ValidationData',imdsValidation, ... 	'ValidationFrequency',30, ... 
	'Verbose',false, ... 
    'ExecutionEnvironment', 'gpu',...
	'Plots','training-progress'); ...
    
%ricordati parametri e risultati con quei parametri

net = trainNetwork(imdsTrain,layers,options);%faccio il training della network

%classi predette
YPred = classify(net,imdsValidation);
YValidation = imdsValidation.Labels; 

accuracy = sum(YPred == YValidation)/numel(YValidation)

