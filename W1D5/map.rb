class Map

  def initialize 
    @map = []
  end

  def set(key, value)
    @map << [key, value] unless get(key)
  end

  def get(key)
    @map.each do |pair|
      return pair if pair[0] == key
    end
    nil
  end

  def delete(key)
    (0...@map.length).each do |idx|
      pair = @map[idx]
      @map = @map[0...idx] + @map[(idx + 1)..-1] if pair[0] == key
    end
    @map
  end

  def show
    @map
  end

end
