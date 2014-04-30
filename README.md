Sys-Bio-Project
===============

Clone the repository:
```bash
git clone https://github.com/pallavigudipati/Sys-Bio-Project.git
```
==================================================================== 

After you get all the subgraphs from graph-cut and store them in the following form,

    * node_label1
  	    - org_1
		    - 264.csv
		    - 674.csv
		
    * node_label2 
	    - org_1
	        - 333.csv
	    - org_2
	        - 456.csv
	    
copy the contents of `code/FSG` in the folder that contains the above structure. Run the following command:
```bash
./run_fsg
```
You will be prompted to enter the number of nodes and the support threshold.
Final output will be stored in `final_output.txt`.

You can all view the intermediate files generated like the tid files etc. [PAFI](http://glaros.dtc.umn.edu/gkhome/pafi/overview) was used to mine maximal subgraphs. Only the linux executable to run FSG has been provided `code/FSG/fsg`.