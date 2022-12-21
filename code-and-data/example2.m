% Hashing step: to store a list of needed estimator of each network
clear
MotifNameList   = {'Triangle','Vshape','ThreeStar'};
Files = dir("./data");
isdir = [Files.isdir];
indexf = isdir ==0;
Filesf = Files(indexf);
NetStatList_all = cell(1,length(Filesf));
for j = 1:length(Filesf)
    A = load(strcat("./data/",Filesf(j).name));
    A = cell2mat(struct2cell(A));
    NetStatList_all{j} = NetworkHashing(A, MotifNameList);
end

% Testing step: to construct pairwise network two-sample test based on the hashing information
cdelta = 0.01;
sig_level = 0.05;
p_all = zeros(length(Filesf),length(Filesf));
for i = 1:length(Filesf)
    for j = i:length(Filesf)
        [p_value, conf_int] = FastTwoSampleTest(NetStatList_all{i}, NetStatList_all{j}, sig_level,cdelta);
        p_all(i,j) =  min(p_value);
        p_all(j,i) =  p_all(i,j);
    end
end
save('p_value_similarity_mat','p_all')





