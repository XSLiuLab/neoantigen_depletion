# Revisiting neoantigen depletion signal in the untreated cancer genome


## Steps for HLA-binding region checking

1. Download raw data from Van den Eynden J. et al. via zenodo https:// doi.org/10.5281/zenodo.2621365
1. Install and deploy [antigen.garnish](https://github.com/immune-health/antigen.garnish) for IEDB score calculation
1. Identify neoantigens by the following approaches:
    -  Neoantigens based only on MHC I binding (MHC affinity < 500 nM)
    -  Differential agretopicity index(DAI, DAI > 5) 
    - IEDB high neoantigens (IEDB score > 0.9)
2. Map the neoantigens to exome region
3. Calculate the overlap between neoantigen location and HLA binding/non-binding region from Van den Eynden J. et al.
4. Analyze and visualize the result


## Reference 

- Neoantigen dissimilarity to the self-proteome predicts immunogenicity and response to immune checkpoint blockade
- Luksza, M, Riaz, N, Makarov, V, Balachandran VP, et al. 2017. A neoepitope fitness model predicts tumour response to checkpoint blockade immunotherapy. Nature. 23;551(7681):512-516
- Van den Eynden, J., Jimenez-Sanchez, A., Miller, M.L. & Larsson, E. Lack of detectable neoantigen depletion signals in the untreated cancer genome. Nat Genet 51, 1741-1748 (2019).

## LICENSE

MIT &copy;2020 Xuan Wang, Shixiang Wang, Tao Wu and Xue-Song Liu

***

**Cancer Biology Group @ShanghaiTech**

**Research group led by Xue-Song Liu in ShanghaiTech. University**