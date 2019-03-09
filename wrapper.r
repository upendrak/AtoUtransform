#!/usr/bin/Rscript

# load libraries
library(getopt)

args<-commandArgs(TRUE)

options<-matrix(c('input_file',  'f', 1,  "character",    # input file name
                  'output_file', 'o',  1,  "character",      # output file name
                  'help',   'h',    0,      "logical"),
                            ncol=4,byrow=TRUE)

ret.opts<-getopt(options,args)

if ( !is.null(ret.opts$help) ) {
  cat(getopt(options, usage=TRUE));
  q(status=1);
}

input_file <- ret.opts$input_file
output_file <- ret.opts$output_file
fneighbor -datafile input_file -outfile output_file

# library(ape)

# nj_tree <- read.tree()
# png(file = "original.png")
# plot.phylo(nj_tree, main="")
# dev.off()
# l <- 10^(-1:6)
# cv <- numeric(length(l))
# for (i in 1:length(l))
#      cv[i] <- sum(attr(chronopl(nj_tree, lambda = l[i], CV=TRUE), "D2"))
# lambda_m <- median(l)
# pl_tree <- chronopl(nj_tree, lambda = lambda_m)
# png(file = "testing.png")
# plot.phylo(pl_tree, main="")
# dev.off()
