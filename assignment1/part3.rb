# Anagrams

def normalize(word)
  word.downcase.split('').sort
end

def combine_anagrams(words)
  anagrams = Hash.new { |h, k| h[k] = [] }
  words.each do |word|
    anagrams[normalize(word)] <<= word
  end
  anagrams.values
end
