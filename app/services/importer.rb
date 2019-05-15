class Importer
  attr_accessor :access_token, :record_type

  # Steps for Importer
  # - Load Login Credentials from server
  # - Load xml Data from tmb-url
  # - Parse XML Data to Hash
  # - send JSON Data to server
  # - save response from server an log it
  # - send notifications
  def initialize(record_type: :poi)
    @current_user = login_on_auth_server
    if @current_user.present?
      @record_type = record_type
      @record = new_record
      @record.load_xml_data
      @record.convert_xml_to_hash
      send_json_to_server
    end
  end

  def login_on_auth_server
    auth_server = Rails.application.credentials.auth_server[:url]
    app_id = Rails.application.credentials.auth_server[:key]
    app_secret = Rails.application.credentials.auth_server[:secret]
    callback_url = Rails.application.credentials.auth_server[:callback_url]
    url = "#{auth_server}/oauth/access_token?client_id=#{app_id}&client_secret=#{app_secret}&redirect_uri=#{callback_url}"
    result = ApiRequestService.new(url).get_request

    if result.code == "200" && result.body.present?
      data = JSON.parse(result.body)
      return data
    end
  rescue
    nil
  end

  def new_record
    case @record_type
    when :poi
      PoiRecord.new(current_user: @current_user)
    when :tour
      TourRecord.new(current_user: @current_user)
    when :event
      EventRecord.new(current_user: @current_user)
    end
  end

  def send_json_to_server
    access_token = @current_user.fetch("access_token", "")
    base_url = Rails.application.credentials.target_server[:url]
    url = "#{base_url}?auth_token=#{access_token}"

    begin
      result = ApiRequestService.new(url, nil, nil, @record.json_data).post_request
      @record.update(updated_at: Time.now, audit_comment: result.body)
    rescue => e
      @record.update(updated_at: Time.now, audit_comment: e)
    end
  end

end
