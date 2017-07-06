require(ape)

colorBranch <- function(phy, focus, col=rainbow, ...){
  # a function that colors the branches
  # colors branches specified in focus
  # with rainbow color palette
  if (!is.list(focus))
    focus <- list(focus)
  n <- length(focus)
  if (is.function(col)) {
    col <- col(n) }
  else {col <- col}

  #assign color to each branch
  colo <- rep("black", dim(phy$edge)[1])
  #replace colors based on the given branch
  for (i in 1:n) colo[which.edge(phy, focus[[i]])] <- col[i]
  #b_times <- branching.times(phy)[1]
  plot.phylo(phy, edge.color=colo, ...)
  #dev.off()
}


pdf("~/Desktop/GTA/LangPaper/results/2015-11-16/GTA_tree_ML.pdf",50,55)
oma.saved <- par("oma")
par(oma = rep.int(0, 4))
par(oma = oma.saved)
o.par <- par(mar = rep.int(0, 4))
on.exit(par(o.par))
m<-rbind(c(26:30),c(1:5),c(1:5), c(1:5), c(1:5),
         c(31:35),c(6:10),c(6:10),c(6:10),c(6:10),
         c(36:40),c(11:15),c(11:15),c(11:15),c(11:15),
         c(41:45),c(16:20),c(16:20),c(16:20),c(16:20),
         c(46:50),c(21:25),c(21:25),c(21:25),c(21:25))
layout(m)

#coloring based on GTAs, rhodobacterales-virus, alpha-virus


##################read trees ##################

#1. rcc171
setwd("~/Desktop/GTA/LangPaper/results/2015-12-03/GTAs/")
rcc171<-read.tree("rcc171_dir/rcc171_viral_LC_un_.tre")

#2. rcc555
#setwd("~/Desktop/GTA/LangPaper/results/2015-10-05/GTAs/")
# decided not to use the new one (2015-12-03), as the only difference 
# compared to 2015-10-05 is one taxa
# and even the shape looks the same too
#setwd("~/Desktop/GTA/LangPaper/results/2015-12-03/GTAs/")
rcc555<-read.tree("endo_dir/endo_viral_LC_un_.tre")
#rcc555<-read.tree("endo_dir/endo_LC_viral_rhodo_.tre")

#3.rcc556
setwd("~/Desktop/GTA/LangPaper/results/2015-09-30")
rcc556<-read.tree("rspr_/holin_blastp_psiblast_rhodo_only_bestPara.tre")

#4. rcc1079
setwd("~/Desktop/GTA/LangPaper/results/2015-12-03/GTAs/")
TF1<-read.tree("orfgTF1_dir/orfgTF1_viral_LC_un_.tre")

#5. rcc1080
#no viral homologs
TF2<-read.tree("orfgTF2_dir/orfgTF2_viral_LC_un_.tre")


#6. orfg1
setwd("~/Desktop/GTA/LangPaper/results/2015-09-30")
#no viral homologs
orfg1 <- read.tree("rspr_/orfg1_blastp_psiblast_rhodo_only_bestPara.tre")


#7. orfg2
setwd("~/Desktop/GTA/LangPaper/results/2015-10-03/GTAs/")
orfg2<-read.tree("orfg2_dir/orfg2_LC_viral_rhodo_.tre")

#8. orfg3
orfg3 <- read.tree("orfg3_dir/orfg3_LC_viral_rhodo_.tre")

#9 orfg3.5
#no viral homolog
setwd("~/Desktop/GTA/LangPaper/results/2015-09-30")
orfg3.5 <- read.tree("rspr_/orfg3_5_blastp_psiblast_rhodo_only_bestPara.tre")

#10. orfg4
setwd("~/Desktop/GTA/LangPaper/results/2015-10-03/GTAs/")
orfg4 <- read.tree("orfg4_dir/orfg4_LC_viral_rhodo_.tre")

#11. orfg5
orfg5 <- read.tree("orfg5_dir/orfg5_LC_viral_rhodo_.tre")

#12. orfg6
orfg6 <- read.tree("orfg6_dir/orfg6_LC_viral_rhodo_.tre")

#13. orfg7
orfg7 <- read.tree("orfg7_dir/orfg7_LC_viral_rhodo_.tre")

#14. orfg8
orfg8 <- read.tree("orfg8_dir/orfg8_LC_viral_rhodo_.tre")

#16. orfg9
setwd("~/Desktop/GTA/LangPaper/results/2015-09-30")
#no viral homologs
orfg9 <- read.tree("rspr_/orfg9_blastp_psiblast_rhodo_only_bestPara.tre")

#17. orfg10
#no viral homologs
orfg10 <- read.tree("rspr_/orfg10_blastp_psiblast_rhodo_only_bestPara.tre")

#18. orfg10.1
#no viral homologs
orfg10.1 <- read.tree("rspr_/orfg10_5_blastp_psiblast_rhodo_only_bestPara.tre")

#19. orfg11
setwd("~/Desktop/GTA/LangPaper/results/2015-10-03/GTAs/")
orfg11 <- read.tree("orfg11_dir/orfg11_LC_viral_rhodo_.tre")

#20. orfg12
orfg12 <- read.tree("orfg12_dir/orfg12_LC_viral_rhodo_.tre")

#19. orfg13
orfg13 <- read.tree("orfg13_dir/orfg13_LC_viral_rhodo_.tre")

#20. orfg14
orfg14 <- read.tree("orfg14_dir/orfg14_LC_viral_rhodo_.tre")

#21. orfg15
orfg15 <- read.tree("orfg15_dir/orfg15_LC_viral_rhodo_.tre")

#22. rcc1865
setwd("~/Desktop/GTA/LangPaper/results/2015-10-05/GTAs/")
rcc1865<-read.tree("rcc1865_dir/rcc1865_LC_viral_rhodo_.tre")

#23. rcc1866
rcc1866<-read.tree("rcc1866_dir/rcc1866_LC_viral_rhodo_.tre")

####################calculate minimum max length####################
multi_tree <- list(rcc171, rcc555, rcc556, TF1, TF2, orfg1, orfg2, orfg3,
                   orfg3.5, orfg4, orfg5, orfg6, orfg7, orfg8, orfg9, orfg10,
                   orfg10.1, orfg11, orfg12, orfg13, orfg14, orfg15,
                   rcc1865, rcc1866)
rts <- sapply(multi_tree, function(x) max(cophenetic.phylo(x)))
maxrts <- max(rts)
lim <- cbind(rts - maxrts, rts)



####################plot trees#########################
#1 rcc171
colorBranch(rcc171, list(c(28:45, 50:58),c(25:26,46:49,59,62), c()),
            col=c("#d95f02", "#377eb8", "purple3"),
            type="unrooted", show.tip.label=FALSE,
            x.lim=lim[1,], y.lim=lim[1,])
add.scale.bar(0,0,0.5, lwd=3, cex=4)
box()

#2.rcc555

colorBranch(rcc555, list(c(1:18, 25:27, 31, 77), c(28:30), c(32,33)),
            col=c("#d95f02", "#377eb8", "purple3"),
            type="unrooted", show.tip.label=FALSE,
            x.lim=lim[2,], y.lim=lim[2,])
# use bottom option when using older tree 
#colorBranch(rcc555, c(1:17, 20:22, 71, 76),
#            col=c("#d95f02", "#377eb8", "purple3"),
#            type="unrooted", show.tip.label=FALSE,
#            x.lim=lim[2,], y.lim=lim[2,])
add.scale.bar(0,0,0.5, lwd=3, cex=4)
box()

#3. rcc556
# no viral homologs, only rhodobacterales
colorBranch(rcc556, c(1:22),
            col=c("#d95f02", "#377eb8", "purple3"),
            type="unrooted", show.tip.label=FALSE,
            x.lim=lim[3,], y.lim=lim[3,])
add.scale.bar(0,0,0.5, lwd=3, cex=4)
text(-3, -5, "no viral homologs detected", pos=3, cex=5)
box()

#4.rcc1079
colorBranch(TF1, list(c(1:5,7:8,10,12:17), c(6,11), c(9)),
            col=c("#d95f02", "#377eb8", "purple3"),
            type="unrooted", show.tip.label=FALSE,
            x.lim=lim[4,], y.lim=lim[4,])
add.scale.bar(0,0,0.5, lwd=3, cex=4)
box()

#5. rcc1080
colorBranch(TF2, list(c(15:18), c(19), c()),
            col=c("#d95f02", "#377eb8", "purple3"),
            type="unrooted", show.tip.label=FALSE,
            x.lim=lim[5,], y.lim=lim[5,])
add.scale.bar(0,-5,0.5, lwd=3, cex=4)
box()

#6. orfg1
# no viral homologs, only rhodobacterales
colorBranch(orfg1, list(c(1:21), c(), c()),
            col=c("#d95f02", "#377eb8", "purple3"),
            type="unrooted", show.tip.label=FALSE,
            x.lim=lim[6,], y.lim=lim[6,])
add.scale.bar(0, -2, 0.5, lwd=3, cex=4)
text(-3, -5, "no viral homologs detected", pos=3, cex=5)
box()

#7. orfg2
colorBranch(orfg2, list(c(194:211), c(107:109), c(79:84)),
            col=c("#d95f02", "#377eb8", "purple3"),
            type="unrooted", show.tip.label=FALSE,
            x.lim=lim[7,], y.lim=lim[7,])
add.scale.bar(0,0,0.5, lwd=3, cex=4)
box()

#8. orfg3
colorBranch(orfg3, list(c(227:247),c(190),c(189,226)),
            col=c("#d95f02", "#377eb8", "purple3"),
            type="unrooted", show.tip.label=FALSE,
            x.lim=lim[8,], y.lim=lim[8,])
add.scale.bar(0,0,0.5, lwd=3, cex=4)
box()

#9. orfg3.5
# no viral homologs, only rhodobacterales

colorBranch(orfg3.5, list(c(1:22),c(),c()),
            col=c("#d95f02", "#377eb8", "purple3"),
            type="unrooted", show.tip.label=FALSE,
            x.lim=lim[9,], y.lim=lim[9,])
add.scale.bar(0,0,0.5, lwd=3, cex=4)
text(-5, -5, "no viral homologs detected", pos=3, cex=5)
box()

#10. orfg4
colorBranch(orfg4, list(c(101:121),c(205),c(127,68)),
            col=c("#d95f02", "#377eb8", "purple3"),
            type="unrooted", show.tip.label=FALSE,
            x.lim=lim[10,], y.lim=lim[10,])
add.scale.bar(0,0,0.5, lwd=3, cex=4)
box()

#11. orfg5
colorBranch(orfg5, list(c(101:120),c(206:209),c(127)),
            col=c("#d95f02", "#377eb8", "purple3"),
            type="unrooted", show.tip.label=FALSE,
            x.lim=lim[11,], y.lim=lim[11,])
add.scale.bar(0,0,0.5, lwd=3, cex=4)
box()

#12. orfg6
colorBranch(orfg6, list(c(69:89),c(67),c(99)),
            col=c("#d95f02", "#377eb8", "purple3"),
            type="unrooted", show.tip.label=FALSE,
            x.lim=lim[12,], y.lim=lim[12,])
add.scale.bar(0,0,0.5, lwd=3, cex=4)
box()

#13. orfg7
colorBranch(orfg7, list(c(72:92),c(20),c(101)),
            col=c("#d95f02", "#377eb8", "purple3"),
            type="unrooted", show.tip.label=FALSE,
            x.lim=lim[13,], y.lim=lim[13,])
add.scale.bar(0,0,0.5, lwd=3, cex=4)
box()
r
#14. orfg8
colorBranch(orfg8, list(c(29:49),c(28), c()),
            col=c("#d95f02", "#377eb8", "purple3"),
            type="unrooted", show.tip.label=FALSE,
            x.lim=lim[14,], y.lim=lim[14,])
add.scale.bar(0,0,0.5, lwd=3, cex=4)
box()

#15. orfg9
# no viral homologs, only rhodobacterales.
# drop Caulo
orfg9_d<-drop.tip(orfg9, "Caulobacter_crescentus_CB15")
colorBranch(orfg9_d, list(c(1:21), c(), c()),
            col=c("#d95f02", "#377eb8", "purple3"),
            type="unrooted", show.tip.label=FALSE,
            x.lim=lim[15,], y.lim=lim[15,])
add.scale.bar(0,0,0.5, lwd=3, cex=4)
text(-5, -5, "no viral homologs detected", pos=3, cex=5)
box()
 
#16. orfg10
orfg10_d <- drop.tip(orfg10, "Caulobacter_crescentus_CB15")
colorBranch(orfg10_d, list(c(1:21)),
            col=c("#d95f02", "#377eb8", "purple3"),
            type="unrooted", show.tip.label=FALSE,
            x.lim=lim[16,], y.lim=lim[16,])
add.scale.bar(0,0,0.5, lwd=3, cex=4)
text(-5, -5, "no viral homologs detected", pos=3, cex=5)
box()


#17. orfg10.1
orfg10.1_d <- drop.tip(orfg10.1, "Caulobacter_crescentus_CB15")
colorBranch(orfg10.1_d, list(c(1:21),c(),c()),
            col=c("#d95f02", "#377eb8", "purple3"),
            type="unrooted", show.tip.label=FALSE,
            x.lim=lim[17,], y.lim=lim[17,])
add.scale.bar(0,0,0.5, lwd=3, cex=4)
text(-5, -5, "no viral homologs detected", pos=3, cex=5)
box()

#18. orfg11
colorBranch(orfg11, list(c(1:10,12:21), c(), c(11)),
            col=c("#d95f02", "#377eb8", "purple3"),
            type="unrooted", show.tip.label=FALSE,
            x.lim=lim[18,], y.lim=lim[18,])
add.scale.bar(0,0,0.5, lwd=3, cex=4)
box()

#19. orfg12
colorBranch(orfg12, list(c(7:27), c(2:6,35),c(28:33)),
            col=c("#d95f02", "#377eb8", "purple3"),
            type="unrooted", show.tip.label=FALSE,
            x.lim=lim[19,], y.lim=lim[19,])
add.scale.bar(0,0,0.5, lwd=3, cex=4)
box()

#20. orfg13
colorBranch(orfg13, list(c(45:65),c(1:3,20:23,66:68),c()),
            col=c("#d95f02", "#377eb8", "purple3"),
            type="unrooted", show.tip.label=FALSE,
            x.lim=lim[13,], y.lim=lim[13,])
add.scale.bar(0,0,0.5, lwd=3, cex=4)
box()

#21. orfg14
colorBranch(orfg14, list(c(12:32),c(7:11, 33:36),c(1:6, 108:109)),
            col=c("#d95f02", "#377eb8", "purple3"),
            type="unrooted", show.tip.label=FALSE,
            x.lim=lim[20,], y.lim=lim[21,])
add.scale.bar(0,0,0.5, lwd=3, cex=4)
box()

#22. orfg15
colorBranch(orfg15, list(c(15:34), c(1:2,35:40), c()),
            col=c("#d95f02", "#377eb8", "purple3"),
            type="unrooted", show.tip.label=FALSE,
            x.lim=lim[22,], y.lim=lim[22,])
add.scale.bar(0,0,0.5, lwd=3, cex=4)
box()

#23. rcc1865
colorBranch(rcc1865, list(c(1:18,20:21), c(19),c()),
            col=c("#d95f02", "#377eb8", "purple3"),
            type="unrooted", show.tip.label=FALSE,
            x.lim=lim[23,], y.lim=lim[23,])
add.scale.bar(0,0,0.5, lwd=3, cex=4)
box()

#24. rcc1866
colorBranch(rcc1866, list(c(1:17,19:20), c(18), c(21)),
            col=c("#d95f02", "#377eb8", "purple3"),
            type="unrooted", show.tip.label=FALSE,
            x.lim=lim[24,], y.lim=lim[24,])
add.scale.bar(0,0,0.5, lwd=3, cex=4)
box()

#25
plot.new()
legend(0, 0.8, title="RcGTA homologs from: ", border = "black", cex=4, bty="n",
       c("Rhodobacterales bacteria", "Rhodobacterales phages",
         "other alphaproteobacterial phages",
         "all other phages"),
       fill = c("#d95f02", "#377eb8", "purple3", "black"))



#26
plot.new()
text(0.5, 0.5, "rcc00171", cex=8)
box()

#27
plot.new()
text(0.5, 0.5, "rcc00555", cex=8)
box()

#28
plot.new()
text(0.5, 0.5, "rcc00556", cex=8)
box()

#29
plot.new()
text(0.5, 0.5, "rcc01079", cex=8)
box()

#30
plot.new()
text(0.5, 0.5, "rcc01080", cex=8)
box()

#31
plot.new()
text(0.5, 0.5, "rcc01682 (g1)", cex=8)
box()

#32
plot.new()
text(0.5, 0.5, "rcc01683 (g2)", cex=8)
box()

#33
plot.new()
text(0.5, 0.5, "rcc01684 (g3)", cex=8)
box()

#34
plot.new()
text(0.5, 0.5, "rcc01685 (g3.5)", cex=8)
box()

#35
plot.new()
text(0.5, 0.5, "rcc01686 (g4)", cex=8)
box()

#36
plot.new()
text(0.5,0.5,"rcc01687 (g5)",cex=8)
box()

#37
plot.new()
text(0.5, 0.5, "rcc01688 (g6)", cex=8)
box()

#38
plot.new()
text(0.5, 0.5, "rcc01689 (g7)", cex=8)
box()

#39
plot.new()
text(0.5, 0.5, "rcc01690 (g8)", cex=8)
box()

#40
plot.new()
text(0.5, 0.5, "rcc01691 (g9)", cex=8)
box()

#41
plot.new()
text(0.5, 0.5, "rcc01692 (g10)", cex=8)
box()
#42
plot.new()
text(0.5, 0.5, "rcc01693 (g10.1)", cex=8)
box()
#43
plot.new()
text(0.5, 0.5, "rcc01694 (g11)", cex=8)
box()
#44
plot.new()
text(0.5, 0.5, "rcc01695 (g12)", cex=8)
box()
#45
plot.new()
text(0.5, 0.5, "rcc01696 (g13)", cex=8)
box()
#46
plot.new()
text(0.5, 0.5, "rcc01697 (g14)", cex=8)
box()
#47
plot.new()
text(0.5, 0.5, "rcc01698 (g15)", cex=8)
box()
#48
plot.new()
text(0.5, 0.5, "rcc01865", cex=8)
box()
#49
plot.new()
text(0.5, 0.5, "rcc01866", cex=8)
box()


#50
plot.new()
text(0.5, 0.5, "LEGENDS", cex=8)
box()

dev.off()
