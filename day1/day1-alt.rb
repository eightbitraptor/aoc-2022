File.open("input.txt").each_line(''){
  (@l||0)<(n=_1.split("\n").map(&:to_i).sum)?@l=n:nil
};p@l
