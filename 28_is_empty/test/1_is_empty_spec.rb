require_relative 'spec_helper'

FUNCTION = 'is_empty'
ARITY = 1
PATH = File.join("lib",FUNCTION+".rb")
RELATIVE_PATH = File.join("..", PATH)

describe FUNCTION do
  
  def self.test_order
    :alpha
  end

  it 'exists' do
    assert File.exist?(PATH), "Du behöver skapa filen #{PATH}"
    require_relative RELATIVE_PATH
  end
  
  it "has a function named #{FUNCTION}" do
    assert (method_exists? FUNCTION.to_sym), "Du behöver definera funktionen #{FUNCTION} i lib/#{FUNCTION}.rb"
  end
  
  it "takes #{ARITY.humanize} argument#{ARITY > 1 ? "s" : ""}" do
    message = "Funktionen #{FUNCTION} måste ta #{ARITY} argument"
    assert_equal ARITY, method(FUNCTION.to_sym).arity, message
  end

  it 'returns false when the string is not empty' do
    send(FUNCTION, "BANAN").must_equal false
    send(FUNCTION, "banan").must_equal false
    send(FUNCTION, "   OooooOooooOoooo   ").must_equal false
  end

  it 'returns true if the string is empty' do
    send(FUNCTION, "").must_equal true
  end

end