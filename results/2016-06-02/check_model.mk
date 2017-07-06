
vpath %.pl ../../../GTA/bin
vpath %.py ../../../GTA/bin
GTAS_FOLDER = rcc171 \
orfg1 orfg2 orfg3 orfg4 orfg5 orfg6 orfg7 orfg8 orfg9 orfg10 orfg11 orfg12 \
orfg13 orfg14 orfg15 orfg3.5 orfg10.1 endo holin rcc555 rcc556 rcc1865\
 rcc1866 orfgTF1 orfgTF2


create_folder: $(foreach var, $(GTAS_FOLDER), $(var)) \

$(GTAS_FOLDER):
	@echo "creating directories for each GTA gene"
	mkdir -p $@



copy_files:
	#rcc171
	cp ../2015-12-03/GTAs/rcc171_dir/rcc171_viral_LC_un.phy rcc171/rcc171.phy
	cp ../2015-12-03/GTAs/rcc171_dir/rcc171_viral_LC_un.afa rcc171/rcc171.afa
	# endolysin
	cp ../2015-12-03/GTAs/endo_dir/endo_viral_LC_un.phy endo/endo.phy
	cp ../2015-12-03/GTAs/endo_dir/endo_viral_LC_un.afa endo/endo.afa

	#holin
	cp ../2015-12-12/gta_genes/holin_blastp_psiblast_rhodo_only_bestPara_rename.afa holin/holin.afa
	#g1
	cp ../2015-12-12/gta_genes/orfg1_blastp_psiblast_rhodo_only_nocaulo_bestPara_rename.afa orfg1/orfg1.afa
	#g2
	cp ../2015-10-03/GTAs/orfg2_dir/orfg2_LC_viral_rhodo.phy orfg2/orfg2.phy
	cp ../2015-10-03/GTAs/orfg2_dir/orfg2_LC_viral_rhodo.afa orfg2/orfg2.afa
	#g3
	cp ../2015-10-03/GTAs/orfg3_dir/orfg3_LC_viral_rhodo.phy orfg3/orfg3.phy
	cp ../2015-10-03/GTAs/orfg3_dir/orfg3_LC_viral_rhodo.afa orfg3/orfg3.afa
	#g3.5
	cp ../2015-12-12/gta_genes/orfg3_5_blastp_psiblast_rhodo_only_nocaulo_bestPara_rename.afa orfg3.5/orfg3.5.afa
	#g4
	cp ../2015-10-03/GTAs/orfg4_dir/orfg4_LC_viral_rhodo.phy orfg4/orfg4.phy
	cp ../2015-10-03/GTAs/orfg4_dir/orfg4_LC_viral_rhodo.afa orfg4/orfg4.afa
	#g5
	cp ../2015-10-03/GTAs/orfg5_dir/orfg5_LC_viral_rhodo.phy orfg5/orfg5.phy
	cp ../2015-10-03/GTAs/orfg5_dir/orfg5_LC_viral_rhodo.afa orfg5/orfg5.afa
	#g6
	cp ../2015-10-03/GTAs/orfg6_dir/orfg6_LC_viral_rhodo.phy orfg6/orfg6.phy
	cp ../2015-10-03/GTAs/orfg6_dir/orfg6_LC_viral_rhodo.afa orfg6/orfg6.afa
	#g7
	cp ../2015-10-03/GTAs/orfg7_dir/orfg7_LC_viral_rhodo.phy orfg7/orfg7.phy
	cp ../2015-10-03/GTAs/orfg7_dir/orfg7_LC_viral_rhodo.afa orfg7/orfg7.afa
	#g8
	cp ../2015-10-03/GTAs/orfg8_dir/orfg8_LC_viral_rhodo.phy orfg8/orfg8.phy
	cp ../2015-10-03/GTAs/orfg8_dir/orfg8_LC_viral_rhodo.afa orfg8/orfg8.afa
	#g9
	cp ../2016-05-27/orfg9/orfg9_viral_LC_un_phage.afa orfg9/orfg9.afa
	#g10
	cp ../2015-12-12/gta_genes/orfg10_blastp_psiblast_rhodo_only_nocaulo_bestPara_rename.afa orfg10/orfg10.afa
	#g10.1
	cp ../2015-12-12/gta_genes/orfg10_5_blastp_psiblast_rhodo_only_nocaulo_bestPara_rename.afa orfg10.1/orfg10.1.phy
	#g11
	cp ../2015-10-03/GTAs/orfg11_dir/orfg11_LC_viral_rhodo.phy orfg11/orfg11.phy
	cp ../2015-10-03/GTAs/orfg11_dir/orfg11_LC_viral_rhodo.afa orfg11/orfg11.afa
	#g12
	cp ../2015-10-03/GTAs/orfg12_dir/orfg12_LC_viral_rhodo.phy orfg12/orfg12.phy
	cp ../2015-10-03/GTAs/orfg12_dir/orfg12_LC_viral_rhodo.afa orfg12/orfg12.afa
	#g13
	cp ../2015-10-03/GTAs/orfg13_dir/orfg13_LC_viral_rhodo.phy orfg13/orfg13.phy
	cp ../2015-10-03/GTAs/orfg13_dir/orfg13_LC_viral_rhodo.afa orfg13/orfg13.afa
	#g14
	cp ../2015-10-03/GTAs/orfg14_dir/orfg14_LC_viral_rhodo.phy orfg14/orfg14.phy
	cp ../2015-10-03/GTAs/orfg14_dir/orfg14_LC_viral_rhodo.afa orfg14/orfg14.afa
	#g15
	cp ../2015-10-03/GTAs/orfg15_dir/orfg15_LC_viral_rhodo.phy orfg15/orfg15.phy
	cp ../2015-10-03/GTAs/orfg15_dir/orfg15_LC_viral_rhodo.afa orfg15/orfg15.afa
	#TF1
	cp ../2015-12-03/GTAs/orfgTF1_dir/orfgTF1_viral_LC_un.phy orfgTF1/orfgTF1.phy
	cp ../2015-12-03/GTAs/orfgTF1_dir/orfgTF1_viral_LC_un.afa orfgTF1/orfgTF1.afa
	#TF2
	cp ../2015-12-03/GTAs/orfgTF2_dir/orfgTF2_viral_LC_un.phy orfgTF2/orfgTF2.phy
	cp ../2015-12-03/GTAs/orfgTF2_dir/orfgTF2_viral_LC_un.afa orfgTF2/orfgTF2.afa
	#1865
	cp ../2015-10-05/GTAs/rcc1865_dir/rcc1865_LC_viral_rhodo.phy rcc1865/rcc1865.phy
	cp ../2015-10-05/GTAs/rcc1865_dir/rcc1865_LC_viral_rhodo.afa rcc1865/rcc1865.afa
	##1866
	cp ../2015-10-05/GTAs/rcc1866_dir/rcc1866_LC_viral_rhodo.phy rcc1866/rcc1866.phy


# see .sh files for jobs that were submitted for phylogeny

#generate name
GTA_ORG_NAME =  orfg2 orfg12 orfg8 orfgTF2 orfg11 rcc171 orfgTF1 orfg7 \
				orfg13 orfg3 orfg14 orfg15 orfg4 orfg5 endo orfg6 rcc1865

name: $(foreach var, $(GTA_ORG_NAME), $(var)/$(var)_org.tab) \
$(foreach var, $(GTA_ORG_NAME), $(var)/$(var)_named.tre) \
$(foreach var, $(GTA_ORG_NAME), $(var)/$(var)_named_.tre) \

%_org.tab:gi_organism_table.py %.afa
	@echo "#generate the tab delimited table with gi number as col1 and organism name as col2 for renaming the taxa name in phylogenetic tree"
	python $< -i $(word 2, $^) -o $@
	sed 's/://g'  $@ | sed 's/\///g'> test1.tab
	mv test1.tab $@

%_named.tre:taxnameconvert.pl %_org.tab
	perl $< -f 1 -t 2 $(word 2, $^) $(notdir $*)/raxml_trees/RAxML_bipartitions.tree $@

%_named_.tre:%_named.tre
	sed 's/ /_/g' $< > $@
##################################################################
# for figure 7
fig7: rcc171_fig7 rcc171_fig7/rcc171_no_noTetri.phy rcc171_fig7/rcc171_named.tre

rcc171_fig7:
	mkdir -p $@

rcc171_fig7/rcc171_no_noTetri.phy:
	cp ../2015-12-25/rcc171/rcc171_no_noTetri.tab rcc171_fig7/
	cp ../2015-12-25/rcc171/rcc171_no_noTetri.phy $@

# run RAxML
#raxmlHPC-PTHREADS-SSE3 -m PROTGAMMAWAG -p 98754 -b 545646 -N 100 -s "../rcc171_no_noTetri.phy -n bstree -k -T 16
#raxmlHPC-PTHREADS-SSE3 -m PROTGAMMAWAG -p 98754 -b 545646 -N 100 -s ../rcc171_no_noTetri.phy -n bstree -k -T 16

rcc171_fig7/rcc171_named.tre:taxnameconvert.pl rcc171_fig7/rcc171_no_noTetri.tab
	perl $< -f 1 -t 2 $(word 2, $^) rcc171_fig7/raxml_trees/RAxML_bipartitions.tree $@
	perl $< -f 1 -t 2 $(word 2, $^) rcc171_fig7/raxml_trees/RAxML_bipartitionsBranchLabels.tree rcc171_fig7/rcc171_namedBranch.tre
