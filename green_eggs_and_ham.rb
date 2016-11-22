class GreenEggsAndHam
  def initialize
    @text = File.read('green_eggs_and_ham.txt')
    @words = @text.split(/[ .!?,\n]/).reject { |word| word.empty? }
  end

  def word_count
    @words.count
  end

  def sorted_unique_words
    @words.map(&:downcase).uniq.sort
  end

  def number_of_words_shorter_than(number)
    @words.count { |word| word.length < number}
  end

  def longest_word
    @words.max_by(&:length)
  end

  def stanzas
    blank_lines = @text.split(/[\n]/).reject { |word| word.length > 0}
    stanza = blank_lines.push ""
  end

  # I am having issues with making this match up properly with the test file.  The number of text lines is defined in the middle of this method (19).  However, since the test file has its' own "count" operation, I have to provide an array for it to count.  I attempt to make a new array with elements equivalent to the number of lines (19) by adding 19 \n elements to this array.
  def lines
    line = []
    blank_lines = @text.split(/[\n]/).reject { |word| word.length > 0}
    text_lines = @text.lines.count - blank_lines.count
    text_lines.times {line << "\n"}
  end

  # Found this online.  I don't understand it enough to justify using it.  .. Come back to.
  # def frequency_of_unique_words
  #   low_list = @words.map(&:downcase)
  #   counts = Hash.new(0)
  #   frequency = list_low.inject(Hash.new(0)) { |total, e| total[e] += 1 ;total}
  # end
end
