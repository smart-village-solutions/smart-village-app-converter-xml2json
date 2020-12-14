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
    puts "Record type defined: #{@record_type}"

    @record = new_record
    puts "Record initialized"

    @record.load_xml_data
    puts "Data loaded from TMB"

    target_servers = Rails.application.credentials.target_servers
    target_servers.each do |name, options|
      puts "Converting Data for #{name}"
      data_to_send = @record.convert_xml_to_hash(name, options)
      send_json_to_server(name, options, data_to_send)
    end

    puts "Data send to all servers"
  end

  def new_record
    case @record_type
    when :poi
      PoiRecord.new
    when :event
      EventRecord.new
    end
  end

  def send_json_to_server(name, options, data_to_send)
    access_token = Authentication.new(name, options).access_token
    url = options[:target_server][:url]

    puts "Sending data to #{name}"
    begin
      result = ApiRequestService.new(url, nil, nil, data_to_send, { Authorization: "Bearer #{access_token}" }).post_request
      @record.update(updated_at: Time.now, audit_comment: result.body)
    rescue => e
      @record.update(updated_at: Time.now, audit_comment: e)
    end
  end
end
