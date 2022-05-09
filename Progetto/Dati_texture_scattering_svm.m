%estrazione di feature grazie a scattering transform e classificazione con
%svm
Imds = imageDatastore('data_transform','IncludeSubfolders',true, 'LabelSource','foldernames');

%plotto 20 immagini di esempio
figure
numImages = 120;
rng(100);
perm = randperm(numImages,20);
for np = 1:20
    subplot(4,5,np);
    imshow(Imds.Files{perm(np)});
end

%framework per scattering
sf = waveletScattering2('ImageSize',[256 256],'InvarianceScale',128, ...
    'NumRotations',[8 8]);% 8 rotazioni per ogni banco di filtri
%quality factor[1 1] default, ho una wavelet per ottava

rng(10); %ripristina le impostazioni dei numeri casuali 
Imds = shuffle(Imds);%rimescolo il dataset
[trainImds,testImds] = splitEachLabel(Imds,0.8);%creo il training e il tasting set
%metto i mie dati in tall array così da rendere più efficace il calcolo dei
%dati
Ttrain = tall(trainImds);
Ttest = tall(testImds);
trainfeatures = cellfun(@(x)helperScatImages(sf,x),Ttrain,'UniformOutput',false);
testfeatures = cellfun(@(x)helperScatImages(sf,x),Ttest,'UniformOutput',false);

%Use tall's gather capability to concatenate all the training and test features.
Trainf = gather(trainfeatures);
trainfeatures = cat(2,Trainf{:});

Testf = gather(testfeatures);
testfeatures = cat(2,Testf{:});

%{
Il codice precedente risulta in due matrici con dimensioni di riga 681 e 
dimensione di colonna pari al numero di immagini rispettivamente nei set di 
addestramento e test(96, 24). Di conseguenza, ciascuna colonna è un vettore di caratteristiche 
per la sua immagine corrispondente. Le immagini originali contenevano 256x256 (65536) elementi.
I coefficienti di dispersione rappresentano una riduzione approssimativa di 4 volte
delle dimensioni di ciascuna immagine. 
%}

%classifico con PCA
model = helperPCAModel(trainfeatures,30,trainImds.Labels);
predlabels = helperPCAClassifier(testfeatures,model);

accuracy = sum(testImds.Labels == predlabels)./numel(testImds.Labels)*100

figure;
confusionchart(testImds.Labels,predlabels)
title('Test-Set Confusion Matrix -- Wavelet Scattering')


