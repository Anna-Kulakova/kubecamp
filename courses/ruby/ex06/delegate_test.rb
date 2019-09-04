require "minitest/autorun"
require "minitest/pride"
require_relative "my_delegate.rb"

class Memory
  def initialize
    @data = []
  end

  def write
    puts "write"
  end

  def read
    puts "read"
  end

  def close
    puts "close"
  end
end

class MyDelegateTest < Minitest::Test
  Module.prepend MyModule
  def test_simple
    klass = Class.new do
      def initialize(m)
        @memory = m
      end
      my_delegate :write, :read, :close, to: :@memory
    end

    inst = klass.new(Memory.new)
    puts "------------"
    inst.write
    inst.read
    inst.close
    puts "------------"
  end
end
