clc, clear all, close all;
src=uiuc_src('uiuc-texture-gray-256x256-CASIAV3names');

filt_opt.J=5;%numero di scale
scat_opt.oversampling=0;
Wop=wavelet_factory_2d([480, 640], filt_opt, scat_opt);
feature{1}=@(x)(sum(sum(format_scat(scat(x,Wop)),2),3));%estraggo le feature che mi interessano
options.parallel=0;
db=prepare_database(src, feature, options);% applico il metodo di estrazioni delle feature a tutti le immagini del db
%cioè  tutte le scattering fun

%il sw mi da due tipi di classificatori: PCA e SVM
%uso SVM
%definisco parte di train e testing
prop=0.5; %proporzione del training, usualmente 70
[train_set, test_set] = create_partition(src, prop);

%definisco il tipo di kernel(svm)
options.kernel_type='linear';
options.C=8;%varibile di slack, se svm non converge, cioè
% non trova piano di separazione per le variabili, allora
%ho un rilassamento dei vincoli

%faccio il training del modello
model = svm_train(db, train_set, options);

%vado a testarlo:
labels=svm_test(db,model,test_set);

%accuracy = sum(testImds.Labels == predlabels)./numel(testImds.Labels)*100

%calcolo l'errore:
errore= classif_err(labels, test_set, src)*100;

%figure;
%confusionchart(testImds.Labels,predlabels)
%title('Test-Set Confusion Matrix -- Wavelet Scattering')