require "pry"

class Owner
  attr_accessor :cat, :dog
  attr_reader :name, :species

  @@all = []
  @@pets = {:cats => [], :dogs => []}

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end

  def say_species
    "I am a #{@species}."
  end

  def self.all
    @@all
  end

  def self.count
    @@all.count
  end

  def self.reset_all
    @@all.clear
  end

  def cats
    Cat.all.select{|cat| cat.owner == self}
  end

  def dogs
    Dog.all.select{|dog| dog.owner == self}
  end

  def buy_cat(cat)
    @@pets[:cats] << Cat.new(cat, self)
  end

  def buy_dog(dog)
    @@pets[:dogs] << Dog.new(dog, self)
  end

  def walk_dogs
    @@pets[:dogs].each {|dog_obj| dog_obj.mood = "happy"}
    binding.pry
  end

  def feed_cats
    @@pets[:cats].each do |cat_obj|
      cat_obj.mood = 'happy'
    end
  end

  def sell_pets
    @@pets.each do |species, instances|
      instances.each do |pet|
        pet.mood = "nervous"
      end
      instances.clear
    end
  end





end
