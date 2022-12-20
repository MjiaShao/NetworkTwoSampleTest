# Network-Two-Sample-Test

<h2>Reference:</h2>

* Higher-order accurate two-sample network inference and network hashing<br />
<i>Meijia Shao, Dong Xia, Yuan Zhang, Qiong Wu & Shuo Chen</i><br>
https://arxiv.org/pdf/2208.07573.pdf



<h2>Main files</h2>

1. 'NetworkHashing.m'
2. 'FastTwoSampleTest.m'

<h2>Network Two-sample test between two network</h2>
Please check out 'demo.m'.

<h2>How to use (comparing K networks, K>=2)</h2>

<ol>
  <li> Step 1: run 'hashing_storage.m' to accomplish hashing step <br />
  Input:......
  Output:......
  
  
  <li> Step 2: run 'pairwise_similarity_matrix.m' to accomplish testing step  <br />
  Input:......
  Output:......
</ol>



Input: 
1. data set: Save each network adjacency matrix as one file in a big folder. (In our example, we saved them in the 'data_simulation_100')
2. MotifName: a motif list including all kinds of network moments you would like to make comparison 
3. conf_level: alpha 
4. cdelta: the parameter influences the variance of artificial noise term $\delta_T$

Output:  
1. Similarity matrix with pairwise comparison between networks in the data set

Usage with a data example including 100 network saved in 'data_simulation_100':



<h2>Demo: 
