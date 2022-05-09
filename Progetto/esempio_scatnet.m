x = uiuc_sample;
imagesc(x);
colormap gray;

Wop = wavelet_factory_2d(size(x));%ho i miei banchi di filtri, in ogni cella ho operzione delle scatterign wavalet
%wavelet_factory_2d_pyramid è più  veloce invariante solo alla traslazione
%wavelet_factory_3d invariante anche alla rotazione 

%estraggo filtri:
filt_opt.J=5; % 5 scale
filt_opt.L=6; % 6 rotazioni
scat_opt.oversampling = 2
[X_wop, filters ]= wavelet_factory_2d(size(x), filt_opt, scat_opt);
display_filter_bank_2d(filters); %vedo filtri
S = scat(x, Wop); %ricavo coeff scattering dell'immagine x
% [S,U]=scat(x,Wop); %altra opzione

S_mat = format_scat(S); %per vedere meglio risultati, 1D indici dei vai path della s attering transofr  e poi coordinate spaziali campionate dell'immagine 
%di partenza che posso usare come feature per la classificazione 
image_scat(S) %mostra coeff scattering
S{1}.signal{1}

j1 = 0;
j2 = 2;
theta1 = 1;
theta2 = 5;
p = find( S{3}.meta.j(1,:) == j1 & ...
    S{3}.meta.j(2,:) == j2 & ...
    S{3}.meta.theta(1,:) == theta1 & ...
    S{3}.meta.theta(2,:) == theta2 );

imagesc(S{3}.signal{p});

%%
src = uiuc_src('uiuc-texture-gray-256x256-CASIAV3names');%sorgente path

filt_opt.J = 5;%numero di scale
scat_opt.oversampling = 0;%no oversampling
scat_opt.M=5;
Wop = wavelet_factory_2d([256, 256], filt_opt, scat_opt);
features{1} = @(x)(sum(sum(format_scat(scat(x,Wop)),2),3));%tipo di feature estratte, ho vettore di feature
%poi do il vettore in pasto alla svm

options.parallel = 0;
db = prepare_database(src, features, options);%ho un vettore di feature per ogni immagine

% proportion of training example
prop = 0.5;%ne caso di poche classi metto 0.8 per testing e 0.2 per test
% split between training and testing
[train_set, test_set] = create_partition(src, prop);
% dimension of the affine pca classifier qui faccio PCA
train_opt.dim = 20;
% training
model = affine_train(db, train_set, train_opt);
% testing
labels = affine_test(db, model, test_set);
% compute the error
error = classif_err(labels, test_set, src);
%calcola anche accuracy basandosi su lables(predette) e test_set(contiene
%il ground truth)