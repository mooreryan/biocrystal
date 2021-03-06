# Copyright 2016 Ryan Moore
# Contact: moorer@udel.edu
#
# This file is part of BioCrystal.
#
# BioCrystal is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# BioCrystal is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with BioCrystal.  If not, see <http://www.gnu.org/licenses/>.

require "spec2"
require "../src/bio"

module SpecHelper
  TEST_FILE_DIR = File.join File.dirname(__FILE__), "test_files"

  TEST_FASTQ = File.join TEST_FILE_DIR, "test.fq"
  TEST_FASTA = File.join TEST_FILE_DIR, "test.fa"

  FASTQ_RECORDS = [["seq1", "AA CC TT GG", "", ")# 3g Tq N8"],
                   ["seq2 apples", "ACTG", "seq2 apples", "*ujM"]]

  FASTA_HEADERS = [" empty seq at beginning",
                   "seq1 is fun",
                   "seq2",
                   " empty seq 1",
                   " empty seq 2",
                   "seq3",
                   "seq 4 > has many '>' in header",
                   "empty seq at end",]

  FASTA_SEQS    = ["",
                   "AAC TGG NN N",
                   "AATCCTGNNN",
                   "",
                   "",
                   "yyyyyyyyyyyyyyyNNN",
                   "ACTGactg",
                   "",]

  FASTA_RECORDS = [FASTA_HEADERS, FASTA_SEQS]

end
