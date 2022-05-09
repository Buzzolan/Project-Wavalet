%  Per progetto scatterogramma delle texture come input a una CNN
src=uiuc_src('uiuc-texture-gray-256x256-CASIAV3names');

filt_opt.J=5;%numero di scale
scat_opt.oversampling=0;
Wop=wavelet_factory_2d([480, 640], filt_opt, scat_opt);
feature{1}=@(x)(sum(sum(format_scat(scat(x,Wop)),2),3));%estraggo le feature che mi interessano, sono i coeff scatering
options.parallel=0;
db=prepare_database(src, feature, options);% applico il metodo di estrazioni delle feature a tutti le immagini del db
%cioè  tutte le scattering fun