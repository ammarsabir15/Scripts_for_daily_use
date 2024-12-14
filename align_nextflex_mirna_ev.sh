#!/bin/bash

# Set the paths to tools and references
FALCO="/home/acri/tools/Falco/falco/bin/falco"
TRIMGALORE="/home/acri/tools/TrimGalore-0.6.6/trim_galore"
STAR="/home/acri/tools/STAR-2.7.9a/bin/Linux_x86_64/STAR"
SAMTOOLS="samtools"
REF_DIR="/references/DERFINDER_ref/STAR_INDEX"
THREADS=16

# Function to check FASTQ quality
check_fastq_quality() {
    local input_file=$1
    local output_dir="reportfalco/$(basename $input_file .fastq.gz)"

    mkdir -p $output_dir
    $FALCO $input_file -o $output_dir
}

# Function to trim reads using the comboseq settings
trim_comboseq_reads() {
    local input_file=$1
    local output_dir="trimfastq/$(basename $input_file .fastq.gz)"

    mkdir -p $output_dir
    $TRIMGALORE -a TGGAATTCTCGGGTGCCAAGG --clip_R1 4 --three_prime_clip_R1 4 --length 18 $input_file --output_dir $output_dir

    echo "$output_dir/$(basename $input_file .fastq.gz)_trimmed.fq.gz"
}

# Function to align reads using the comboseq settings
align_comboseq_reads() {
    local input_file=$1
    local prefix=$2
    local output_prefix="sam/${prefix}"

    $STAR --runThreadN $THREADS --genomeDir $REF_DIR --readFilesIn $input_file --readFilesCommand gunzip -c --outFileNamePrefix $output_prefix --outFilterScoreMinOverLread 0 --outFilterMatchNmin 16 --outFilterMatchNminOverLread 0 --outFilterMismatchNoverLmax 0.025 --alignIntronMax 1 --alignEndsType EndToEnd --outSAMtype BAM Unsorted

}

# Function to sort and index BAM files
sort_and_index_bam() {
    local bam_file=$1
    local sorted_bam_file=$2

    $SAMTOOLS sort -@ $THREADS -o $sorted_bam_file $bam_file
    $SAMTOOLS index $sorted_bam_file
    rm $bam_file
}

# Main loop to process all *.fastq.gz files
for fq_file in fastq/*.fastq.gz; do
    prefix=$(basename $fq_file .fastq.gz)
    lib_type="comboseq"  # Fixed to comboseq as per the request

    echo "Processing $fq_file with prefix $prefix and library type $lib_type"

    # Check FASTQ quality
    echo ""
    echo ""
    echo "testing quality"
    echo ""
    echo ""
    check_fastq_quality $fq_file

    # Trim reads for comboseq
    echo ""
    echo ""
    echo "trimming step"
    echo ""
    echo ""
    trimmed_fq_file=$(trim_comboseq_reads $fq_file)

    # Align reads for comboseq
    echo ""
    echo ""
    echo "alignment using STAR"
    echo ""
    echo ""
    align_comboseq_reads $trimmed_fq_file $prefix

    # Sort and index the resulting BAM file
    echo ""
    echo ""
    echo "sorting and indexing"
    echo ""
    echo ""
    aligned_bam="sam/${prefix}Aligned.out.bam"
    sorted_bam="sam/${prefix}.s.bam"
    sort_and_index_bam $aligned_bam $sorted_bam
done
