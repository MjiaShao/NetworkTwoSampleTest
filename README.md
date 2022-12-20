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
  <li> Step 1: apply 'NetworkHashing.m' function to accomplish hashing step <br />

        [NetStatList] = NetworkHashing(A, MotifNameList, FileName)
    
  Input:
    1. A: Network adjacency matrix (requires symmetry with all diagnal elements equal to 0);
    2. MotifNameList: a list of network moments you would like to test;
    3. FileName: the name of place where you would like save the results.

  Output: all summary statistic needed for test of network A.
  
  
  <li> Step 2: apply 'FastTwoSampleTest.m' function to accomplish testing step  <br />

        [p_value, conf_int] = FastTwoSampleTest(FileName1, FileName2, conf_level,cdelta)
    
  Input:
    1. FileName1: the place where you saved summary statistics of network A;
    2. FileName2: the place where you saved summary statistics of network B;
    3. conf_level: $\alpha$
    4. cdelta: the parameter influences the variance of artificial noise term $\delta_T$

  Output:
    1. p_value: P-value of network two-sample test;
    2. conf_int: $(1-\alpha)\times100$\% confidence interval.
    
</ol>




<h2>Example1: application on test with two network </h2>

<h2>Example2: application on getting similarity matrix with multiple network </h2>




