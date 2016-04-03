require 'minitest/autorun'
require 'omniauth'
require 'omniauth-pushbullet'

class PushbulletTest < Minitest::Test
  def setup
    @strategy = OmniAuth::Strategies::Pushbullet.new({})
  end

  def test_correct_name
    assert_equal 'pushbullet', @strategy.options.name
  end
end
