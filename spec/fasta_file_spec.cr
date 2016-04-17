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

require "./spec_helper"

Spec2.describe Bio::FastaFile do
  describe "::open" do
    it "returns a Bio::FastaFile" do
      expect(Bio::FastaFile.open SpecHelper::TEST_FASTA).
        to be_a Bio::FastaFile
    end
  end

  describe "#each_record" do
    context "block given" do
      it "yields head, seq, desc and qual for records" do
        fa_file = Bio::FastaFile.open SpecHelper::TEST_FASTA

        headers = Array(String).new
        seqs    = Array(String).new

        fa_file.each_record do |head, seq|
          headers << head
          seqs    << seq
        end

        expect([headers, seqs]).to eq SpecHelper::FASTA_RECORDS
      end
    end
  end
end
