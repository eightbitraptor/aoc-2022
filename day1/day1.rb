require 'stringio'

class SumGroups
  NEWLINE = "\n"

  def self.build(in_str)
    groups = []
    in_str.each_line('') do |line|
      groups << line.split(NEWLINE).map(&:to_i)
    end

    new(groups)
  end

  def initialize(sum_groups)
    @sum_groups = sum_groups
  end

  def max_group_total
    @sum_groups.flat_map(&:sum).max
  end
end

if __FILE__ == $0
  if ENV['TEST']
    require 'minitest/autorun'
    class SumGroupsTest < Minitest::Test
      def test_sums_calories_for_a_single_group
        input = [[1, 2, 3]]
        counter = SumGroups.new(input)

        assert_equal(6, counter.max_group_total)
      end

      def test_sums_groups_individually
        input = [[1, 2, 3], [4, 5, 6]]
        counter = SumGroups.new(input)

        assert_equal(15, counter.max_group_total)
      end

      def test_building_the_input_from_an_io_object
        input = StringIO.new("1\n2\n3\n\n4\n5\n6\n")
        counter = SumGroups.build(input)

        assert_equal(15, counter.max_group_total)
      end
    end
  else
    input = File.open("input.txt")
    p SumGroups.build(input).max_group_total
  end
end

