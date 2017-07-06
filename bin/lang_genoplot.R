#!/usr/bin/Rscript

#loading required libraries

#for plotting GTA genes using geoplotR
require(genoPlotR)
require(optparse)

#short flag has to be one letter, used in1 and in2, which gave me error

option_list <- list(
  make_option(c("-i", "--PTT_TABLE"), action="store",
    help="ptt table"),
  make_option(c("-o","--OUT_GRAPH"), action="store",
    help="name of output pdf graph file")
   )

#parse the options
opt <- parse_args(OptionParser(option_list=option_list))


PttTable <- opt$PTT_TABLE
OutGraph<- opt$OUT_GRAPH

plot_genoplot_from_ptt <- function(ptt_table){
  dna_segs<-read_dna_seg_from_ptt(ptt_table, meta_lines=2)
  dna_segs$col<-"orange"
  dna_seg_object <- c(dna_segs)
  annots <- lapply(dna_seg_object[1], function(x){mid=middle(x)
                                                  annots=annotation(x1=mid,text=x$name,rot=30)})
  list_of_all_ranges<-list()
  list_of_coordinates=sort(c(dna_seg_object[[1]]$start, dna_seg_object[[1]]$end))
  range_of_coordinates = tapply(list_of_coordinates, cumsum(c(TRUE, diff(list_of_coordinates) > 20000)), range)
  list_range_of_coordinates=unname(unlist(range_of_coordinates))
  list_of_all_ranges[[1]]=list_range_of_coordinates
  plot_object <- plot_gene_map(dna_seg_object, xlims = list_of_all_ranges,
                               annotations=annots, dna_seg_scale = TRUE)
  return(plot_object)
}

pdf(file=OutGraph, width=12, height=8)
plot_genoplot_from_ptt(PttTable)
dev.off()
#ff9933
# #Rhodobacter capsulatus
# plot_genoplot_from_ptt('ptt_tables/Rcap_GTA_associated_genes.ptt')

# #Paracoccus denitrificans
# plot_genoplot_from_ptt('ptt_tables/PdenitrificansPD1222_2.ptt')

# #Octadecabacter antarcticus
# plot_genoplot_from_ptt('ptt_tables/Octadecabacter_antarcticus_gta.ptt')

# #Rhodobacter sphaeroids
# plot_genoplot_from_ptt('ptt_tables/Rsphaeroids_241_1.ptt')

# #Ruegeria
# plot_genoplot_from_ptt('ptt_tables/Ruegeria_gta.ptt')


