def reverser(&prc)
  arr = yield.split(" ")
  arr.each{|word| word.reverse!}
  arr.join(" ")
end


def adder(x=1, &prc)
  (yield + x)
end

def repeater(n=1, &prc)
  n.times() {prc.call}
end