# neoantigen depletion checking and detection

Method and tool: https://github.com/immune-health/antigen.garnish

Key function: <https://neoantigens.rech.io/reference/garnish_affinity.html>


## Steps for neoantigen depletion checking

1. [ ] Install and deploy **antigen.garnish**
2. [ ] Prepare input for **antigen.garnish**
3. [ ] Run the package above for all mutations
4. [ ] Select immunogenic neoantigens
    - classically defined neoantigens (CDNs, MHC affinity < 50 nM)
    - alternatively defined neoantigens (ADNs, DAI > 10) (DAI, differential agretopicity index)
    - IEDB high neoantigens (IEDB score > 0.9)
    - high dissimilarity neoantigens (dissimilarity > 0.75)
5. [ ] Map the neoantigens to exome regions
6. [ ] Calculate the overlap regions and length from above with those from Nat.Gen. papar recently
7. [ ] Visualize with venn diagram

## Example code for neoantigen calling

- Directly from R, (code from garnish_affinity)


```
# input a data table of peptides for all human MHC types
dt <- data.table::data.table(
  sample_id = "test",
  pep_mut = "MTEYKLVVVGAGDVGKSALTIQLIQNHFVDEYDP",
  mutant_index = "12",
  MHC = "HLA-A*02:01 HLA-A*68:01 HLA-B*07:02") %>%
  garnish_affinity %T>%
  str
```

- Input from Excel file

```
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


- Key results

  - Ensemble_score: average value of MHC binding affinity from all prediction tools that contributed output.
  - iedb_score: R implementation of TCR recognition probability for peptide through summing of alignments in IEDB for corresponding organism.
  - IEDB_anno: The best alignment from the IEDB database queried for the sample if applicable.
  - min_DAI: Minimum of value of BLAST_A or DAI values, to provide the most conservative proteome-wide estimate of differential binding between input and wildtype matches.
  - dissimilarity: Calculation from 0 to 1 derived from alignment to the self-proteome, with 1 indicating greater dissimilarity and up to 34-fold odds ratio of immunogenicity.

## Reference 

- Neoantigen dissimilarity to the self-proteome predicts immunogenicity and response to immune checkpoint blockade
- Luksza, M, Riaz, N, Makarov, V, Balachandran VP, et al. 2017. A neoepitope fitness model predicts tumour response to checkpoint blockade immunotherapy. Nature. 23;551(7681):512-516
- Nat.Gen paper??
