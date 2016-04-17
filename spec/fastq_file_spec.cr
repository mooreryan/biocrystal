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

Spec2.describe Bio::FastqFile do
  describe "::open" do
    it "returns a Bio::FastqFile" do
      expect(Bio::FastqFile.open SpecHelper::TEST_FASTQ).
        to be_a Bio::FastqFile
    end
  end

  describe "#each_record" do
    context "block given" do
      it "yields head, seq, desc and qual for records" do
        fq_file = Bio::FastqFile.open SpecHelper::TEST_FASTQ

        records = Array(Array(String)).new

        fq_file.each_record do |head, seq, desc, qual|
          records << [head, seq, desc, qual]
        end

        expect(records).to eq SpecHelper::FASTQ_RECORDS
      end
    end
  end
end
