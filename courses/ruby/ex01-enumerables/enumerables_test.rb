require 'minitest/autorun'
require 'minitest/pride'

class EnumerablesTest < Minitest::Test
  def test_squares_each
    numbers = [1, 2, 3, 4, 5]
    actual = []
    numbers.each do |number|
      actual << number ** 2
    end
    assert_equal [1, 4, 9, 16, 25], actual
  end

  def test_squares
    numbers = [1, 2, 3, 4, 5]
    actual = numbers.map do |number|
      number ** 2
    end
    assert_equal [1, 4, 9, 16, 25], actual
  end

  def test_find_waldo_each
    words = ["noise", "dog", "fair", "house", "waldo", "bucket", "fish"]
    actual = nil
    words.each do |word| 
      actual = word if word == "waldo"
    end
    assert_equal "waldo", actual
  end

  def test_find_waldo
    words = ["noise", "dog", "fair", "house", "waldo", "bucket", "fish"]
    actual = words.find do |word|
      word == "waldo"
    end
    assert_equal "waldo", actual
  end

  def test_pick_words_with_three_letters_each
    words = ["pill", "bad", "finger", "cat", "blue", "dog", "table", "red"]
    actual = []
    words.each { |word| 
      if word.length == 3
        actual << word
      end
    }
    assert_equal ["bad", "cat", "dog", "red"], actual
  end

  def test_pick_words_with_three_letters
    words = ["pill", "bad", "finger", "cat", "blue", "dog", "table", "red"]
    actual = words.select { |word| word.length == 3}
    assert_equal ["bad", "cat", "dog", "red"], actual
  end

  def test_normalize_zip_codes_each
    numbers = [234, 10, 9119, 38881]
    actual = []
    numbers.each { |num|
    num = num.to_s
    l = num.length
    tmp = ""
    until l == 5
      tmp << "0"
      l += 1
    end
    actual << tmp + num
    }
    assert_equal ["00234", "00010", "09119", "38881"], actual
  end

  def test_normalize_zip_codes
    numbers = [234, 10, 9119, 38881]
    actual = numbers.map { |num|
    num = num.to_s
    num.rjust(5, '0')
    }
    assert_equal ["00234", "00010", "09119", "38881"], actual
  end

  def test_no_waldo_each
    words = ["scarf", "sandcastle", "flag", "pretzel", "crow", "key"]
    found = nil
    words.each { |word| found = 1 if word == "waldo" }
    assert_nil found
  end

  def test_no_waldo
    words = ["scarf", "sandcastle", "flag", "pretzel", "crow", "key"]
    if words.any? { |x| "waldo" } == false
      found = nil
    end
    assert_nil found
  end

  def test_pick_floats_each
    numbers = [3, 1.4, 3.5, 2, 4.9, 9.1, 8.0]
    actual = []
    numbers.each { |n|
    actual << n  if n.is_a?(Float)
    }
    assert_equal [1.4, 3.5, 4.9, 9.1, 8.0], actual
  end

  def test_pick_floats
    numbers = [3, 1.4, 3.5, 2, 4.9, 9.1, 8.0]
    actual = numbers.select { |n| n.is_a?(Float) }
    assert_equal [1.4, 3.5, 4.9, 9.1, 8.0], actual
  end

  def test_words_with_no_vowels_each
    words = ["green", "sheep", "travel", "least", "boat"]
    actual = []
    words.each {|word| 
      word.gsub!(/[aeiou]/, '') 
      actual<<word
    }
    assert_equal ["grn", "shp", "trvl", "lst", "bt"], actual
  end

  def test_words_with_no_vowels
    words = ["green", "sheep", "travel", "least", "boat"]
    actual = words.collect { |word| 
      word.gsub!(/[aeiou]/, '')
    }
    assert_equal ["grn", "shp", "trvl", "lst", "bt"], actual
  end

  def test_has_at_least_one_zero_each
    numbers = [2, 0, 9, 3, 0, 1]
    actual = false
    numbers.each { |n| actual = true  if n == 0 }
    assert_equal true, actual
  end

  def test_has_at_least_one_zero
    numbers = [2, 0, 9, 3, 0, 1]
    actual = numbers.any? { |n| n == 0 }
    assert_equal true, actual
  end

  def test_all_gone_each
    words = ["gone", "gone", "gone", "gone", "gone", "gone", "gone"]
    actual = false
    words.each { |word| actual = true if word == "gone" }
    assert_equal true, actual
  end

  def test_all_gone
    words = ["gone", "gone", "gone", "gone", "gone", "gone", "gone"]
    actual = words.all?{ |word| word == "gone" }
    assert_equal true, actual
  end

  def test_count_numbers_greater_than_17_each
    numbers = [9, 18, 12, 17, 1, 3, 99]
    actual = 0
    numbers.each { |n| actual += 1 if n > 17 }
    assert_equal 2, actual
  end

  def test_count_numbers_greater_than_17
    numbers = [9, 18, 12, 17, 1, 3, 99]
    actual = numbers.count { |n| n > 17}
    assert_equal 2, actual 
  end

  def test_array_with_the_most_items_each
    arrays = [[:a, :b, :c], [1, 2, 3, 4, 5], ["zoo", :things, :stuff]]
    actual=[]
    arrays.each { |arr| actual = arr if arr.length > actual.length }
    assert_equal [1, 2, 3, 4, 5], actual
  end

  def test_array_with_the_most_items
    arrays = [[:a, :b, :c], [1, 2, 3, 4, 5], ["zoo", :things, :stuff]]
    actual = arrays.max { |a, b| a.length <=> b.length } 
    assert_equal [1, 2, 3, 4, 5], actual
  end

  def test_group_words_by_first_letter_each
    words = ["ant", "axis", "albatross", "bolt", "badge", "butter", "car", "cdr", "column"]
    actual = {}
    words.each { |word|
      first = word[0]
      if actual[first] == nil
        actual[first] = []
      end
      actual[first] << word
    }
    expected = {"a"=>["ant", "axis", "albatross"], "b"=>["bolt", "badge", "butter"], "c"=>["car", "cdr", "column"]}
    assert_equal expected, actual
  end

  def test_group_words_by_first_letter
    words = ["ant", "axis", "albatross", "bolt", "badge", "butter", "car", "cdr", "column"]
    actual = words.group_by { |word| word[0] }
    expected = {"a"=>["ant", "axis", "albatross"], "b"=>["bolt", "badge", "butter"], "c"=>["car", "cdr", "column"]}
    assert_equal expected, actual
  end

  def test_none_are_negative_each
    numbers = [9, 3, 1, 8, 3, 3, 5]
    actual = true
    numbers.each { |n| actual = false if n < 0 }
    assert true, actual
  end

  def test_none_are_negative
    numbers = [9, 3, 1, 8, 3, 3, 5]
    actual = numbers.all? { |x| x > 0}
    assert true, actual
  end

  def test_sum_a_list_of_numbers_each
    numbers = [32, 1, 21, 5, 81, 333]
    actual = 0
    numbers.each { |n| actual += n }
      assert_equal 473, actual
  end

  def test_sum_a_list_of_numbers
    numbers = [32, 1, 21, 5, 81, 333]
    actual = 0
    actual = numbers.sum
      assert_equal 473, actual
  end

  def test_remove_numbers_divisible_by_3_each
    numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]
    actual=[]
    numbers.each { |n| actual << n if n % 3 != 0} 
    assert_equal [1, 2, 4, 5, 7, 8, 10, 11, 13, 14, 16, 17, 19, 20], actual
  end

  def test_remove_numbers_divisible_by_3
    numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]
    actual = numbers.select { |n| n % 3 != 0 }
    assert_equal [1, 2, 4, 5, 7, 8, 10, 11, 13, 14, 16, 17, 19, 20], actual
  end

  def test_speed_interview_pairs_each
    list1 = ["Alice", "Bob", "Charlie"]
    list2 = ["Xenia", "Yves", "Zach"]
    actual=[]
    list1.each_with_index { |name1, ind1|
      actual << [name1, list2[ind1]]
      }
    assert_equal [["Alice", "Xenia"], ["Bob", "Yves"], ["Charlie", "Zach"]], actual
  end

  def test_speed_interview_pairs
    list1 = ["Alice", "Bob", "Charlie"]
    list2 = ["Xenia", "Yves", "Zach"]
    actual = list1.zip(list2)
    assert_equal [["Alice", "Xenia"], ["Bob", "Yves"], ["Charlie", "Zach"]], actual
  end

  def test_has_a_multi_word_phrase_each
    phrases = ["Sure!", "OK.", "I have no idea.", "Really?Whatever."]
    actual = false
    phrases.each { |p| actual = true if p.split.length > 1 }
    assert_equal true, actual
  end

  def test_has_a_multi_word_phrase
    phrases = ["Sure!", "OK.", "I have no idea.", "Really?Whatever."]
    actual = phrases.any? { |p| p.split.length > 1 } 
    assert_equal true, actual
  end

  def test_count_words_that_are_uppercase_each
    words = ["trousers", "SOCKS", "sweater", "Cap", "SHOE", "TIE"]
    actual = 0
    words.each { |w| actual += 1 if w == w.upcase }
    assert_equal 3, actual
  end

  def test_count_words_that_are_uppercase
    words = ["trousers", "SOCKS", "sweater", "Cap", "SHOE", "TIE"]
    actual = words.count { |w| w == w.upcase }
    assert_equal 3, actual
  end

  def test_smallest_number_each
    numbers = [1, 10, 100, 1000, 10000, 1000000]
    actual = numbers[5]
    numbers.each { |n| actual = n if n < actual }
    assert_equal 1, actual
  end

  def test_smallest_number
    numbers = [1, 10, 100, 1000, 10000, 1000000]
    actual = numbers.min
    assert_equal 1, actual
  end

  def test_multiply_list_of_numbers_each
    numbers = [2, 3, 5, 7]
    actual = 1
    numbers.each { |n| actual *= n }
      assert_equal 210, actual
  end

  def test_multiply_list_of_numbers
    numbers = [2, 3, 5, 7]
    actual = 1
    actual = numbers.reduce(:*)
      assert_equal 210, actual
  end

  def test_solitaire_each
    list1 = ["Ace", "6", "10", "Queen"]
    list2 = [:clubs, :diamonds, :hearts, :spades]
    actual = []
    list1.each_with_index { |name1, ind1|
         actual << [name1, list2[ind1]]
    }
      assert_equal [["Ace", :clubs], ["6", :diamonds], ["10", :hearts], ["Queen", :spades]], actual
  end

  def test_solitaire
    list1 = ["Ace", "6", "10", "Queen"]
    list2 = [:clubs, :diamonds, :hearts, :spades]
    actual = list1.zip(list2)
      assert_equal [["Ace", :clubs], ["6", :diamonds], ["10", :hearts], ["Queen", :spades]], actual
  end

  def test_all_multiples_of_7_each
    numbers = [42, 14, 35, 49, 28, 56, 21, 7]
    actual = true
    numbers.each { |n| actual = false if n % 7 != 0 }
      assert actual
  end

  def test_all_multiples_of_7
    numbers = [42, 14, 35, 49, 28, 56, 21, 7]
    actual = numbers.all? { |n| n % 7 == 0 }
      assert actual
  end

  def test_sort_by_number_of_cents_each
    prices = [3.02, 9.91, 7.9, 10.01, 11.0]
    actual = []
    f = {}
    prices.each { |price|
      fraction = price.to_s.split(".")
      num = fraction[1].to_i
      actual << num
      f[num] = price
    }
    actual = actual.sort
    actual = actual.map { |x| x = f[x]}
  
      assert_equal [11.0, 10.01, 3.02, 7.9, 9.91], actual
  end

  def test_sort_by_number_of_cents
    prices = [3.02, 9.91, 7.9, 10.01, 11.0]
    actual = prices.sort_by {|x|
      fraction = x.to_s.split(".")
         x = fraction[1].to_i
 }
      assert_equal [11.0, 10.01, 3.02, 7.9, 9.91], actual
  end
end
