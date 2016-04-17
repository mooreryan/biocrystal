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

module Bio
  class FastaFile < File
    def each_record(*args)
      lineno = 0
      header = ""
      seq = ""

      each_line(*args) do |line|
        lineno += 1

        if line.starts_with?(">") && lineno == 1
          header = line.chomp[1..-1]
        elsif line.starts_with?(">")
          yield(header, seq)

          # reset header and seq
          header = line.chomp[1..-1]
          seq = ""
        else
          seq += line.chomp
        end
      end

      yield(header, seq)
    end
  end
end
