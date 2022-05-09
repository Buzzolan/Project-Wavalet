%% Scalogramma della dwt2 delle texture come input a una CNN
%estrazione delle feature
%non uso scattering ma DWT 2

%inizio con solo una immagine:
x = uiuc_sample;
imagesc(x);
colormap gray;

%scelgo il tipo di wavelet che vado ad utilizzare
%filter='bior4.4'; 

imds = imageDatastore('uiuc-texture-gray-256x256-CASIAV3names','IncludeSubfolders',true,'LabelSource','foldernames');
filter='haar';
v=imds.Files{1};
f=imread(v);
imshow(f);
%estraggo le feature dell'immagine e per l'estensioe ai bordi vado a
%periodizzare il segnale.
[cA,cH,cV,cD]=dwt2(f,filter,'mode','per');

%visualizzazione delle feature estratte:
subplot(2,2,1)
imagesc(cA)
colormap gray
title('Approximation')
subplot(2,2,2)
imagesc(cH)
colormap gray
title('Horizontal')
subplot(2,2,3)
imagesc(cV)
colormap gray
title('Vertical')
subplot(2,2,4)
imagesc(cD)
colormap gray
title('Diagonal')

%salvo immagine
image_ca= mat2gray(cA);
imwrite(image_ca, 'prova1.jpg');
%proviamo vari filtri e cerchiamo quale meglio cattura le feature.

%{
%creazione della struttura da dare in input alla CNN: deve essere [nxmx4]:
struttura=[cA;cH,;cV;cD];
input = reshape(struttura,[240,320,4]);
%size(input)

%creazione dati da dare in input alla CNN:
imds = imageDatastore('data_transform','IncludeSubfolders',true,'LabelSource','foldernames');
filter='haar';


for i = 1:40
    x=imread(imds.Files{i});
    [cA,cH,cV,cD]=dwt2(x,filter,'mode','per');
    struttura=[cA;cH,;cV;cD];
    input = reshape(struttura,[128,128,4]);
    
    Filename=sprintf('dati%d',i);
    Filename_new=strcat('C:\Users\tomma\Documents\Università\Intelligenza Visuale\Lab_wavelet\Progetto\Prova_File\Class1\',Filename);
    save(Filename_new,'input');
    
    %{
    Filename=sprintf('img_low_pass%d.jpg',i);
    Filename_new=strcat('C:\Users\tomma\Documents\Università\Intelligenza Visuale\Lab_wavelet\Progetto\Prova_File\Class1\Low_Pass\',Filename);
    save(Filename_new,'cA');
    
    Filename=sprintf('img_Horizontal%d.jpg',i);
    Filename_new=strcat('C:\Users\tomma\Documents\Università\Intelligenza Visuale\Lab_wavelet\Progetto\Prova_File\Class1\Horizontal\',Filename);
    save(Filename_new,'cH');
    
    Filename=sprintf('img_Vertical%d.jpg',i);
    Filename_new=strcat('C:\Users\tomma\Documents\Università\Intelligenza Visuale\Lab_wavelet\Progetto\Prova_File\Class1\Vertical\',Filename);
    save(Filename_new,'cV');
    
    Filename=sprintf('img_Diagonals%d.jpg',i);
    Filename_new=strcat('C:\Users\tomma\Documents\Università\Intelligenza Visuale\Lab_wavelet\Progetto\Prova_File\Class1\Diagonals\',Filename);
    save(Filename_new,'cD');
    %}
end



for i = 41:80
    x=imread(imds.Files{i});
    [cA,cH,cV,cD]=dwt2(x,filter,'mode','per');
    struttura=[cA;cH,;cV;cD];
    input = reshape(struttura,[128,128,4]);
    Filename=sprintf('dati%d',i);
    Filename_new=strcat('C:\Users\tomma\Documents\Università\Intelligenza Visuale\Lab_wavelet\Progetto\Prova_File\Class2\',Filename);
    save(Filename_new,'input');
end


for i = 81:120
    x=imread(imds.Files{i});
    [cA,cH,cV,cD]=dwt2(x,filter,'mode','per');
    struttura=[cA;cH,;cV;cD];
    input = reshape(struttura,[128,128,4]);
    Filename=sprintf('dati%d',i);
    Filename_new=strcat('C:\Users\tomma\Documents\Università\Intelligenza Visuale\Lab_wavelet\Progetto\Prova_File\Class4\',Filename);
    save(Filename_new,'input');
end

%}

%{
  x=imread(imds.Files{i});
    [cA,cH,cV,cD]=dwt2(x,filter,'mode','per');
    
    
    Filename=sprintf('img_low_pass%d.jpg',i);
    Filename_new=strcat('C:\Users\tomma\Documents\Università\Intelligenza Visuale\Lab_wavelet\Progetto\Low_Pass\Low_Pass_class1\',Filename);
    image_ca= mat2gray(cA);
    imwrite(image_ca, Filename_new);
    
    
    Filename=sprintf('img_Horizontal%d.jpg',i);
    Filename_new=strcat('C:\Users\tomma\Documents\Università\Intelligenza Visuale\Lab_wavelet\Progetto\Horizontal\Horizontal_class1\',Filename);
    image_ch= mat2gray(cH);
    imwrite(image_ch, Filename_new);
    
    Filename=sprintf('img_Vertical%d.jpg',i);
    Filename_new=strcat('C:\Users\tomma\Documents\Università\Intelligenza Visuale\Lab_wavelet\Progetto\Vertical\Vertical_class1\',Filename);
     image_cv= mat2gray(cV);
    imwrite(image_cv, Filename_new);
    
    Filename=sprintf('img_Diagonals%d.jpg',i);
    Filename_new=strcat('C:\Users\tomma\Documents\Università\Intelligenza Visuale\Lab_wavelet\Progetto\Diagonal\Diagonal_class1\',Filename);
    image_cd= mat2gray(cD);
    imwrite(image_cd, Filename_new);
    
%}
%creo un data store per ogni canale da dare in input alla cnn, nei
%rispettivi 4 canali ho: l'immagine passa basso, dettaglio verticali,
%orizzotali e obliqui.

%creazione della struttura da dare in input alla CNN: deve essere [nxmx4]:
struttura=[cA;cH,;cV;cD];
input = reshape(struttura,[240,320,4]);
%size(input)

%creazione dati da dare in input alla CNN:
imds = imageDatastore('data_transform','IncludeSubfolders',true,'LabelSource','foldernames');
filter='db4';


for i = 1:40
    x=imread(imds.Files{i});
    [cA,cH,cV,cD]=dwt2(x,filter,'mode','per');
    
    
    Filename=sprintf('img_low_pass%d.jpg',i);
    Filename_new=strcat('C:\Users\tomma\Documents\Università\Intelligenza Visuale\Lab_wavelet\Progetto\Low_Pass\1\',Filename);
    image_ca= mat2gray(cA);
    imwrite(image_ca, Filename_new);
    
    
    Filename=sprintf('img_Horizontal%d.jpg',i);
    Filename_new=strcat('C:\Users\tomma\Documents\Università\Intelligenza Visuale\Lab_wavelet\Progetto\Horizontal\Horizontal_class1\',Filename);
    image_ch= mat2gray(cH);
    imwrite(image_ch, Filename_new);
    
    Filename=sprintf('img_Vertical%d.jpg',i);
    Filename_new=strcat('C:\Users\tomma\Documents\Università\Intelligenza Visuale\Lab_wavelet\Progetto\Vertical\Vertical_class1\',Filename);
     image_cv= mat2gray(cV);
    imwrite(image_cv, Filename_new);
    
    Filename=sprintf('img_Diagonals%d.jpg',i);
    Filename_new=strcat('C:\Users\tomma\Documents\Università\Intelligenza Visuale\Lab_wavelet\Progetto\Diagonal\Diagonal_class1\',Filename);
    image_cd= mat2gray(cD);
    imwrite(image_cd, Filename_new);
    
end

LowPass_imds= imageDatastore('Low_Pass','IncludeSubfolders',true,'LabelSource','foldernames');
Vertical_imds= imageDatastore('Vertical','IncludeSubfolders',true,'LabelSource','foldernames');
Horizontal_imds= imageDatastore('Horizontal','IncludeSubfolders',true,'LabelSource','foldernames');
Diagonal_imds= imageDatastore('Diagonal','IncludeSubfolders',true,'LabelSource','foldernames');

Final_imds=combine(LowPass_imds,Vertical_imds,Horizontal_imds, Diagonal_imds);
%imds_new=imageDatastore('Prova_File','IncludeSubfolders',true,'LabelSource','foldernames');
%Creazione della CNN:
%imageDatastore è la struttura ottimizzata per usare le cnn in matlab.

%quante immagini abiamo per ogni classe:
labelCount= countEachLabel(LowPass_imds);
labels = LowPass_imds.Labels;
writematrix(labels,'labels.txt');
labelStore = tabularTextDatastore('labels.txt','TextscanFormats','%C',"ReadVariableNames",false);
labelStore.ReadSize = 1;
labelStoreCell = transform(labelStore,@setcat_and_table_to_cell);
labelStoreCell= categorical(LowPass_imds.Labels);
finalStore = combine(LowPass_imds,Vertical_imds,Horizontal_imds,Diagonal_imds,labelStoreCell);
Final_imds.read
%dimensione delle mie immagini:
img=read(Final_imds); %ho selezionato un'immagine, ho 256 x 256

%numero di immagini di training per ogni classe e il test e train:
numTrainFiles = 32;
[imdsTrain, imdsValidation] = splitEachLabel(imds, numTrainFiles,'randomize');


%vado a definire i layer della cnn:
layers=[
    imageInputLayer([128 128 4]) %dimensione immagine di input ( se a colori ho 3 canali, qui ne ho 4)
    
    convolution2dLayer(3,8, 'Padding','same')%dim_filtro, numero_filtri, immagine di outup deve avere stessa dimensione immagine di input
    %quindi ho 8 immagini 256 x 256. Poi tutti i layer convolutivi sono seguiti da:
    batchNormalizationLayer %normalizzare il dato
    reluLayer % così funzione di attivazione si basa su dati normalizzati
    
    maxPooling2dLayer(2, 'Stride',2)%sottocampionamento di due e prendo il massimo valore in un rettangolo [2,2]
    
    %ripeto i layer 
    convolution2dLayer(3,16, 'Padding','same')
    batchNormalizationLayer
    reluLayer 
    
    maxPooling2dLayer(2, 'Stride',2)
    
    convolution2dLayer(3,32, 'Padding','same')
    batchNormalizationLayer
    reluLayer 
    
    maxPooling2dLayer(2, 'Stride',2)
    
    fullyConnectedLayer(3)%fa la classificanzione e in input ho il numero di calssi
    softmaxLayer%mi da le probabilità dell'immagine che appartiene ad ogni singolo layer
    classificationLayer];%prende il max e classifica l'immagine

options = trainingOptions('sgdm', ...
    'InitialLearnRate',0.01, ...
    'MaxEpochs',4, ...
    'Shuffle','every-epoch', ...
    'ValidationData',Final_imds , ...
    'ValidationFrequency',30, ...
    'Verbose',false, ...
    'Plots','training-progress');

net= trainNetwork(Final_imds , layers, options); %faccio il training

Ypred=classify(net, imdsValidation);
YValidation= imdsValidation.Label;
accuracy= sum(Ypred=YValidation)/numel(YValidation);
    
    
    
    
