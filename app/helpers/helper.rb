helpers do

  def generate_key
    digits = (0..9).to_a
    letters = ("a".."z").to_a
    key = []
    4.times do |x|
      key << digits.sample
      key << letters.sample
    end
    key.shuffle.join('')
  end

end