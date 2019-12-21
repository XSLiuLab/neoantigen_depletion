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

## Reference 

- Neoantigen dissimilarity to the self-proteome predicts immunogenicity and response to immune checkpoint blockade
- Nat.Gen paper??
