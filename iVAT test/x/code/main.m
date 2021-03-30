% https://rdrr.io/cran/seriation/

clear all
%close all 
load('iris.mat')
 
clusters = max(class)
[n,p]=size(data);
total_no_of_points = n;
colors1=colormap;
colors=zeros(clusters,3);
for i=1:clusters
    colors(i,:)=colors1(ceil(length(colors1)*i/clusters),:);
end

R=pdist2(data,data); % pairwise distances

% % Rscale
% 
%    psi=1000;
%     eta=0.2;
%    [ data ] = ReScale( psi,eta,data);  
%    R=pdist2(data,data); % pairwise distances  

%  % Gaussian kernel
%  sig=0.1;
%  R = GaussianKernelDis(data, sig);
%  
 %% Adaptive Gaussian kernel
 % k=ceil(0.1*n);
 % = AdaptiveGaussianDis(data, k);
 
%  % Isolation Kernel
%   psi=4;
%   [ R ] = aNNEdis (R, psi, 200);
 
 %% Discale
 % eta=0.4;
 % [ R ] = DScale(R,eta, size(data,2)); 

 %% iVAT

VATflag=0;
cutflag=0;
% RV (n*n double): VAT-reordered dissimilarity data
% C (n int): Connection indexes of MST
% I (n int): Reordered indexes of R, the input data
% cut (n double): MST link cut magnitude
[rv,C,I,ri,cut]=Vat(R);

[cuts,ind]=sort(cut,'descend')%对cut进行排序，cut列出排序后的顺序；以及包含cut相应索引的ind
ind=sort(ind(1:clusters-1))%聚类数量减一的索引数目

% Pi=zeros(n,1);%Pi是一个nx1的矩阵（全是0）
% zhang = ind(1)-1
% Pi(I(1:ind(1)-1))=1;
% Pi(I(ind(end):end))=clusters
% da = ind(end)
% for k=2:clusters-1
%     Pi(I(ind(k-1):ind(k)-1))=k;
% end


[RiV,RV,reordering_mat]=iVat(rv,1);
%[RiV,RV,vMinWeights] = iVat(R,VATflag);

figure;
imagesc(rv); colormap(gray); axis image; axis off;
title('VAT reordered dissimilarity matrix image')

figure;
imagesc(RiV); colormap(gray); axis image; axis off;
title('iVAT dissimilarity matrix image')

x=data;
Pitrue=x(:,end);


% figure;
% for i=1:length(I)-1
%     x_cor=[x(I(i),1) x(I(C(i)),1)];
%     y_cor=[x(I(i),2) x(I(C(i)),2)];
%     plot(x_cor,y_cor,'b');
%     hold on
% end
% for i=1:length(ind)
%     x_cor=[x(I(ind(i)),1) x(I(C(ind(i))),1)];
%     y_cor=[x(I(ind(i)),2) x(I(C(ind(i))),2)];
%     plot(x_cor,y_cor,'g');
%     hold on
% end
% plot(x(I,1),x(I,2),'r.');
% axis equal
% title('MST of the dataset (longest 3 edges are shown in green)')
% 
% cluster_matrix_mod=zeros(1,total_no_of_points);
% length_partition=zeros(1,clusters);
%     for i=1:clusters
%         length_partition(i)=length(find(Pi==i));
%     end
% [length_partition_sort,length_partition_sort_idx]=sort(length_partition,'descend');
% index_remaining=1:clusters;
% for i=1:clusters
%     original_idx=length_partition_sort_idx(i);
%     partition=find(Pi==original_idx);
%     proposed_idx=mode(Pitrue(partition));
%     if(sum(index_remaining==proposed_idx)~=0)
%         proposed_idx;
%         cluster_matrix_mod(find(Pi==original_idx))=proposed_idx;
%     else
%         index_remaining(1);
%         cluster_matrix_mod(find(Pi==original_idx))=index_remaining(1);
%     end
%     index_remaining(index_remaining==proposed_idx)=[];
% end
% 
% figure;
% for i=1:clusters
%     i;
%     if(i==1)
%         partition=I(1:ind(i));
%     else if(i==(clusters))
%             partition=I(ind(i-1):length(I));
%         else
%         partition=I(ind(i-1):ind(i)-1);
%         end
%     end
%     plot(x(partition,1),x(partition,2),'.','color',colors(i,:));
%     hold on;
% end
% axis equal;
% title('VAT generated partition of the dataset (different colors represent different clusters)');
% 
% crct_prct_clusivat=((length(x)-length(find((Pitrue-cluster_matrix_mod'~=0))))/(length(x)))*100

