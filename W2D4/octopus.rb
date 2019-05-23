require "benchmark"

ARRAY = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish',
         'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']


  def sluggish_octopus(array)
    sorted = false

    while !sorted
      sorted = true

      (0...array.length - 1).each do |i|
        if (array[i].length <=> array[i + 1].length) == 1
          array[i], array[i + 1] = array[i + 1], array[i]
          sorted = false
        end
      end
    end
      array.last
  end

  def dominant_octopus(array)
    return array if array.length <= 1

    mid = array.length / 2

    left = array.take(mid)
    right = array.drop(mid)
    left_sorted = dominant_octopus(left)
    right_sorted = dominant_octopus(right)

    merge(left, right).last
  end

  def merge(left, right)
    merged = []
    until left.empty? || right.empty?
      case left.first.length <=> right.first.length
      when -1
        merged << left.shift
      else 
        merged << right.shift
      end
    end

    merged + left + right
  end

  def clever_octopus(array)
    longest = 0
    dinner = ""
    array.each do |fish|
      if fish.length > longest
        longest = fish.length
        dinner = fish
      end
    end

    dinner
  end



p sluggish_octopus(ARRAY)
p clever_octopus(ARRAY)
p dominant_octopus(ARRAY)

TILES_ARRAY = ["up", "right-up", "right", "right-down",
               "down", "left-down", "left",  "left-up" ]

TILES_HASH = {"up" => 0,
              "right-up" => 1,
              "right" => 2,
              "right-down" => 3,
              "down" => 4,
              "left-down" => 5,
              "left" => 6,
              "left-up" => 7
              }

def slow_dance(direction, array)
  array.each_with_index do |el, i|
    if el == direction
      return i
    end
  end
end


def constant_dance(direction, hash)
  TILES_HASH[direction]
end

p slow_dance("up", TILES_ARRAY)
p slow_dance("down", TILES_ARRAY)
p constant_dance("up", TILES_ARRAY)
p constant_dance("down", TILES_ARRAY)