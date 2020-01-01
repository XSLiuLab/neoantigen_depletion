.libPaths(c("/home/anaconda3/lib/R/library", .libPaths()))

load("/public/share/nonsynonymou.RData")
library(magrittr)
library(data.table)
library(dplyr)
library(antigen.garnish)
library(tidyr)


collapse_pep = function(x) {
  paste0(x, collapse = ",")
}

nonsyn_df = nonsynonymou %>%  
  dplyr::as_tibble() %>% 
  dplyr::mutate(
    sample_id = paste(
      Tumor_Sample_Barcode,
      gsub("chr", "", Chromosome),
      Start_Position,
      sep = ","
    ),
    index = paste(1:9, collapse = ","),
    mut_pep = purrr::map_chr(mut_pep, collapse_pep),
    wt_pep = purrr::map_chr(wt_pep, collapse_pep),
    strand = TRANSCRIPT_STRAND,
    codon =Codons
  )


input_dt = nonsyn_df %>% 
  dplyr::select(sample_id, mut_pep, wt_pep, index,strand,codon) %>% 
  tidyr::separate_rows(mut_pep, wt_pep, index, sep=",") %>% 
  dplyr::filter(mut_pep != "NA" & wt_pep != "NA") %>% 
  dplyr::mutate(sample_id = paste(sample_id, index, sep = ","),
                MHC = c("HLA-A*02:01 HLA-A*01:01 HLA-B*07:02 HLA-B*08:01 HLA-C*07:01 HLA-C*07:02")) %>% 
  data.table::as.data.table()

colnames(input_dt) = c("sample_id", "pep_mut", "pep_wt", "mutant_index", "MHC")


# Checking
which(!(input_dt$pep_mut%like% "^[ARNDCQEGHILKMFPSTWYV]+$"))
which(!(input_dt$pep_wt%like% "^[ARNDCQEGHILKMFPSTWYV]+$"))

keep_index = input_dt$pep_mut%like% "^[ARNDCQEGHILKMFPSTWYV]+$"
input_dt = input_dt[keep_index, ]

save(input_dt, file = "/public/share/antigen_garnish_TCGA_input_df_common_HLA.RData")



