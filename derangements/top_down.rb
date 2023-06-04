# This class calculates the number of derangements for a set of a given size.
# A derangement is a permutation of the elements of a set, such that no element
# appears in its original position.class DerangementCounterTopDown
class DerangementCounterTopDown
# When initializing, we take the size of the set we're considering and
# also set up an array to hold our "sub solutions" - the number of derangements
# for smaller set sizes.
  def initialize(set_size)
    @set_size = set_size
    @sub_solutions = Array.new(set_size + 1, -1)
    # We initialize this array to -1, indicating that we haven't yet found the
    # solution for any set sizes.
  end

  # This method counts the number of derangements for a set of size 'n'.
  def count_derangements(n = @set_size)
    # If we have previously calculated the number of derangements for this set size,
    # we simply return that value.
    # The base cases: there are no derangements for a set of size 1, and there is
    # one derangement for a set of size 2.
    # For larger set sizes, we calculate the number of derangements using the formula,
    # and store the result in our array of sub solutions before returning it.
    case n
    when @sub_solutions[n] != -1
      @sub_solutions[n]
    when 1
      0
    when 2
      1
    else
      result = (n - 1) * (count_derangements(n - 1) + count_derangements(n - 2))
      @sub_solutions[n] = result
      result
    end
  end
end

# Calculate and print the number of derangements for set sizes 1 to 10.
(1..10).each do |i|
  counter = DerangementCounterTopDown.new(i)
  result = counter.count_derangements
  puts "Derangements in set size #{i} -> #{result}"
end
