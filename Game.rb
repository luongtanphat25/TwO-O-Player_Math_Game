class Game
  def initialize
    @player1 = 3
    @player2 = 3
  end

  def generate_question
    num1 = rand(1..20)
    num2 = rand(1..20)
    [num1, num2]
  end

  def is_correct(num1, num2, answer)
    answer.to_i == num1 + num2
  end

  def print_scores
    puts "P1: #{@player1}/3 vs P2: #{@player2}/3"
  end

  def start(player)
    num1, num2 = generate_question

    puts "#{player}: What does #{num1} plus #{num2} equal?"
    answer = gets.chomp

    if is_correct(num1, num2, answer)
      puts "#{player}: YES! You are correct."
    else
      if player == "Player 1"
        @player1 -= 1
      else
        @player2 -= 1
      end
      puts "#{player}: Seriously? No!"
    end

    print_scores
  end

  def done
    puts "\n-------- GAME OVER --------"
    if @player1 == 0
      puts "Player 2 wins with a score of #{@player2}/3"
    else
      puts "Player 1 wins with a score of #{@player1}/3"
    end

    
    puts "Good bye!"
  end

  def play
    while @player1 > 0 && @player2 > 0
      start("Player 1")
      break if @player1 == 0
      puts "\n-------- NEW TURN --------"

      start("Player 2")
      break if @player2 == 0
      puts "\n-------- NEW TURN --------"
    end
    done
  end
end

