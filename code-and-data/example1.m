clear
%% Loading two adjacency matrices (Symmetric and their diagonal values are 0)

A1 = load("./data/A_1");
A2 = load("./data/A_2");
A1 = A1.A;
A2 = A2.A;

% set up a MotifName list 
MotifName   = {'Triangle','Vshape'};

%% Hashing step: to store a list of needed estimator of each network
filenamesave1 = './hash_A1';
NetworkHashing(A1, MotifName,filenamesave1);

%% Do the same with adjacency matrix A2 
filenamesave2 = './hash_A2';
NetworkHashing(A2, MotifName,filenamesave2);


%% Testing step: to construct network two-sample test based on the hashing information
conf_level = 0.05;
cdelta = 0.01;
[p_value, conf_int] = FastTwoSampleTest(filenamesave1, filenamesave2, conf_level,cdelta);
p_value
conf_int