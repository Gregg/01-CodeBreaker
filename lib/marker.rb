class Marker

  def initialize(secret)
    @secret = secret.split(" ")
    @non_positional_matches = 0
    @marker = []
  end
  
  def guess(these)
    @guess = these.split(" ")
  end
  
  def mark
    @guess.each_with_index do |g, i| 
      if @secret.include? g
        if @secret[i] == g
          @marker.push 'p'
        else
          @marker.push 'm'
        end
      end
    end
    @marker
  end

end
