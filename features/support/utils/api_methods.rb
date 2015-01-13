module APIMethods
  require 'httpclient'
  require 'multi_json'
  require_relative 'utilities'

  class User
    include Utilities
    include UtilityObjects

    def initialize(auth, api)
      @auth_uri = "#{auth}/oauth2/token"
      @credit_card_uri = "#{api}/service/my/creditcards"
    end

    def create_new_user! (options ={})
      with_client = options[:with_client]
      @email_address = generate_random_email_address
      @password = 'test1234'
      @first_name = generate_random_first_name
      params = {
          grant_type: 'urn:blinkbox:oauth:grant-type:registration',
          first_name: @first_name,
          last_name: generate_random_last_name,
          username: @email_address,
          password: @password,
          accepted_terms_and_conditions: true,
          allow_marketing_communications: false
      }
      if with_client
        @device_name = 'Web Site Test Client'
        params.merge!({
                          client_name: @device_name,
                          client_brand: 'Tesco',
                          client_model: 'Hudl',
                          client_os: 'Android'})
      end
      headers = {'Content-Type' => 'application/x-www-form-urlencoded', 'Accept' => 'application/json'}

      ### initial try at some retry handling code.
      tries = 10
      begin
       response = http_client.post(@auth_uri, body: params, header: headers)
      rescue Exception => e
        puts "Connection broke, when trying to create user!"
        tries -= 1
        if tries > 0
          retry
        else
          abort 'Test Error: Failed to register new user'
        end
      end
      abort 'Test Error: Failed to register new user' unless response.status == 200
      user_props = MultiJson.load(response.body)
      @access_token = user_props['access_token']
      return @first_name, @email_address, @password, @device_name
    end

    def buy_a_book

    end

    def add_a_device

    end

    def http_client
      @http = HTTPClient.new
      @http.ssl_config.options |= OpenSSL::SSL::OP_NO_SSLv3
      @http.ssl_config.verify_mode = OpenSSL::SSL::VERIFY_NONE
      @http.ssl_config.ssl_version = :SSLv23#:TLSv1_1
      @http
    end

    def format_body(body)
      if body.is_a?(Hash)
        MultiJson.dump(body)
      else
        body
      end
    end
  end

  def api_helper
    current_env = ENV['environment']
    @api_helper||=APIMethods::User.new(test_conf_data['environments'][current_env]['auth_url'],
                                       test_conf_data['environments'][current_env]['api_url'])

  end
end

World(APIMethods)

