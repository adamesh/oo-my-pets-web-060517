require 'pry'

class Owner

  attr_accessor :name, :pets
  attr_reader :species

  @@all = []
  @@count = 0

  def initialize(species)
    @species = species
    @@all << self
    @@count += 1

    @pets = {:fishes => [], :dogs => [], :cats => []}
  end

  def self.all
    @@all
  end

  def self.reset_all
    @@all.clear
    @@count = 0
  end

  def self.count
    @@count
  end


  def say_species
    "I am a #{self.species}."
  end

  def buy_fish(name)
    @pets[:fishes] << Fish.new(name)
  end

  def buy_cat(name)
    @pets[:cats] << Cat.new(name)
  end

  def buy_dog(name)
    self.pets[:dogs] << Dog.new(name)
  end

  def walk_dogs
    self.pets[:dogs].each{ |dog| dog.mood = 'happy'}
  end

  def play_with_cats
    self.pets[:cats].each{ |cat| cat.mood = 'happy'}
  end

  def feed_fish
    self.pets[:fishes].each{ |fish| fish.mood = 'happy'}
  end

  def sell_pets
    pets.each do |type, pets|
      pets.each do |pet|
        pet.mood = 'nervous'
      end
      pets.clear
    end
  end

  def list_pets
    "I have #{pets[:fishes].count} fish, #{pets[:dogs].count} dog(s), and #{pets[:cats].count} cat(s)."
  end

end
