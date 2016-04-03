require 'minitest/autorun'
require 'omniauth'
require 'omniauth-pushbullet'
require 'webmock/minitest'

WebMock.disable_net_connect!

class PushbulletTest < Minitest::Test
  def setup
    @strategy   = OmniAuth::Strategies::Pushbullet.new({})
    @fake_token = OpenStruct.new(:token => 'o.abc123456789012')

    api_fixture = File.expand_path('../../../fixtures/user_info.txt', __FILE__)

    stub_request(:get, 'https://api.pushbullet.com/v2/users/me').to_return(File.new(api_fixture))
  end

  def test_correct_name
    assert_equal 'pushbullet', @strategy.options.name
  end

  def test_correct_client_options
    options = @strategy.options.client_options

    assert_equal 'https://api.pushbullet.com',              options.site
    assert_equal 'https://www.pushbullet.com/authorize',    options.authorize_url
    assert_equal 'https://api.pushbullet.com/oauth2/token', options.token_url
  end

  def test_correct_uid
    @strategy.stub :access_token, @fake_token do
      assert_equal 'udyJj', @strategy.uid
    end
  end

  def test_correct_info
    @strategy.stub :access_token, @fake_token do
      assert_equal 'John Doe',                      @strategy.info[:name]
      assert_equal 'test@example.com',              @strategy.info[:email]
      assert_equal 'https://example.com/photo.jpg', @strategy.info[:image]
    end
  end

  def test_correct_extra
    @strategy.stub :access_token, @fake_token do
      assert @strategy.extra['active'], 'Expected "active" to be true'

      assert_equal 1384362056.742133,  @strategy.extra['created']
      assert_equal 1446605602.479297,  @strategy.extra['modified']
      assert_equal 'test@example.com', @strategy.extra['email_normalized']
      assert_equal 26214400,           @strategy.extra['max_upload_size']
    end
  end
end
