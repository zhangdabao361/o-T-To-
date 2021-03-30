clear all
load('iris.mat')


%% 

[n,p]=size(data)
total_no_of_points = n
colors1=colormap;

RandIndex = randperm( length(data));
data = data( RandIndex,:)
%% 
clusters = max(class)
colors=zeros(clusters,3)%创建一个clusters行3列的0数组
for i=1:clusters
    colors(i,:)=colors1(ceil(length(colors1)*i/clusters),:);
end
%% 

% 距离算法

R=pdist2(data,data); % pairwise distances




[rv,C,I,ri,cut]=Vat(R);
[cuts,ind]=sort(cut,'descend');%对cut进行降序排序，cut列出排序后的顺序；以及包含cut相应索引的ind
ind=sort(ind(1:clusters-1));%聚类数量减一的索引数目
[RiV,RV,reordering_mat]=iVat(rv,1);


%% 
figure;
imagesc(rv); colormap(gray); axis image; axis off;
title('VAT reordered dissimilarity matrix image')

figure;
imagesc(RiV); colormap(gray); axis image; axis off;
title('iVAT dissimilarity matrix image')

x=data;
Pitrue=x(:,end);

%% 
figure;
for i=1:length(I)-1 %value I (n int): Reordered indexes of R, the input data
    x_cor=[x(I(i),1) x(I(C(i)),1)];% C (n int): Connection indexes of MST
    y_cor=[x(I(i),2) x(I(C(i)),2)];
    plot(x_cor,y_cor,'b');
    hold on
end
for i=1:length(ind)
    x_cor=[x(I(ind(i)),1) x(I(C(ind(i))),1)]; %包含cut相应索引的ind
    y_cor=[x(I(ind(i)),2) x(I(C(ind(i))),2)];
    plot(x_cor,y_cor,'g');
    hold on
end
plot(x(I,1),x(I,2),'r.');
axis equal
title('MST of the dataset')


%% 
Pi=zeros(n,1);%Pi是一个nx1的矩阵（全是0）
Pi(I(1:ind(1)-1))=1;
Pi(I(ind(end):end))=clusters;
for k=2:clusters-1
    Pi(I(ind(k-1):ind(k)-1))=k;
end

%% 
Pi


%% 
cluster_matrix_mod=zeros(1,total_no_of_points);
length_partition=zeros(1,clusters);
    for i=1:clusters
        length_partition(i)=length(find(Pi==i));
    end
[length_partition_sort,length_partition_sort_idx]=sort(length_partition,'descend');
index_remaining=1:clusters;
for i=1:clusters
    original_idx=length_partition_sort_idx(i);
    partition=find(Pi==original_idx);
    proposed_idx=mode(Pitrue(partition));
    if(sum(index_remaining==proposed_idx)~=0)
        proposed_idx;
        cluster_matrix_mod(find(Pi==original_idx))=proposed_idx;
    else
        index_remaining(1);
        cluster_matrix_mod(find(Pi==original_idx))=index_remaining(1);
    end
    index_remaining(index_remaining==proposed_idx)=[];
end


%% 
M = zeros(n,1);
%% 
figure;
for i=1:clusters
   
    i;
    if(i==1)
        partition=I(1:ind(i));
    else if(i==(clusters))
            partition=I(ind(i-1):length(I));
        else
        partition=I(ind(i-1):ind(i)-1);
        end
    end
    %plot(x(partition,1),x(partition,2),'.','color',colors(i,:));
    M(partition,1) = i
   % M(partition,2) = i
      partition ;
    %hold on;
%     x(partition,1)

%     m1= size(x(partition,1))
%     m2 = size(x(partition,2))
%     prct_x1 = zeros(m1,1)
    %% 
    prct_x2 = zeros(m2,1)
    zeros = (x(partition,1))
end
%% 
Q = sort(partition)
%% 
% axis equal;
% title('VAT generated partition of the dataset (different colors represent different clusters)');
% % 找到怎么给生成的最小生成树打标签。
crct_prct_ivat =((length(x)-length(find((Pitrue-cluster_matrix_mod'~=0))))/(length(x)))*100

% 
% true_mem = class;
% mem = Pi(I(ind(end):end));
% fraction = ami(true_mem,mem)