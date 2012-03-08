
def palindrome?(string)
  string = string.gsub(/\W/,'').downcase
  string == string.reverse
end

def count_words(string)
  counts = Hash.new(0)
  words = string.downcase.split(/\b/).reject {|w| w =~ /\W/}
  words.each do |w|
      counts[w] += 1
  end
  counts
end
