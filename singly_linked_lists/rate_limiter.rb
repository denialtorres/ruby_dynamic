require 'pry'

class Logger
  def initialize
    @message_timestamps = {}
  end

  def should_print_message(timestamp, message)
    if @message_timestamps.key?(message) && (timestamp - @message_timestamps[message]) < 10
      return false
    else
      @message_timestamps.store(message, timestamp)
      return true
    end
  end
end

logger = Logger.new
puts logger.should_print_message(1, "foo")  # Prints true
puts logger.should_print_message(2, "bar")  # Prints true
puts logger.should_print_message(3, "foo")  # Prints false
puts logger.should_print_message(12, "bar") # Prints false
puts logger.should_print_message(14, "foo") # Prints true
