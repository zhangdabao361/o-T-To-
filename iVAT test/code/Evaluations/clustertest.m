%Matlab���г���
clear
load ('iris.mat')
load iris data;
load iris class;
X=data;
% 
% 
% X=[20,7;18,10;10,5;4,5;4,3]
Y=pdist(X);
SF=squareform(Y);
Z=linkage(Y,'single');
dendrogram(Z);%��ʾϵͳ������
T=cluster(Z,'maxclust',3);
true_mem = class;
mem = T;
fraction = ami(true_mem,mem)