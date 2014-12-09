# Obect Model

# Peter Cooper's Object Model lesson (very similar to what I teach my students)
#   https://www.youtube.com/watch?v=by5fFOBhtPQ
# My Object Model material
#   https://github.com/JoshCheek/ruby-object-model

# The core of it:
#   Classes
#     store methods              \ behaving as classes
#     have a superclass pointer  /
#     instance variables         \ behaving as instances
#     have a class pointer       /
#
#   Instances
#     store instance variables
#     have a class pointer
#
#   Method lookup
#     method_bag = object.class
#     until method_bag.has_instance_method? :method_name
#       method_bag = method_bag.superclass
#     end
#
#   Singleton Classes:
#     A class injected into an objects inheritance hierarchy so that we can add methods to just that one object
#     A normal class, but made on demand for a given object
#     (obj) ---class-pointer---> (singleton_class) ---superclass-pointer---> (OriginalClass)
#
#   Modules
#     A collection of methods (also has object properties)
#     When we include it, we make a new class (T_ICLASS) and point that class's methods at the module's methods



# the new method is not special, it's basically this:
class Class
  def _new(*args, &block)
    instance = self.allocate()
    instance.send(:initialize, *args, &block)
    instance
  end                                          # => :_new
end


# Inheritance sets the superclass pointer
# so if we don't find a method in Cup, we'll look in Vessel
class Vessel
end

class Cup < Vessel
  # While instance variables are unique to the instance,
  # methods are stored on the class, so this code is bound to each instance and run against it
  def initialize(color)
    self                 # => #<Cup:0x007f9cdc8356c8>, #<Cup:0x007f9cdc835150>, #<Cup:0x007f9cdc83ac18>, #<Cup:0x007f9cdc83a4c0>, #<Cup:0x007f9cdc8397a0>
    @color = color       # => :red, :brown, :found_white, :found2_blue, :brown
  end                    # => :initialize
end

# Two objects, each with their own data stored in instance variables
cup1 = Cup.new :red    # => #<Cup:0x007f9cdc8356c8 @color=:red>
cup2 = Cup.new :brown  # => #<Cup:0x007f9cdc835150 @color=:brown>


# What if we add a method to the class after we've created the instance?
# it goes and looks up the method when we invoke it, so it only matters
# that it's there when we call it
class Cup
  def size
    :large  # => :large
  end       # => :size
end
cup1.size   # => :large


# Singleton Classes:
# What happens when we define a method on one specific object?
a = "abc"   # => "abc"
def a.to_i
  self      # => "abc"
  123       # => 123
end         # => :to_i

# We can the new method, and the old ones
a.to_i     # => 123
a.reverse  # => "cba"

# Where is the to_i method?! It's on the singleton class
a.method(:to_i)  # => #<Method: "abc".to_i>
 .owner          # => #<Class:#<String:0x007f9cdc834778>>

a.singleton_class          # => #<Class:#<String:0x007f9cdc834778>>
 .instance_methods(false)  # => [:to_i]

# And the other methods can be called because the superclass is String (method lookup will go here second)
a.singleton_class  # => #<Class:#<String:0x007f9cdc834778>>
 .superclass       # => String


# The common example of singleton methods are called "Class methods"
class Cup
  self                          # => Cup
  def self.find(color)
    Cup.new(:"found_#{color}")  # => #<Cup:0x007f9cdc83ac18 @color=:found_white>
  end                           # => :find

  # another way to open the singleton class is with this strange syntax
  class << self
    def find2(color)
      Cup.new(:"found2_#{color}")  # => #<Cup:0x007f9cdc83a4c0 @color=:found2_blue>
    end                            # => :find2
  end
end

Cup.find  :white  # => #<Cup:0x007f9cdc83ac18 @color=:found_white>
Cup.find2 :blue   # => #<Cup:0x007f9cdc83a4c0 @color=:found2_blue>




# Modules - we can't see the class from Rubyland, but a class gets placed in
# Cup and Pitcher's inheritance hierarchies, each of which point at Pour's instance methods instead of having their own

module Pour
  def pour
    "Pouring out #{inspect}"  # => "Pouring out #<Cup:0x007f9cdc8397a0 @color=:brown>", "Pouring out #<Pitcher:0x007f9cdc8390c0>", "Pouring out \"abc\""
  end                         # => :pour
end

class Cup
  include Pour  # => Cup
end

class Pitcher
  include Pour  # => Pitcher
end

Cup.new(:brown).pour  # => "Pouring out #<Cup:0x007f9cdc8397a0 @color=:brown>"
Pitcher.new.pour      # => "Pouring out #<Pitcher:0x007f9cdc8390c0>"


# Extend - This just means you include into the Singleton class (gives those methods to one object)
a = "abc"      # => "abc"
a.extend Pour  # => "abc"
a.pour         # => "Pouring out \"abc\""

# we can see it will look in Pour for methods before going to String
a.singleton_class.ancestors  # => [#<Class:#<String:0x007f9cdc838d28>>, Pour, String, Comparable, Object, Kernel, BasicObject]
