#circRNA2gtf
#Wang haotian 20180403

#run the script in the directory containing the CIRCExplorer reports


#convert the reports to gff files
filelist<-list.files(pattern = "*txt") #load the report files
for (i in 1:length(filelist)){
  temp<-read.table(filelist[i],header = F,stringsAsFactors = F)
  temp$e<-"exon"    #define those trans as exon
  name<-paste(filelist[i],"gff",sep = ".")
  temp1<-temp[,c(1,4,10,2,3,5,8,7)]   #order: chr, method, type, start, end, value, strand, start_condon(no use), (attribute)  
  at<-paste0("gene_id ","\"",
             paste(temp1$V1,temp1$V2,temp$V9,sep="_"),"\"",
             "; ","transcript_id ","\"",
             paste("m",temp1$V1,temp1$V2,temp$V9,sep="_"),"\"",";")
  temp1$at<-at  #add attributes
  temp1<-unique(temp1)
  write.table(temp1,file=name,col.names = F,row.names = F,
              quote = F,sep="\t")
}

#extract the fasta seq by gffread
gtflist<-list.files(pattern="*gff")
for (i in 1:length(gtflist)){
  command<-paste0("gffread ",gtflist[i],
                 " -g ",
                 "~/KIZ/shuju_from_web/RefNome/Human/fa/GRCh37.p13.genome.fa -w ",
                 gtflist[i],".fasta") #generate the command used in shell
  system(command,intern = T)
  
}
