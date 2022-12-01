File.open("input.txt").each_line(''){
  (@l||0)<(new_value=_1.split("\n").map(&:to_i).sum)?@l=new_value:nil
}; p @l
