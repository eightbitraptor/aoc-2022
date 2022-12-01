File.open("input.txt").each_line('') do |l|
  if (@last_value || 0) < (new_value = l.split("\n").map(&:to_i).sum)
    @last_value = new_value
  end
end
p @last_value
