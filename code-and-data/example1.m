clear
% Loading two adjacency matrices (Symmetric and their diagonal values are 0)

A1 = load("./data/A_1");
A2 = load("./data/A_2");
A1 = A1.A;
A2 = A2.A;

% set up a MotifName list 
MotifNameList   = {'Triangle','Vshape','ThreeStar'};

% Hashing step: to store a list of needed estimator of each network
NetStatList1 = NetworkHashing(A1, MotifNameList);

% Do the same with adjacency matrix A2 
NetStatList2 = NetworkHashing(A2, MotifNameList);


% Testing step: to construct network two-sample test based on the hashing information
sig_level = 0.05;
cdelta = 0.01;
[p_value, conf_int] = FastTwoSampleTest(NetStatList1, NetStatList2, sig_level,cdelta);
p_value
conf_int
