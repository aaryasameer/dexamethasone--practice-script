###Udemy- RNA Seq data analysis course####
##(built a feature count matrix in linux)

###installing DESeq2
BiocManager::install("DESeq2")
###installing Genomic features
BiocManager::install("GenomicFeatures")

library(readxl)

counts <- read.csv("C:\\Users\\AARYA\\Downloads\\counts.csv")
met <- read.csv("C:\\Users\\AARYA\\Downloads\\metadata2.csv")

str(counts)
str(met)

##quality check
#make sure the rows in metadata match the columns in feature count matrix
all(colnames(counts) %in% rownames(met))
#check order
all(colnames(counts)== rownames(met))

##load deseq library
library(DESeq2)

##create design for differentially expressed genes
dds <- DESeqDataSetFromMatrix(countData = counts,
                              colData = met,
                              design = ~dexamethasone)
dds #check if dataset has been successfully generated

class(dds)

##removal of low read counts due to leaky expression of genes
keep <- rowSums(counts(dds)) >= 10
dds_new <- dds[keep, ]
print(head(counts(dds_new)))





