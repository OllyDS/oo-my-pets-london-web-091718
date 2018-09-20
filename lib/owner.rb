require 'pry'

class Owner

  attr_accessor :name, :count, :pets
  attr_reader :species

  @@owners = []
  @@count = 0

  def initialize(name)
    @name = name
    @species = "human"
    @pets = {cats: [], dogs: [], fishes: []}
    @@owners << self
    @@count += 1
  end

  def self.all
    @@owners
  end

  def self.reset_all
    @@count = 0
  end

  def self.count
    @@count
  end

  def say_species
    p "I am a #{@species}."
  end

  def buy_fish(pet_name)
    @pets[:fishes] << Fish.new(pet_name)
  end

  def buy_cat(pet_name)
    @pets[:cats] << Cat.new(pet_name)
  end

  def buy_dog(pet_name)
    @pets[:dogs] << Dog.new(pet_name)
  end

  def walk_dogs
    @pets[:dogs].each do |dog|
      dog.mood = "happy"
    end
  end

  def play_with_cats
    @pets[:cats].each {|cat| cat.mood = "happy"}
  end

    def feed_fish
      @pets[:fishes].each {|fish| fish.mood = "happy"}
    end

    def sell_pets
      @pets.each do |type, pets|
        pets.each {|pet_instance| pet_instance.mood = "nervous"}
      end
      pets.clear
    end

    def list_pets
      p "I have #{@pets[:fishes].count} fish, #{@pets[:dogs].count} dog(s), and #{@pets[:cats].count} cat(s)."
    end
end

# binding.pry
# p "eof"
