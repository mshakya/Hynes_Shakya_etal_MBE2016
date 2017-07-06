#!/usr/bin/Rscript

#loading required packages
require(circlize)
require(optparse)

option_list <- list(
  make_option(c("-i", "--INPUT_VALUES"), action="store",
    help="location of genes/snps to be plotted"),
  make_option(c("-o","--OUT_GRAPH"), action="store",
    help="name of output pdf graph file")
   )

#parse the options
opt <- parse_args(OptionParser(option_list=option_list))

input_values <- opt$INPUT_VALUES
OutGraph <- opt$OUT_GRAPH

circo_plot <- function(input_values){
    #provided size of the genome
    #its name,
    #and the location of attributes to be plotted
    #it will create a circos plate with attributes plotted in exact location

  pch_dic <- c(10, 22, 21, 11, 17, 19, 15, 8)
  names(pch_dic) <- c("endo","orfgTF1", "rcc171", "rcc1865", "rcc1866", "rcc42", "orfg5", "rcc2730")
  print(pch_dic)

  col_dic <- c("yellow","#1b9e77", "#d95f02","#7570b3","#e7298a","#66a61e","red","#e6ab02")
  names(col_dic) <- c("endo", "orfgTF1", "rcc171", "rcc1865", "rcc1866", "rcc42", "orfg5", "rcc2730")

  value_table <- read.table(input_values, sep=",", header=TRUE)
  value_table$measurements <- rep(0, length(value_table$start))
  genome_name <- value_table$host[1]
  genome_size <- value_table$size[1]
  genome_frame <- data.frame(genome_name, c(0), c(genome_size))
  location <- value_table[1:2]
  print(value_table)
  # print(value_table$name[1])
  # print(pch_dic["rcc2730"])
  measurements <- value_table[8]
  #create a bare circular plot based on genome_frame
  circos.genomicInitialize(genome_frame,major.by=500000, sector.width=20)
  #plot the points
  print(nrow(location))

  for (i in 1:nrow(location)){
    print(i)
    gene <- as.character(value_table$name[i])
    print(gene)
    pch_fac <- as.numeric(pch_dic[gene])
    col_fac <- as.character(col_dic[gene])
    print(pch_fac)
    print(col_fac)
    circos.genomicPoints(region=location[i:i,], value=measurements[i:i,], pch=pch_fac, col=col_fac)
    print(location[i:i,])
    print(value_table$name[i])

    print(pch_dic[value_table$name[i]])
    print(col_dic[value_table$name[i]])
  }
}
pdf(file=OutGraph, width=3, height=3)
circo_plot(input_values)
dev.off()