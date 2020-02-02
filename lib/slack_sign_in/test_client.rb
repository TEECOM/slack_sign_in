module SlackSignIn
  class TestClient
    def self.error_code
      nil
    end

    def self.identity_info
      {
        team_id: "team_id_123",
        user_id: "user_id_123",
        user: {
          name: "Example User",
          email: "example@email.com",
          image_48: "http://avatar.com",
        },
      }
    end

    def initialize(_, _, authorize_url:, token_url:, redirect_uri:)
      @redirect_uri = redirect_uri
    end

    def auth_code
      self
    end

    def authorize_url(scope:, state:)
      base_url = @redirect_uri + "?state=#{state}&"

      if (error = self.class.error_code)
        base_url + "&error=#{error}"
      else
        base_url + "&code=123"
      end
    end

    def get_token(_)
      self
    end

    def params
      self.class.identity_info
    end
  end
end
