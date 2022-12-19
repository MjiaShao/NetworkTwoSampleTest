clear
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
