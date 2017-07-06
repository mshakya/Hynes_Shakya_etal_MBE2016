#!/usr/bin/env python
#File created on November 6, 2014

"""the script formats the blastp results
"""

__author__ = "Migun Shakya"
__email__ = "microbeatic@gmail.com"
__version__ = "0.1"
__license__ = "The MIT License (MIT)"


#--- standard library imports
import argparse

#--- third-party imports

#--- project specific imports
from fasta import fasta2gilist


def cmdline_parser():
    """
    creates an argparse instance
    """
    parser = argparse.ArgumentParser(description="""given a fasta file subsets ptt table""")
    parser.add_argument("-i", "--ptt_table", help="""ptt table""")
    parser.add_argument("-f", "--in_fasta", help="""fasta""")
    parser.add_argument("-o", "--output", help="""output ptt table""")
    return parser


def main():
    """
    The main function
    """
    parser = cmdline_parser()
    args = parser.parse_args()

    gi_list = fasta2gilist(args.in_fasta)
    with open(args.ptt_table, 'r') as p:
        with open(args.output, 'w') as sp:
            for x in xrange(3):  # skip 3 lines
                sp.write(p)
            for line in p:
                parts = line.split('\t')
                PID = parts[3]
                if PID in gi_list:
                    sp.write(line)


if __name__ == '__main__':
    main()