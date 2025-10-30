#!/usr/bin/env nextflow

// Split a fasta file into multiple files
process splitSequences {
    publishDir "output"

    input:
    path "${params.in}"

    output:
    path 'seq_*'

    """
    # Splits a multi-fasta file into individual sequence files, one per record
    awk '/^>/{f="seq_"++d} {print > f}' < ${params.in}
    """
}

// Define the workflow
workflow {
    splitSequences(params.in) \
}