# This class calculates the number of derangements for a set of a given size.
# A derangement is a permutation of the elements of a set, such that no element
# appears in its original position.
class DerangementCounter
  def initialize(set_size)
    @set_size = set_size
  end

  # Recursively counts the number of derangements for a set of size 'n'.
  # For sets of size 1 and 2, the number of derangements is 0 and 1 respectively.
  # For larger sets, the number of derangements is calculated using a recursive formula.
  def count_derangements(n = @set_size)
    case n
    when 1
      0
    when 2
      1
    else
      (n - 1) * (count_derangements(n - 1) + count_derangements(n - 2))
    end
  end
end

# Calculate and print the number of derangements for set sizes 1 to 10.
(1..10).each do |i|
  counter = DerangementCounter.new(i)
  result = counter.count_derangements
  puts "Derangements in set size #{i} -> #{result}"
end
