a = Category.create(title: "Manticores")
b = Category.create(title: "Unicorns")
c = Category.create(title: "Dragons")
d = Category.create(title: "Satyrs")
e = Category.create(title: "Harpies")

category_array = [a, b, c, d, e]

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

100.times do |x|
  Post.create(:title => "Post#{x}", :content => "Some content", :key => generate_key, category_id: category_array.sample.id)
end