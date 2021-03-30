clear all
load ('iris.mat')

[n,p]=size(data);
total_no_of_points = n;


R=pdist2(data,data);% pairwise distances

% Rscale
%  psi=1000;
%  eta=0.2;
%  [ data ] = ReScale( psi,eta,data);  
%  R=pdist2(data,data); % pairwise distances 
 
%  % Gaussian kernel
%  sig=0.1;
%  R = GaussianKernelDis(data, sig);

%  % Adaptive Gaussian kernel
%  k=ceil(0.1*n);
%  R= AdaptiveGaussianDis(data, k);

 % Isolation Kernel
%   psi=4;
%   [ R ] = aNNEdis (R, psi, 200);
  
%    % Discale
%  eta=0.4;
%  [ R ] = DScale(R,eta, size(data,2)); 

VATflag=0;
cutflag=0;

[rv,C,I,ri,cut]=Vat(R);

figure;
imagesc(rv); colormap(gray); axis image; axis off;
title('VAT reordered dissimilarity matrix image')

[RiV,RV,reordering_mat]=iVat(rv,1);

figure;
imagesc(RiV); colormap(gray); axis image; axis off;
title('iVAT dissimilarity matrix image')



%×¼È·ÐÔÅÐ¶Ï
% true_mem = [1,2,3];
% men = 
% grades = AMI(true_mem,mem)
