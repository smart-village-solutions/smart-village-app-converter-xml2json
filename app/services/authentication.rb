class Authentication
  attr_accessor :setting, :server_name, :server_options

  def initialize(server_name, server_options)
    @setting = Setting.new
    @server_options = server_options
    @server_name = server_name
  end

  def load_access_tokens
    auth_server = @server_options[:auth_server]
    uri = Addressable::URI.parse("#{auth_server[:url]}/oauth/token")
    uri.query_values = {
      client_id: auth_server[:key],
      client_secret: auth_server[:secret],
      redirect_uri: auth_server[:callback_url],
      grant_type: "client_credentials"
    }

    result = ApiRequestService.new(uri.to_s, nil, nil, uri.query_values).post_request

    if result.code == "200" && result.body.present?
      data = JSON.parse(result.body)
      save_tokens(data)
    else
      p result.body
    end
  end

  def save_tokens(token_hash)
    setting.config[@server_name] = {} if setting.config[@server_name].blank?
    setting.config[@server_name]["oauth"] = {} if setting.config[@server_name]["oauth"].blank?
    setting.config[@server_name]["oauth"]["access_token"] = token_hash.fetch("access_token", "")
    setting.config[@server_name]["oauth"]["expires_in"] = token_hash.fetch("expires_in", "")
    setting.config[@server_name]["oauth"]["created_at"] = token_hash.fetch("created_at", "")
    setting.save
  end

  def access_token
    load_access_tokens
    setting.config[@server_name]["oauth"]["access_token"]
  end
end
