#!/usr/bin/env nextflow

// Define channels for input parameters
Channel.fromPath(params.in)
    .set { fasta_ch }

// Split a fasta file into multiple files
process splitSequences {
    publishDir "output"

    input:
    path fasta_file

    output:
    path 'seq_*'

    """
    awk '/^>/{f="seq_"++d} {print > f}' < ${fasta_file}
    """
}

// Define the workflow
workflow {
    splitSequences(params.in) \
}