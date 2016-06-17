def measure(n=1, &prc)
  runTimes = []
  
  n.times() do 
    start = Time.now
    yield
    finish = Time.now
    runTimes.push(finish - start)
  end
  
  return (runTimes.inject(:+) / runTimes.length)
end 