require 'pry'

class ZooAtCapacity < StandardError
end

class Zoo
  attr_reader :name, :season_opening_date, :season_closing_date, :cages, :employees

  def initialize(name, season_opening_date, season_closing_date)
    @name = name
    @season_opening_date = season_opening_date
    @season_closing_date = season_closing_date
    @employees = []
    @cages = []
    10.times do
      @cages << Cage.new
    end
  end

  def add_employee(person)
    @employees << person
  end

  def open?(date)
    date.between?(season_opening_date, season_closing_date)
  end

  def add_animal(animal)
    @cages.each do |cage|
      if cage.empty?
        cage.animal = animal
        return
      end
    end
    raise ZooAtCapacity
  end

  def visit
    greeting = ""
    @employees.each do |employee|
      greeting += "#{employee.greet}\n"
    end
    @cages.each do |cage|
      if !cage.empty?
        greeting += "#{cage.animal.speak}\n"
      end
    end
    greeting
  end
end
