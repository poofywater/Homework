class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize()
    @seq = []
    @game_over = false
    @sequence_lenght = 1
  end

  def play
    unless @game_over == true
      take_turn
    end

    game_over_message
    reset_game

  end

  def take_turn 
    show_sequence
    require_sequence
    if @game_over == false
      round_success_message
      @sequence_lenght += 1
    end
  end

  def show_sequence
    add_random_color
    @seq.each do |color|
      puts color 
    end
  end

  def require_sequence
    @seq.each do |color|
      response = gets.chomp
      if color != response
        @game_over = true
        break
      end
    end
  end

  def add_random_color
    @sequence << COLORS.sample

  end

  def round_success_message
    puts "round finished. gj"
  end

  def game_over_message
    puts "Millions of years of natural selection, just to end up with you losing a game."
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end


