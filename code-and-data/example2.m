% Hashing step: to store a list of needed estimator of each network
clear
MotifName   = {'Triangle','Vshape'};
mkdir(strcat("./hash_save"));
Files = dir("./data");
isdir = [Files.isdir];
indexf = isdir ==0;
Filesf = Files(indexf);
for j = 1:length(Filesf)
    filenamesave = strcat("./hash_save/hash_",string(j));
    A = load(strcat("./data/",Filesf(j).name));
    A = cell2mat(struct2cell(A));
    NetworkHashing(A, MotifName,filenamesave);
end


% Testing step: to construct pairwise network two-sample test based on the hashing information
clear
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
        [p_value, conf_int] = FastTwoSampleTest(strcat(Filesf(i).folder,'/',Filesf(i).name), strcat(Filesf(j).folder,'/',Filesf(j).name), conf_level,cdelta);
        p_all(i,j) =  min(p_value);
        p_all(j,i) =  p_all(i,j);
    end
end
save('p_value_dis_mat','p_all')





