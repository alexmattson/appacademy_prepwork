# MyHashSet
#
# Ruby provides a class named `Set`. A set is an unordered collection of
# values with no duplicates.  You can read all about it in the documentation:
#
# http://www.ruby-doc.org/stdlib-2.1.2/libdoc/set/rdoc/Set.html
#
# Let's write a class named `MyHashSet` that will implement some of the
# functionality of a set. Our `MyHashSet` class will utilize a Ruby hash to keep
# track of which elements are in the set.  Feel free to use any of the Ruby
# `Hash` methods within your `MyHashSet` methods.
#
# Write a `MyHashSet#initialize` method which sets an empty hash object to
# `@store`. Next, write an `#insert(el)` method that stores `el` as a key
# in `@store`, storing `true` as the value. Write an `#include?(el)`
# method that sees if `el` has previously been `insert`ed by checking the
# `@store`; return `true` or `false`.
#
# Next, write a `#delete(el)` method to remove an item from the set.
# Return `true` if the item had been in the set, else return `false`.  Add
# a method `#to_a` which returns an array of the items in the set.
#
# Next, write a method `set1#union(set2)` which returns a new set which
# includes all the elements in `set1` or `set2` (or both). Wri te a
# `set1#intersect(set2)` method that returns a new set which includes only
# those elements that are in both `set1` and `set2`.
#
# Write a `set1#minus(set2)` method which returns a new set which includes
# all the items of `set1` that aren't in `set2`.

class MyHashSet
  attr_accessor :store
  
  def initialize
    @store = {}
  end
  
  def insert(el)
    @store[el] = true
  end
  
  def include?(el)
    @store.include?(el)
  end
  
  def delete(el)
    if @store.include?(el) 
      @store.delete(el)
      return true
    else 
      return false
    end
  end
  
  def to_a
    @store.keys
  end
  
  def combined_keys_with(set2)
    self.to_a + set2.to_a
  end
  
  def union(set2)
    final = MyHashSet.new
    self.combined_keys_with(set2).each do |key|
      final.insert(key) unless final.include?(key)
    end
    final
  end
  
  def intersect(set2)
    final = MyHashSet.new
    self.combined_keys_with(set2).uniq.each do |item|
      final.insert(item) if self.combined_keys_with(set2).count(item) > 1
    end
    final
  end
  
  def minus(set2)
    self.intersect(set2).to_a.each{|el| self.delete(el)}
    self
  end
  
  def symmetric_difference(set2)
    final = MyHashSet.new
    self.combined_keys_with(set2).uniq.each do |item|
      final.insert(item) if self.combined_keys_with(set2).count(item) == 1
    end
    final
  end
  
  def ==(object)
    self.to_a.sort == object.to_a.sort
  end
  
end


# Bonus
#
# - Write a `set1#symmetric_difference(set2)` method; it should return the
#   elements contained in either `set1` or `set2`, but not both!
# - Write a `set1#==(object)` method. It should return true if `object` is
#   a `MyHashSet`, has the same size as `set1`, and every member of
#   `object` is a member of `set1`.
