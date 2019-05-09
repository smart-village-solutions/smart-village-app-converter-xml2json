class PoiRecord < Record

  def convert_xml_to_hash
    # TODO: hier passiert dann die Magie der Umwandlung
    xml = Nokogiri.XML(xml_data)
    xml.remove_namespaces!
    xml.xpath("//poi").count
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
