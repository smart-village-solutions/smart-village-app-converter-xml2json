class EventRecord < Record

  # Load event data from external source
  # and save it to local attribute 'xml_data'
  #
  # @return [XML] XML - Data
  def load_xml_data
    url = Rails.application.credentials.event_source[:url]
    pem = Rails.application.credentials.tmb_auth[:pem]
    result = ApiRequestService.new(url).get_request(false, pem)

    return unless result.code == "200"
    return unless result.body.present?

    self.xml_data = result.body
  end

end

# == Schema Information
#
# Table name: records
#
#  id          :bigint           not null, primary key
#  external_id :string
#  json_data   :jsonb
#  xml_data    :text
#  type        :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
