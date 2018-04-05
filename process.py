#Extract the features from sequence:
#Wang haotian 
#
#USAGE: python precess.py the_path_containing_fasta_files
#20180404
###########################################################



import os
import sys
import feature_funcs
import glob
from Bio import SeqIO

lujing = sys.argv[0] #need absolute path

os.chdir(lujing)
a = list(glob.glob(os.getcwd()+"/*.fasta")) #read all *.fasta files in current dir

for i in xrange(0,len(a)): #open file
    t_f_name = a[i].split("/")[-1] + ".features"
    tempfile = open(t_f_name,"w")                              #open a result file for the fasta file
    records = list(SeqIO.parse(a[i]),"fasta")        #parse the fasta file in to sequences
    for i in xrange(0,len(records)):                 #for each sequence
        #Extract funcs from feature_funcs
        #Output the result into the result file t_f_name
        
    tempfile.close() #close the result file t_f_name
