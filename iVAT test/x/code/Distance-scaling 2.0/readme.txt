These functions implement a distance scaling method based on density-ratio for discovering 
clusters with varying densities, proposed by Ye Zhu, Kai Ming Ting, and Maia Angelova: 
"A Distance Scaling Method to Improve Density-based Clustering" published on PAKDD 2018 
https://doi.org/10.1007/978-3-319-93040-4_31

Written by Ye Zhu and Xiaoyu Qin, Deakin University, Feb 2018, version 2.0


This software is under GNU General Public License version 3.0 (GPLv3)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Abstract of the paper

Density-based clustering is able to find clusters of arbitrary sizes and shapes while effectively separating noise. Despite its 
advantage over other types of clustering, it is well-known that most density-based algorithms face the same challenge of finding 
clusters with varied densities. Recently, ReScale, a principled density-ratio preprocessing technique, enables a density-based 
clustering algorithm to identify clusters with varied densities. However, because the technique is based on one-dimensional 
scaling, it does not do well in datasets which require multi-dimensional scaling. In this paper, we propose a multi-dimensional 
scaling method, named DScale, which rescales based on the computed distance. It overcomes the key weakness of ReScale and 
requires one less parameter while maintaining the simplicity of the implementation. Our empirical evaluation shows that DScale 
has better clustering performance than ReScale for three existing density-based algorithms, i.e., DBSCAN, OPTICS and DP, on 
synthetic and real-world datasets.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 

This code was used for the following publication (Bibtex format):

@InProceedings{DScale2018Zhu,
author="Zhu, Ye
and Ting, Kai Ming
and Angelova, Maia",
editor="Phung, Dinh
and Tseng, Vincent S.
and Webb, Geoffrey I.
and Ho, Bao
and Ganji, Mohadeseh
and Rashidi, Lida",
title="A Distance Scaling Method to Improve Density-Based Clustering",
booktitle="Advances in Knowledge Discovery and Data Mining",
year="2018",
publisher="Springer International Publishing",
address="Cham",
pages="389--400",
isbn="978-3-319-93040-4"
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

References:  
[1] M. Ester, H. peter Kriegel, J. S, X. Xu, A density-based algorithm for 
discovering clusters in large spatial databases with noise, in: Proceedings 
of the Second International Conference on Knowledge Discovery and Data Mining 
(KDD-96), AAAI Press, 1996, pp. 226-231.
[2] Zhu, Y., Ting, K.M., Carman, M.J.: Density-ratio based clustering for 
discovering clusters with varying densities. Pattern Recognition 60, 983-997 (2016)
