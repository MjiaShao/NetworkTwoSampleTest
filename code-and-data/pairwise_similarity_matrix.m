% Input 
%% Files: the folder you saved hashing information of each
%% conf_level: alpha
%% cdelta: the parameter determines the variance of artificial noise term \delta_T
%% MotifName: a list of network moments you would like to test

% Output
%% p_all: similarity matrix with pairwise comparison between networks in the data set

Files = dir("./hash_save");
cdelta = 0.01;
conf_level = 0.05;
MotifName = {'Triangle','Vshape'};

isdir = [Files.isdir];
indexf = isdir ==0;
Filesf = Files(indexf);
p_all = zeros(length(Filesf),length(Filesf));
for i = 1:length(Filesf)
    for j = i:length(Filesf)
        [p_value, conf_int] = Our_method_FastTest(strcat(Filesf(i).folder,'/',Filesf(i).name), strcat(Filesf(j).folder,'/',Filesf(j).name), conf_level,cdelta);
        p_all(i,j) =  min(p_value);
        p_all(j,i) =  p_all(i,j);
    end
end
save('p_value_dis_mat','p_all')




