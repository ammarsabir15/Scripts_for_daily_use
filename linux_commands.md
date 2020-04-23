# Command for finding duplicates in a file
grep -wo '[[:alnum:]]\+' infile | sort | uniq -cd

# command for removing newlines with commas and adding inverted commas to the values at the same time
sed -n 's/.*/"&"/; $! s/$/,/; 1 h; 1 ! H; $ { x; s/\n/ /g; p; }' foo.txt

# sed command for separating space with a comma
sed "s/\s/,/g" original_file.txt > edited_file.txt

# replace all space with tabs in linux
perl -p -i -e 's/ /\t/g' file.txt

# Command for moving one directory up:
cd ..

# Command for moving two directories up
cd ../..

# command for showing file tree
tree

# command for listing all directories
ls

# Printing current working directory
pwd

# Changing directory to root directory
cd /

# Printing system specs
lshw -h

# Printing ubuntu version 
lsb_release -a

# Printing name of the user
whoami

# Printing the location of a program
which tool_name

# Making a directory
mkdir [directory_name]

# Printing the connected users with a system
w

# Command for pattern matching 
grep pattern file_name

# Command for merging pdf in linux
pdfunite file1.pdf file2.pdf output.pdf

or
gs -q -sPAPERSIZE=letter -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -sOutputFile=certifications_latest.pdf coursera_certifications.pdf jpg.pdf  

or 
qpdf --empty --pages file1.pdf file2.pdf -- merged.pdf


# Convert an image to pdf
convert *.jpg my.pdf

# Command for creating BAM files in parallel
find   -name "*.fastq" | grep -v _2.fastq | sed 's/_1.fastq//' | parallel bwa mem -t 30 ref.fa {}_1.fastq {}_2.fastq '>' '{}'.sam

# Command for deleting a directory with contents
sudo rm -r <directory name>

# Command for finding file in a linux
sudo find / -name infile.seq

# Downloading multiple files with wget
wget --tries = 400 -i listoflinks -P path/to/dest

# Command for extracting files from sub-directory into parent directory
find . -mindepth 2 -type f -print -exec mv {} . \;

# Command for executing python script from terminal
python -i python_script.py

# Command for extracting .gz files you can use 
gunzip file.gz 

# Command for extracting tar files into current directory
-zxvf yourfile.tar.gz

# Command for extracting zip files from a different directory
tar -C /path_to_directory -zxvf yourfile.tar.gz

# Command for indexing reference genome using bwa
bwa index hg19.fasta

# Command for aligning a genome to reference genome
 bwa aln hg19.fasta Xpress88.fastq>alnX88.sai

# Command for converting .sai file to sam file
bwa samse hg19.fasta  alnX88.sai Xpress88.fastq > data88.aln.sam 

# Command for aligning genomes to the reference
bwa mem ref.fa {}_1.fastq {}_2.fastq '>' '{}'.sam

# Command for indexing genome
 samtools faidx hg19.fasta

# Command for converting sam to bam 
samtools import hg19.fasta.fai data88.aln.sam data88.bam

# Command for sorting a BAM file
samtools sort data88.bam > data88.sorted.bam

# Command for indexing a BAM file
samtools index data88.sorted.bam

# Command for sorting BAM files
samtools sort data88.bam > data88.sorted.bam # for sorting SAM files 

# Command for converting sam file to bam file
samtools view -S -b sample.sam > sample.bam

# Unzip .gz files in parallel
parallel --gnu gunzip ::: *.gz 

# Command for parallelizing alignment operations
find   -name "*.fastq" | grep -v _2.fastq | sed 's/_1.fastq//' | parallel bwa mem -t 30 ref.fa {}_1.fastq {}_2.fastq '>' '{}'.sam |  samtools view -Sb '{}'.sorted.sam '>' '{}'.bam | samtools index '{}'.bam 

# Count occurence of values in column 1 if file is sorted
<infile cut -d' ' -f1 | uniq -c

# Count occurence of values in column 1 if file is not sorted it first:

<infile cut -d' ' -f1 | sort -n | uniq -c

# Remove unneccary white space from a file linux
column -t somefile

# split a column based on a delimiter
cut -d' ' -f2 filename.txt

# delete files with empty size 
find . -size 0 -delete

# script for removing rows having specific value
for i in *.txt; 
do
    awk '$4 != "FAIL"' $i > $i.out
done 

# count occurence of a pattern in multiple files
find *.txt -printf 'echo "$(grep -o "pattern" %p | wc -l) %p";' | sh

# Put a word (echo in this case) before each line. for adding a special character like backslach you need a backslash before it
cat res1.txt | perl -ne 'print "\\publication{" . $_' > res2.txt

# Put a character/text at end of each line (in this case })
sed 's/$/}/' input_file.txt  > output_file.txt

# count sum of all values in a column
awk '{s+=$2}END{print s}' sample_wise_dist 

# compare two files for same values and output same lines of the two files
grep -f file1 file2
comm -12 file1 file2 # this is more accurate

# Command for extracting only publications tags/names from latex .bib file
sed -n '/@article{/,/,/p'  publications.bib | grep -v "title" | cut -d{ -f2|sed 's/,//g

# Command for removing citations from the text files
python pycode input_file |tr -d '(),' output_file

# Error copying data to usb
killall nautilus

# Removing line numbers before a code block
sed 's/ *[0-9]*.//' script > script-no-line-numbers
