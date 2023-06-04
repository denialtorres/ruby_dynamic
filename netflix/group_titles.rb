require 'pry'

def group_anagram_titles(titles)
  # We use a hash to group the titles with the same character counts
  grouped_titles = {}

  titles.each do |title|
    # Initialize an array to hold the count of each letter in the title
    letter_counts = Array.new(26, 0)

    # Count each letter in the title
    title.each_char do |char|
      index = char.ord - 'a'.ord
      letter_counts[index] += 1
    end

    # We use the counts of each letter as a key in our hash.
    # This way, all titles with the same counts (i.e., anagrams) will be grouped together
    key = letter_counts.to_a

    # If this key already exists in our hash, add the title to that group.
    # Otherwise, create a new group with this title
    if grouped_titles.include? key
      grouped_titles[key].push(title)
    else
      grouped_titles[key] = [title]
    end
  end

  # Return the grouped titles
  grouped_titles.values
end

# Driver code
titles = ["duel", "dule", "speed", "spede", "deul", "cars", "spdee"]
grouped_titles = group_anagram_titles(titles)
query = "spdee"

# Searching for all titles
grouped_titles.each do |group|
  if group.include? query
    puts group
  end
end
