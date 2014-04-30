Sys-Bio-Project
===============

==================================================================== 

After you get all the subgraphs from graph-cut and store them in the following form: 
    
	- node_label1 
  	    - org_1
		    - 264.csv
		    - 674.csv
		
    - node_label2 
	    .
	    .
	    
copy the contents of `code/FSG` in the folder that contains the above struncture.

Run `./run_fsg`.
    
You will be prompted to enter the number of nodes and the support threshold.
Final output will be stored in `final_output.txt`.

You can all view the intermediate files generated like the tid files etc. PAFI was used to mine maximal subgraphs.
