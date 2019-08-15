class Importer
  attr_accessor :access_token, :record_type

  # Steps for Importer
  # - Load Login Credentials from server
  # - Load xml Data from tmb-url
  # - Parse XML Data to Hash
  # - send JSON Data to server
  # - save response from server an log it
  # - send notifications
  def initialize(record_type)
    @record_type = record_type
    @record = new_record
    @record.load_xml_data
    @record.convert_xml_to_hash
    send_json_to_server
  end

  def new_record
    case @record_type
    when :poi
      PoiRecord.new
    when :event
      EventRecord.new
    end
  end

  def send_json_to_server
    access_token = Authentication.new.access_token
    url = Rails.application.credentials.target_server[:url]

    begin
      result = ApiRequestService.new(url, nil, nil, @record.json_data, { Authorization: "Bearer #{access_token}" }).post_request
      @record.update(updated_at: Time.now, audit_comment: result.body)
    rescue => e
      @record.update(updated_at: Time.now, audit_comment: e)
    end
  end
end
