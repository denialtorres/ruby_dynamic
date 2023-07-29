# Design a time-based key-value data structure that can store multiple values for the same key at different time stamps and retrieve the key's value at a certain timestamp.
#
# Implement the TimeMap class:
#
# TimeMap() Initializes the object of the data structure.
# void set(String key, String value, int timestamp) Stores the key key with the value value at the given time timestamp.
# String get(String key, int timestamp) Returns a value such that set was called previously, with timestamp_prev <= timestamp.
# If there are multiple such values, it returns the value associated with the largest timestamp_prev. If there are no values, it returns "".

# approach using arrays
## https://leetcode.com/problems/time-based-key-value-store/
class TimeMap
    def initialize()
      @hash_collection = {}
    end

    def set(key, value, timestamp)
      if @hash_collection[key]
        @hash_collection[key] << [value, timestamp]
      else # exists
         @hash_collection[key] = [[value, timestamp]]
      end
    end

    def get(key, timestamp)
      return "" unless @hash_collection.key?(key)

      found_array = @hash_collection[key]

      if @hash_collection[key]

        result_array = []

        found_array.each do |array|
          result_array << array if array[1] <= timestamp
        end

        return "" if result_array.empty?

        return result_array.last[0]
      end
    end
end
#  obj = TimeMap.new
#  obj.set("foo", "bar", 1)
#  obj.get("foo", 1); //bar
#  obj.get("foo", 3); //barexit
#  obj.set("foo", "bar2", 4)
obj.get("foo", 4);
obj.get("foo", 5);

 obj = TimeMap.new
 obj.set("love", "high", 10)
 obj.set("love", "low", 20)
 obj.get("love", 5)
 obj.get("love", 10)
 obj.get("love", 15)
 obj.get("love", 20)
 obj.get("love", 25)
