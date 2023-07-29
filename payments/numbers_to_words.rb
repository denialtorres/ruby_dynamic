## puts number_to_words(123)      # Output: "One Hundred Twenty Three"
## puts number_to_words(12345)    # Output: "Twelve Thousand Three Hundred Forty Five"
## puts number_to_words(1234567)  # Output: "One Million Two Hundred Thirty Four Thousand Five Hundred Sixty Seven"

def number_to_words(num)
  return "Zero" if num == 0

  less_than_20 = %w[Zero One Two Three Four Five Six Seven Eight Nine Ten Eleven Twelve Thirteen Fourteen Fifteen Sixteen Seventeen Eighteen Nineteen]
  tens = %w[Zero Ten Twenty Thirty Forty Fifty Sixty Seventy Eighty Ninety]
  thousands = %w[Zero Thousand Million Billion]

  result = []

  i = 0
  while num > 0
    part = num % 1000
    if part > 0
      words = []
      hundreds = part / 100
      part %= 100
      words << less_than_20[hundreds] + " Hundred" if hundreds > 0
      if part < 20
        words << less_than_20[part] if part > 0
      else
        tens_digit = part / 10
        ones_digit = part % 10
        words << tens[tens_digit]
        words << less_than_20[ones_digit] if ones_digit > 0
      end
      words << thousands[i] if i > 0
      result.unshift(words.join(" "))
    end
    num /= 1000
    i += 1
  end

  result.join(" ")
end
