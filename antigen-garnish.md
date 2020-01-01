This document describes some key points for using [antigen.garnish](https://github.com/immune-health/antigen.garnish) and reading the results.

Key function: <https://neoantigens.rech.io/reference/garnish_affinity.html>

## Example code for neoantigen calling

- Directly from R, (code from garnish_affinity)


```r
library(magrittr)
library(data.table)
library(antigen.garnish)

# input a data table of peptides for all human MHC types
dt <- data.table::data.table(
  sample_id = "test",
  pep_mut = "MTEYKLVVVGAGDVGKSALTIQLIQNHFVDEYDP",
  mutant_index = "12",
  MHC = "HLA-A*02:01 HLA-A*68:01 HLA-B*07:02") %>%
  garnish_affinity %T>%
  str
```

For our data:

```r
library(magrittr)
library(data.table)
library(antigen.garnish)

# input a data table of peptides for all human MHC types
dt <- data.table::data.table(
  sample_id = "test",
  pep_mut = "MRLVDRRWA",
  pep_wt="VRLVDRRWA",
  mutant_index = "1",
  MHC = "HLA-A*02:01 HLA-A*01:01 HLA-B*07:02 HLA-B*08:01 HLA-C*07:01 HLA-C*07:02")

dt <- garnish_affinity(dt, remove_wt = FALSE, binding_cutoff=Inf)
# Keep only length-9 peptide
dto <- dt[nchar(nmer) %in% 9]
```


- Input from Excel file

```r
# input from Microsoft excel

# load an example excel file
dir <- system.file(package = "antigen.garnish") %>%
  file.path(., "extdata/testdata")

path <- "antigen.garnish_test_input.xlsx" %>%
  file.path(dir, .)

# predict neoantigens
dt <- garnish_affinity(path = path) %T>%
str
```


## Key results

- Ensemble_score: average value of MHC binding affinity from all prediction tools that contributed output.
- iedb_score: R implementation of TCR recognition probability for peptide through summing of alignments in IEDB for corresponding organism.
- IEDB_anno: The best alignment from the IEDB database queried for the sample if applicable.
- min_DAI: Minimum of value of BLAST_A or DAI values, to provide the most conservative proteome-wide estimate of differential binding between input and wildtype matches.
- dissimilarity: Calculation from 0 to 1 derived from alignment to the self-proteome, with 1 indicating greater dissimilarity and up to 34-fold odds ratio of immunogenicity.