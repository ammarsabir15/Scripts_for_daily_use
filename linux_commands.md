# Printing a column from a file based on condition
    awk '{ if ($2 < 0.05) print $1 }' file_name # Where $1 and $2 are column names
    awk '{ if ($2 <= 80 && $3 >= 90)  print $1 }' file_name # for multiple conditions
    awk '{ if ($6 <= 0.05 && $3 >= 0.405)  print $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6 }' file_name # for printing multiple columns with tabs in between 

# Pasting the output of a command in termbin 
    echo just testing!  | nc termbin.com 9999

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

# Command for printing words ending with 'neg' using awk
    awk '/neg$/{print}' file.txt

# Command for printing first column of a file using awk
    awk '{ print $1 }' sig2.txt

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

# Command to check the available packages
    apt-cache search openblas # openblas/name of package

# Check if a library is installed or not 
    find /lib* /usr/lib* -name '*open*' # put package instead of open

# Check if a library is installed
    dpkg -L libopenblas-dev # library name at the end

# Command for merging all pdf documents in the directory
    qpdf --empty --pages *.pdf -- out.pdf
    
    
# Renaming the files in a folder
    for file in <file_name><pattern>; do
        mv "$file" "${file/	/}"
    done
    
    
# Command for removing duplicates in from a file
    # Assuming that the words are one per line, and the file is already sorted:

    uniq filename

    # If the file's not sorted:

    sort filename | uniq

    # If they're not one per line, and you don't mind them being one per line:

    tr -s [:space:] \\n < filename | sort | uniq

    # That doesn't remove punctuation, though, so maybe you want:

    tr -s [:space:][:punct:] \\n < filename | sort | uniq
    
 # Compressing the pdf
    gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/screen -dNOPAUSE -dQUIET -dBATCH -sOutputFile=output.pdf input.pdf
    # you can also use other options like ebook, prepress, printer and default 
    
 # For checking the usage of resources by the system in real time
    top
    
 # Compiling Rmarkdown from the linux command line
    Rscript -e "rmarkdown::render('filename')"



