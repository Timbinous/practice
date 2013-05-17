class KarateChop

  def self.middle_number(ary)
    ary[ary.length/2]
  end

  def self.lower_half(ary)
    ary[0..(ary.length/2 - 1)]
  end

  def self.upper_half(ary)
    ary[(ary.length/2 + 1)..ary.length]
  end

  def self.narrow_down_position(num, ary)
    if middle_number(ary)
      if num < middle_number(ary)
        return 0 if num < ary.first
        [0, lower_half(ary)]
      elsif num == middle_number(ary)
        @found = true
        [ary.length/2, ary.length/2]
      elsif num > middle_number(ary)
        [ary.length/2 + 1, upper_half(ary)]
      end
    else
      0
    end
  end

  def self.chop(num, ary)
    @found = false
    total = 0
    while ary.is_a?(Array)
      tot, ary = narrow_down_position(num, ary)
      total += tot
    end
    total if @found
  end
end
