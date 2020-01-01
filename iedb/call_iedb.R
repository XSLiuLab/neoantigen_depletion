#!/usr/bin/env Rscript
.libPaths("/home/public/R/library")
library(neopeptides)
#set_blast_path("/public/home/liuxs/anaconda3/envs/R_36/bin")
sapply(1:10000, function(x){
  load(paste("/home/wt/ng/split_data_dir/input_dt_chunk_",x,".RData",sep = ""))
  data1 = calc_iedb_score(input_dt_chunk$pep_mut)
  identical(data1$peptide, input_dt_chunk$pep_mut)
  write.table(data1,file = paste("/home/wt/ng/results_IEDB_new/IEDB",x,sep = ""),sep = "\t",quote = FALSE,row.names = FALSE)
})

