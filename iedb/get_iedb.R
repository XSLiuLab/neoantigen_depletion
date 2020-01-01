# for x in $(seq 1 10000);do echo "IEDB$x";done | xargs cat > ./mergedIEDB

library(data.table)

iedb <- read.table("mergedIEDB",sep = "\t",header = T,stringsAsFactors = FALSE,quote = NULL)
iedb <- iedb[-which(iedb$peptide=="peptide"),]
load("antigen_garnish_TCGA_input_df_common_HLA.RData")
iedb$sample_id <- input_dt$sample_id
save(iedb,file = "iedb.Rdata")