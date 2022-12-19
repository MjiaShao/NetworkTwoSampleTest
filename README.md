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

%% Loading two adjancency matrices (Symmetric and their diagonal value is 0)

A1 = load("./data_simulation_100/A_1");
A2 = load("./data_simulation_100/A_2");
A1 = A1.A;
A2 = A2.A;

% set up a MotifName list 
MotifName   = {'Triangle','Vshape'};

%% Hashing step: to store a list of needed estimator of each matrix
%% input 
% A1 is the adjancency matrix 
% MotifName is the MotifName list 
% Filenamesave: set up the file name, where you would like to save the hashing information

%% output (saving all information under the file with name as filenamesave
filenamesave1 = './hash_A1';
Our_method_NetHashing(A1, MotifName,filenamesave1);

%% Do the same with matrix A2 
filenamesave2 = './hash_A2';
Our_method_NetHashing(A2, MotifName,filenamesave2);


%% Testing step: to construct network two-sample test based on the hashing information
%% input
% filenamesave1: hashing information of A1
% filenamesave1: hashing information of A2
% conf_level: alpha
% cdelta: the parameter determines the variance of artificial noise term \delta_T

%% output
% p_value: a list P-value corresponding with each Motif
% conf_int: a matrix and each row represents the Confidence Interval for each Motif

conf_level = 0.05;
cdelta = 0.01;
[p_value, conf_int] = Our_method_FastTest(filenamesave1, filenamesave2, conf_level,cdelta);

<h2>Instruction for making pairwise comparison after geting a list of network adjacency matrices</h2>

1. The data example stored in the folder as 'coding/data_simulation_100' (including 100 differnt netork adjacency matrices)
2. Run 'hashing_storage.m' to store estimator list for each network;
3. Run 'pairwise_similarity_matrix.m' to generate the similarity matrix using P-value of pairwise network two-sample test.
