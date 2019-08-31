require "pry"

class Owner
  attr_accessor :cat, :dog
  attr_reader :name, :species

  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    @pets = {:cats => [], :dogs => []}
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
    @pets[:cats] << Cat.new(cat, self)
  end

  def buy_dog(dog)
    @pets[:dogs] << Dog.new(dog, self)
  end

  def walk_dogs
    @pets[:dogs].map {|dog| dog.mood = "happy"}
  end

  def feed_cats
    @pets[:cats].map do |cat|
      cat.mood = 'happy'
    end
  end

  def sell_pets
    @pets.each do |species, instances|
      instances.each do |pet|
        pet.mood = "nervous"
      end
      instances.clear
    end
  end
  




end
