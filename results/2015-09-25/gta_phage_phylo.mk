vpath %.py ../../../GTA/bin/
vpath %.pl ../../../GTA/bin/
vpath %.sh ../../../GTA/bin/
vpath %.R ../../../GTA/bin/

MKDIR = mkdir -p
OUTFMT='6 qseqid sstart send sframe sseqid pident qlen slen length mismatch gapopen qstart qend evalue bitscore'
HEADER='qseqid sstart send sframe sseqid pident qlen slen length mismatch gapopen qstart qend evalue bitscore'

#######################################################################################################################
# analysis I: preparation
#######################################################################################################################
GTA_ALL := orfg2 orfg3 orfg4 orfg5 orfg6 orfg7 orfg8 orfg9 orfg10 orfg11 orfg12 orfg13 orfg14 orfg15
GTAs := orfg2 orfg3 orfg4 orfg5 orfg6 orfg7 orfg8 orfg11 orfg12 orfg13 orfg14 orfg15


GTAsPrep:$(foreach var, $(GTAs), GTAs/$(var)_dir) \
		 $(foreach var, $(GTAs), GTAs/$(var)_dir/$(var)_LC.fa) \
		 viralref_rhodophages.faa \
		 viral_db/timestamp \
		 $(foreach var, $(GTAs), GTAs/$(var)_dir/$(var)_viral_blastp.txt) \
		 $(foreach var, $(GTAs), GTAs/$(var)_dir/$(var)_viral_blastp.fa) \
		 $(foreach var, $(GTAs), GTAs/$(var)_dir/$(var)_viral_blastp_blastp.txt) \
		 $(foreach var, $(GTAs), GTAs/$(var)_dir/$(var)_viral_blastp_blastp.fa) \
		 $(foreach var, $(GTAs), GTAs/$(var)_dir/$(var)_viral_blastp_blastp_un.fa) \
		 $(foreach var, $(GTAs), GTAs/$(var)_dir/$(var)_LC_viral.fa) \
		 $(foreach var, $(GTAs), GTAs/$(var)_dir/$(var)_LC_viral_un.fa) \
		 $(foreach var, $(GTAs), GTAs/$(var)_dir/$(var)_viral_LC_un.afa) \
		 $(foreach var, $(GTAs), GTAs/$(var)_dir/$(var)_viral_LC_v1.afa) \
		 $(foreach var, $(GTAs), GTAs/$(var)_dir/$(var)_viral_LC.phy) \
		 $(foreach var, $(GTAs), GTAs/$(var)_dir/$(var)_viral_LC.fast_tre) \
		 $(foreach var, $(GTAs), GTAs/$(var)_dir/$(var)_viral_LC_table.txt) \
		 $(foreach var, $(GTAs), GTAs/$(var)_dir/$(var)_viral_LC_gi_org.tab) \
		 viral_LC_distance_rcap.txt \
		 $(foreach var, $(GTAs), GTAs/$(var)_dir/$(var)_viral_LC.pdf) \
		 $(foreach var, $(GTAs), GTAs/$(var)_dir/$(var)_viral_LC_gi_org.fast_tre) \
		 $(foreach var, $(GTAs), GTAs/$(var)_dir/$(var)_subset_list.txt) \
		 $(foreach var, $(GTAs), GTAs/$(var)_dir/$(var)_viral_LC_subset.fa) \
		 $(foreach var, $(GTAs), GTAs/$(var)_dir/$(var)_viral_LC_subset.afa) \
		 $(foreach var, $(GTAs), GTAs/$(var)_dir/$(var)_viral_LC_subset_v1.afa) \
		 $(foreach var, $(GTAs), GTAs/$(var)_dir/$(var)_viral_LC_subset.phy) \
		 $(foreach var, $(GTAs), GTAs/$(var)_dir/$(var)_viral_LC_subset_gi_org.tab) \
		 $(foreach var, $(GTAs), GTAs/$(var)_dir/$(var)_viral_LC_subset.fast_tre) \
		 $(foreach var, $(GTAs), GTAs/$(var)_dir/$(var)_viral_LC_subset_gi_org.fast_tre) \
		 $(foreach var, $(GTAs), GTAs/$(var)_dir/$(var)_viral_LC_subset_gi_org.pdf)

%_dir:
	@echo "create folders for each GTA genes"
	mkdir -p $@

%_LC.fa:
	@echo "copying fasta"
	cp ../2015-06-15/$(notdir $*)/$(notdir $*)_lc_complete_blastp_psiblast.faa $@

viralref_rhodophages.faa:../../../GTA/data/viral_db/viral.1.protein.faa
	find ../../../RhodoPhages/data/genomes -iname '*ncbi.faa' -exec cat {} $< > $@ \;

viral_db/timestamp:viralref_rhodophages.faa
	mkdir -p viral_db
	@echo "format the viral database"
	makeblastdb -in $< -dbtype prot -out viral_db/viral_protein
	touch viral_db/timestamp

%_viral_blastp.txt:%_LC.fa viral_db/viral_protein.phr
	blastp -out $@ -outfmt $(OUTFMT) -query $< \
	-db viral_db/viral_protein -evalue 0.001 \
	-dbsize 10000000 -num_threads 6

%_viral_blastp.fa:filter_extract_fasta.py %_viral_blastp.txt viralref_rhodophages.faa
	python $< --blast_hits $(word 2, $^) --header $(HEADER)  --out_fasta $@ --fasta $(word 3, $^) -slen 0.6

%_viral_blastp_blastp.txt:%_viral_blastp.fa viral_db/viral_protein.phr
	blastp -out $@ -outfmt $(OUTFMT) -query $< \
	-db viral_db/viral_protein -evalue 0.001 \
	-dbsize 10000000 -num_threads 6

%_viral_blastp_blastp.fa:filter_extract_fasta.py %_viral_blastp_blastp.txt viralref_rhodophages.faa
	python $< --blast_hits $(word 2, $^) --header $(HEADER)  --out_fasta $@ --fasta $(word 3, $^) -slen 0.6

%_viral_blastp_blastp_un.fa:remove_duplicate_ids.py %_viral_blastp_blastp.fa
	python $< -i $(word 2, $^) -o $@

%_LC_viral.fa:%_viral_blastp_blastp.fa %_LC.fa
	@echo ""
	cat $< $(word 2, $^) > $@

%_LC_viral_un.fa:remove_duplicate_ids.py %_LC_viral.fa
	python $< -i $(word 2, $^) -o $@

%_viral_LC_un.afa:%_LC_viral_un.fa
	muscle -in $< -out $@

%_viral_LC_v1.afa:%_viral_LC_un.afa
	sed 's/>fig|/>gi|/g' $< | sed 's/\.//g' | sed 's/peg/|ref|x| /g'  > $@

%_viral_LC.phy:convert.sh %_viral_LC_v1.afa
	@echo "convert aligned sequences to phylip format"
	sh $< $(word 2, $^) > $@

%_viral_LC.fast_tre:%_viral_LC.phy
	FastTree $< > $@

%_viral_LC_table.txt:giNfileFasta.py %_viral_blastp_blastp_un.fa %_LC.fa
	@echo "creating a table of gi and taxa name"
	python $< -i $(word 2, $^) $(word 3, $^) -o $@

%_viral_LC_gi_org.tab:gi_organism_table.py %_LC_viral_un.fa
	@echo "generate the tab delimited table with gi number as col1 and organism name as col2 for renaming the taxa name in phylogenetic tree"
	python $< -i $(word 2, $^) -o $@

viral_LC_distance_rcap.txt:identify_different_grouped_taxa.R GTAs/orfg2_dir/orfg2_viral_LC.fast_tre
	#gta2
	Rscript $< -i GTAs/orfg2_dir/orfg2_viral_LC.fast_tre -r 294677220 -o GTAs/orfg2_dir/orfg2_viral_LC_distance_rcap.txt
	Rscript $< -i GTAs/orfg3_dir/orfg3_viral_LC.fast_tre -r 294677221 -o GTAs/orfg3_dir/orfg3_viral_LC_distance_rcap.txt
	Rscript $< -i GTAs/orfg4_dir/orfg4_viral_LC.fast_tre -r 294677223 -o GTAs/orfg4_dir/orfg4_viral_LC_distance_rcap.txt
	Rscript $< -i GTAs/orfg5_dir/orfg5_viral_LC.fast_tre -r 294677224 -o GTAs/orfg5_dir/orfg5_viral_LC_distance_rcap.txt
	Rscript $< -i GTAs/orfg6_dir/orfg6_viral_LC.fast_tre -r 294677225 -o GTAs/orfg6_dir/orfg6_viral_LC_distance_rcap.txt
	Rscript $< -i GTAs/orfg7_dir/orfg7_viral_LC.fast_tre -r 294677226 -o GTAs/orfg7_dir/orfg7_viral_LC_distance_rcap.txt
	Rscript $< -i GTAs/orfg8_dir/orfg8_viral_LC.fast_tre -r 294677227 -o GTAs/orfg8_dir/orfg8_viral_LC_distance_rcap.txt
	Rscript $< -i GTAs/orfg11_dir/orfg11_viral_LC.fast_tre -r 294677231 -o GTAs/orfg11_dir/orfg11_viral_LC_distance_rcap.txt
	Rscript $< -i GTAs/orfg12_dir/orfg12_viral_LC.fast_tre -r 294677232 -o GTAs/orfg12_dir/orfg12_viral_LC_distance_rcap.txt
	Rscript $< -i GTAs/orfg13_dir/orfg13_viral_LC.fast_tre -r 294677233 -o GTAs/orfg13_dir/orfg13_viral_LC_distance_rcap.txt
	Rscript $< -i GTAs/orfg14_dir/orfg14_viral_LC.fast_tre -r 294677234 -o GTAs/orfg14_dir/orfg14_viral_LC_distance_rcap.txt
	Rscript $< -i GTAs/orfg15_dir/orfg15_viral_LC.fast_tre -r 294677235 -o GTAs/orfg15_dir/orfg15_viral_LC_distance_rcap.txt
	touch $@

%_viral_LC.pdf:color_taxa_phylo.R %_viral_LC.fast_tre %_viral_LC_table.txt
	@echo "color taxa"
	Rscript $< -i $(word 2, $^) -t $(word 3, $^) -c source -o $@

%_viral_LC_gi_org.fast_tre:taxnameconvert.pl %_viral_LC.fast_tre %_viral_LC_gi_org.tab
	@echo "rename the taxa using the gi_org.tab"
	perl $< -f 1 -t 2 $(word 3, $^) $(word 2, $^) $@

%_subset_list.txt:subset_list.txt
	@echo "copy subset list"
	cp $< $@

%_viral_LC_subset.fa:filter_fasta_org_list.py %_viral_LC.fa %_subset_list.txt
	@echo "subset taxa to only keep interesting ones, %_subset_list.txt is manually created"
	python $< -f $(word 2, $^) -l $(word 3, $^) -o $@

%_viral_LC_subset.afa:%_viral_LC_subset.fa
	muscle -in $< -out $@

%_viral_LC_subset_v1.afa:%_viral_LC_subset.afa
	sed 's/>fig|/>gi|/g' $< | sed 's/\.//g' | sed 's/peg/|ref|x| /g'  > $@

%_viral_LC_subset.phy:convert.sh %_viral_LC_subset_v1.afa
	@echo "convert aligned sequences to phylip format"
	sh $< $(word 2, $^) > $@

%_viral_LC_subset_gi_org.tab:gi_organism_table.py %_viral_LC_subset_v1.afa
	@echo "#generate the tab delimited table with gi number as col1 and organism name as col2 for renaming the taxa name in phylogenetic tree"
	python $< -i $(word 2, $^) -o $@

%_viral_LC_subset.fast_tre:%_viral_LC_subset.phy
	FastTree $< > $@

%_viral_LC_subset_gi_org.fast_tre:taxnameconvert.pl %_viral_LC_subset.fast_tre %_viral_LC_subset_gi_org.tab
	@echo "rename the taxa using the gi_org.tab"
	perl $< -f 1 -t 2 $(word 3, $^) $(word 2, $^) $@

%_viral_LC_subset_gi_org.pdf:color_taxa_phylo.R %_viral_LC_subset_gi_org.fast_tre subset_list_color.txt
	@echo "color taxa"
	Rscript $< -i $(word 2, $^) -t $(word 3, $^) -o $@
