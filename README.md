# Network-Two-Sample-Test

<h2>Reference:</h2>

* Higher-order accurate two-sample network inference and network hashing<br />
<i>Meijia Shao, Dong Xia, Yuan Zhang, Qiong Wu & Shuo Chen</i><br>
https://arxiv.org/pdf/2208.07573.pdf



<h2>Function list </h2>

1. 'Our_method_NetHashing.m'
2. 'Our_method_FastTest.m'
3. 'Motif.m'

<h2>main file list</h2>
1. main.m
2. hashing_storage.m
3. pairwise_similarity_matrix.m


<h2>Instructions for making basic network two-sample test</h2>
1. Run 'main.m' to construct network two-sample test between two networks 

<h2>Instruction for making pairwise comparison after geting a list of network adjacency matrices</h2>

1. The data example stored in the folder as 'coding/data_simulation_100' (including 100 different adjacency matrices)
2. Run 'hashing_storage.m' to store estimator list for each network;
3. Run 'pairwise_similarity_matrix.m' to generate a pairwise similarity matrix.
