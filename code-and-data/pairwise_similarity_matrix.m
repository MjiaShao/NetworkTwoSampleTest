Files = dir("./hash_save");
isdir = [Files.isdir];
indexf = isdir ==0;
cdelta = 0.01;
Filesf = Files(indexf);
MotifName = {'Triangle','Vshape'};
p_all = zeros(length(Filesf),length(Filesf));
pesti = zeros(length(Filesf),length(Filesf));
conf_level = 0.05;
for i = 1:length(Filesf)
    for j = i:length(Filesf)
        [p_value, conf_int] = Our_method_FastTest(strcat(Filesf(i).folder,'/',Filesf(i).name), strcat(Filesf(j).folder,'/',Filesf(j).name), conf_level,cdelta);
        p_all(i,j) =  min(p_value);
        p_all(j,i) =  p_all(i,j);
    end
end
save('p_value_dis_mat','p_all')




