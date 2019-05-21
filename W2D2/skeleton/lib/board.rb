class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) {[]}
    place_stones
  end

  def place_stones
   (0..5).each do |i|
      4.times {@cups[i] << :stone }
    end

    (7..12).each do |i|
      4.times {@cups[i] << :stone }
    end
  end

  def valid_move?(start_pos)
    raise RuntimeError.new "Invalid starting cup" if start_pos < 0 || start_pos > 12
    if @cups[start_pos].empty?
      raise RuntimeError.new "Starting cup is empty"
    end
  end

  def make_move(start_pos, current_player_name)
    @cups[start_pos] = []
    start = (start_pos + 1) % 14
    end_pos = (start_pos + 4) % 14
    (start..end_pos).each do |i|
      @cups[i] << :stone
    end
    #render
    next_turn(end_pos)
    if @cups[end_pos].length == 1
      return :switch
    end
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    ((0..5).all? { |i| @cups[i].empty? } || (7..12).all? { |i| @cups[i].empty? })
  end

  def winner
  end
end
