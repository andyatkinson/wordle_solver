require 'set'

class WordleSolver
  attr_reader :raw_words
  attr_accessor :word_scores

  def initialize
    @raw_words = Set.new
    @word_scores = []
    load_raw_words
    add_seed_words
    score_words
    filtered = filter_scored_words(min_score = 8)

    # Print one suggestion for the first word
    puts filtered.sample.keys.first
  end

  private

  # https://twitter.com/getajobmike/status/1480941881445945345
  def seed_words
    %w(
    TREAD LOUSE TRAIN ARTSY PHONE TEARS LEARN GRAPH
    CABLE ADIEU SPEAR RATES COLIN MEANS DRINK BEAUT
    RAISE
    ).map(&:downcase)
  end

  def one_point_consonants
    @one_point_consonants ||= %w(r s t l n e)
  end

  def one_point_vowels
    @one_point_vowels ||= %w(a e i o i)
  end

  def one_point_all_distinct?(word)
    word.chars.length == word.chars.uniq.length
  end

  def one_point_gte_three_vowels?(word)
    count = 0
    word.chars.uniq.each do |char|
      if one_point_vowels.include?(char)
        count += 1
      end
    end

    count >= 3
  end

  # running on Mac OS 12
  def load_raw_words(word_length = 5)
    @raw_words = File.read("/usr/share/dict/words").
      split.grep(/^.{#{word_length}}$/)
  end

  def add_seed_words
    @raw_words + seed_words
  end

  def score_word(word)
    score = 0

    # scoop - 2
    # shoes - shoe, score: 3
    # stripe - stripe, score: 5
    #
    # use unique chars
    word.chars.uniq.each do |char|
      if one_point_consonants.include?(char)
        score += 1
      end

      if one_point_vowels.include?(char)
        score += 1
      end
    end

    if one_point_all_distinct?(word)
      score += 1
    end

    if one_point_gte_three_vowels?(word)
      score += 1
    end

    hash = Hash.new(0)
    hash[word] = score

    hash
  end

  def score_words
    raw_words.each do |word|
      word_scores << score_word(word)
    end
  end

  def filter_scored_words(min_score)
    word_scores.select{ |h| h.values.first >= min_score }
  end
end

WordleSolver.new
