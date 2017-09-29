# Simple trivia reader/picker
#
# based on Gingerspyce Trivia @ Sarlona
# by Osake (Joshua French)
require 'csv'

class Trivia

  attr_accessor :items

  def initialize(trivia_file)
    @items = []
    CSV.foreach(trivia_file) do |row|
      @items << { id: row[0], question: row[1], answer: row[2] }
    end
  end

  # Pass the question ID to retrieve a question hash.
  def get_question(id)
    # Assumes users are 1-based thinking.
    @items[id-1]
  end

  def random_question
    @items[rand(@items.size)]
  end
end

def pk
  p "Press any key..."
  gets
end

# Main
t = Trivia.new("input.txt")

#a = t.get_question 1
#p "Question #1"
#p a[:question]
#pk
#p "Answer"
#p a[:answer]

#pk

b = t.random_question
p "Random Question (#{b[:id]})"
p b[:question]
pk
p b[:answer]
pk


