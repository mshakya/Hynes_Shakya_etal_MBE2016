Scripts and data for Hynes et al. 2016 MBE paper
------------------------------------------------

## bin
- folder with scripts

## results
    - contains folder of analysis.
    - folders are named based on the date they were started.

<!-- # all_gta_rhodo.fa
- fasta contatning all gta related genes (not regulatory)
- copied and downloaded using:
        In tulpar:
        `find -iname e*bestPara.fa -exec cat {} > test.fa \;` 
        In local:
        `scp mshakya@:/data2/mshakya/GTA/results/2014-02-06/blastNparse/test.fa .`
- it will be used to subset the ptt tables
 -->
<!-- # *.tre
- phylogenetic gene trees

# lang_genoplot.R
- Rscript to generate genoplots
- TODOS: need a way to color these genes
 -->
<!-- #NOTE:
`python ../GTA-git/bin/subset_ptt_table.py -i Rcap_GTA_associated_genes.ptt -f all_gta_rhodo.fa -o test.ptt`
    this script is used to subset the ptt table

##For Ruegeria
`python ../GTA-git/bin/subset_ptt_table.py -i ptt_tables/Ruegeria_pomeroyi_DSS_3_uid57863_NC_003911.ptt -f all_gta_rhodo.fa -o ptt_tables/Ruegeria_gta.ptt`
##For Octadecabacter
`python ../GTA-git/bin/subset_ptt_table.py -i ptt_tables/Octadecabacter_antarcticus_307_uid54701_NC_020911.ptt -f all_gta_rhodo.fa -o ptt_tables/Octadecabacter_antarcticus_gta.ptt`

##For Paracoccus
`python ../GTA-git/bin/subset_ptt_table.py -i ptt_tables/Paracoccus_denitrificans_PD1222_uid58187_NC_008688.ptt -f all_gta_rhodo.fa -o ptt_tables/PdenitrificansPD1222_1.ptt`
`python ../GTA-git/bin/subset_ptt_table.py -i ptt_tables/Paracoccus_denitrificans_PD1222_uid58187_NC_008687.ptt -f all_gta_rhodo.fa -o ptt_tables/PdenitrificansPD1222_2.ptt`


#For making the cgplot
`java -jar ~/Downloads/cgview/cgview.jar -i ptt_tables/Octadecabacter_antarcticus_gta.ptt -o test.jpg -f jpg -W 1000 -A 12 -U 10`
-need a way to make this prettier, probably in R -->