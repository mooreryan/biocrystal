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
  class FastqFile < File
    def each_record(*args)
      count = 0
      header = ""
      sequence = ""
      description = ""
      quality = ""

      each_line(*args) do |line|
        line = line.chomp

        case count
        when 0
          header = line[1..-1]
        when 1
          sequence = line
        when 2
          description = line[1..-1]
        when 3
          count = 0
          quality = line
          yield(header, sequence, description, quality)
        end
      count += 1
      end
    end
  end
end
