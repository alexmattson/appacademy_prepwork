def add(x, y)
    return x + y
end 

def subtract(x, y)
    return x - y
end

def sum(arr)    
    return arr.inject(0){|sum, x| sum += x}
end

def multiply(*nums)
    return nums.inject(1){|product, x| product = product * x}
end

def power(x, y)
    return x ** y 
end

def factorial(num)
    return 0 if num == 0 
    product = 1
    (1..num).each{|x| product = product * x}
    return product
end