require 'Minitest/autorun'
require 'Minitest/pride'
require './lib/key_gen'
require 'pry'

class KeyGenTest < Minitest::Test
  def setup
    @key = KeyGenerator.new
  end

  def test_key_generator_exists
    assert_equal KeyGenerator, @key.class
  end

  def test_generate_key
    assert true, @key.generate
  end

  def test_keys_are_different
    refute_equal @key.generate, @key.generate
  end

  def test_key_is_valid_code
    assert @key.codewords.include?(@key.generate)
  end

  def test_only_generate_one_key
    assert_equal 4, @key.generate.length
  end

end
