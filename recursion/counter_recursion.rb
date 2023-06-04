# timer counter using recursion

def timer(timer_limit)
  return if timer_limit < 0
   puts (timer_limit)
   sleep 1
   timer(timer_limit-1)
end

timer(5)
