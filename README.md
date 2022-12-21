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
<li>  Set up motif list you would like to test for <br />
  
        MotifNameList  = {'Triangle','Vshape'};
 
<li>  Apply 'NetworkHashing.m' function on network A to accomplish hashing step <br />

        [NetStatList] = NetworkHashing(A, MotifNameList)
  Input:
  1. A: Network adjacency matrix (requires symmetry with all diagnal elements equal to 0);
  2. MotifNameList: a list of network moments you would like to test;
  
  Output: 
  1. NetStatList: all summary statistic needed for test of network A. <br />
  
  <br>
  
<li> Apply 'NetworkHashing.m' function to hash network B. <br >
  
<li> Apply 'FastTwoSampleTest.m' function to compare networks A and B, using only their network hashing outputs <br />

        [p_value, conf_int] = FastTwoSampleTest(NetStatList1, NetStatList2, conf_level,cdelta)
    
  Input:
  1. NetStatList1: the output in step 2;
  2. NetStatList2: the output in step 3;
  3. conf_level: $\alpha$
  4. cdelta: the parameter which influences the variance of artificial noise term $\delta_T$

  Output:
  1. p_value: P-value of network two-sample test;
  2. conf_int: $(1-\alpha)\times100$\% confidence interval.
    
</ol>




<h2> Application </h2>
   <li>  Example1: application on test with two network. (see 'example1.m')
   <li>  Example2: application on getting similarity matrix with multiple networks. (see 'example2.m')




