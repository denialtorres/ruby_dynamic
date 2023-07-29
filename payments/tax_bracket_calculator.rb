# You are given a 0-indexed 2D integer array brackets where brackets[i] = [upperi, percenti] means that the ith tax bracket has an upper bound of upperi and is taxed at a rate of percenti. The brackets are sorted by upper bound (i.e. upperi-1 < upperi for 0 < i < brackets.length).
#
# Tax is calculated as follows:
#
# The first upper0 dollars earned are taxed at a rate of percent0.
# The next upper1 - upper0 dollars earned are taxed at a rate of percent1.
# The next upper2 - upper1 dollars earned are taxed at a rate of percent2.
# And so on.


brackets = [[2,7],[3,17],[4,37],[7,6],[9,83],[16,67],[19,29]]
income = 18
# @param {Integer[][]} brackets
# @param {Integer} income
# @return {Float}
def calculate_tax(brackets, income)
    return 0 if income&.zero?

    pay_iteration = []

    brackets.each_with_index do |braket, index|
        percentage = braket[1].to_f / 100

        if index == 0
            pay = [income, braket[0]].min * percentage
            pay_iteration << pay
        else
            min = [income, braket[0]].min - brackets[index-1][0]
            pay = min * percentage
            pay_iteration << pay unless pay.negative?
        end
    end

    return pay_iteration.inject(:+)
end
