#!/usr/bin/env nextflow

// Split a fasta file into multiple files
process splitSequences {
    publishDir "output"

    input:
    path fasta_file

    output:
    path 'seq_*'

    script:
    """
    awk '/^>/{f="seq_"++d} {print > f}' < ${fasta_file}
    """
}

// Define the workflow
workflow {
    // Define channels for input parameters
    fasta_ch = Channel.fromPath(params.in)

    splitSequences(params.in)
}