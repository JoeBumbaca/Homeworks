class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    while !@game_over
      puts "Here comes the sequence!"
      sleep(2)
      self.take_turn
      @game_over ? self.game_over_message && self.reset_game 
      : self.round_success_message && sleep(2)
      @sequence_length += 1
    end
  end

  def take_turn
    self.show_sequence
    self.require_sequence
  end

  def show_sequence
    self.add_random_color
    (0...@sequence_length).each do |i|
      puts @seq[i]
      sleep(2)
      system("clear")
    end
  end

  def require_sequence
    puts "Simon says: Please enter the sequence shown! One color at a time"
    (0...@sequence_length).each do |i|
      user_input = gets.chomp
      unless user_input == @seq[i]
        @game_over = true
        return nil
      end
    end
    system("clear")
  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
    puts "Good job!"
    sleep(1)
    system("clear")
  end

  def game_over_message
    puts "Game Over!"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end
