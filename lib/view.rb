class View
  def display_list(recipes)
    # 1. brownie
    recipes.each_with_index do |recipe, index|
      puts "#{index + 1}. #{recipe.name} - #{recipe.description}"
    end
  end

  def ask_for(stuff)
    puts "What is the #{stuff}"
    print ">"
    gets.chomp
  end

  def ask_for_index
    puts "Which index do you want to delete?"

    gets.chomp.to_i
  end
end
