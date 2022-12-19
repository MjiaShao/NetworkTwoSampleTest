clear
% Input
%% MotifName: a list of network moments you would like to test
%% Files: the folder where you save all network adjacency matrices (In our example, it is 'data_simulation_100')

% Output: a folder include a list of files where each file includes all hashing information of one network (In our example, it is 'hash_save')


MotifName   = {'Triangle','Vshape'};
mkdir(strcat("./hash_save"));
Files = dir("./data_simulation_100");
isdir = [Files.isdir];
indexf = isdir ==0;
Filesf = Files(indexf);
for j = 1:length(Filesf)
    filenamesave = strcat("./hash_save/hash_",string(j));
    A = load(strcat("./data_simulation_100/A_",string(j)));
    A = cell2mat(struct2cell(A));
    Our_method_NetHashing(A, MotifName,filenamesave);
end


