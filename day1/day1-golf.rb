p File.read("input.txt").split("\n\n").map{_1.split.map(&:to_i)}.map(&:sum).max


