class Map

  def initialize 
    @map = []
  end

  def set(key, value)
    pair_index = @map.index { |pair| pair[0] == key }
    pair_index ? @map[pair_index][1] = value : @map << [key, value] 
  end

  def get(key)
    @map.each do |pair|
      return pair[1] if pair[0] == key
    end
    nil
  end

  def delete(key)
    value = get(key)
    @map.reject! { |pair| pair[0] == key }
    value
  end

  def show
    @map
  end

end