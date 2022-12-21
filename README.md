# Network-Two-Sample-Test

<h2>Reference:</h2>

* Higher-order accurate two-sample network inference and network hashing<br />
<i>Meijia Shao, Dong Xia, Yuan Zhang, Qiong Wu & Shuo Chen</i><br>
https://arxiv.org/pdf/2208.07573.pdf



<h2>Main files</h2>

1. 'NetworkHashing.m'
2. 'FastTwoSampleTest.m'


<h2>How to use for network two-sample test </h2>

<ol>
<li>  Set up motif list you would like to test for 
  
  <br>
  
        MotifNameList   = {'Triangle','Vshape','ThreeStar'};
 
<li>  Apply 'NetworkHashing.m' function on network A to accomplish hashing step 
  
  <br>

        [NetStatList] = NetworkHashing(A, MotifNameList)
  Input:
  <ul>
    <li> A: Network adjacency matrix (requires symmetry with all diagnal elements equal to 0);
     <li> MotifNameList: a list of network moments you would like to test;
  </ul>
  
  Output: 
  <ul>
     <li> NetStatList: all summary statistic needed for test of network A.
  </ul>
  
  <br>
  
<li> Apply 'NetworkHashing.m' function to hash network B. <br >
  
<li> Apply 'FastTwoSampleTest.m' function to compare networks A and B, using only their network hashing outputs <br>

        [p_value, conf_int] = FastTwoSampleTest(NetStatList1, NetStatList2, sig_level, cdelta)
    
  Input:
  <ul>
     <li> NetStatList1: output of step 2;
     <li> NetStatList2: output of step 3;
     <li> sig_level: $\alpha$
     <li> cdelta tunes the amount of artificial smoothing added to the studentization form (see our paper for more details).  You can set it to 0 or a small positive number in most cases.
  </ul>

  Output:
  <ul>
     <li> p_value: P-value of network two-sample test;
     <li> conf_int: $(1-\alpha)\times100$% confidence interval.
  </ul>
  
  If MotifNameList contains K members, then FastTwoSampleTest will output a length-K p-value vector, and conf_int will be a K by 2 matrix, each row showing the confidence interval for the corresponding motif.
    
</ol>




<h2> Example implementations </h2>
   <li>  Example1: comparing two network. (see 'example1.m')
   <li>  Example2: obtaining a similarity matrix between multiple networks using pairwise tests. (see 'example2.m')




