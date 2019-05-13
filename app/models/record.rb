class Record < ApplicationRecord
  audited only: :updated_at

  def load_xml_data
    raise "Abstract Method"
  end

  def convert_to_json(hash_data)
    hash_data.to_json
  end

  def convert_xml_to_hash
    raise "Abstract Method"
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
