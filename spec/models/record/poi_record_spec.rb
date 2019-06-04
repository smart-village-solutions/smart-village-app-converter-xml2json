require 'rails_helper'

RSpec.describe PoiRecord, type: :model do
  describe "import" do
    let(:xml_raw_data) { File.read("doc/tmb.xml") }
    let(:poi_hash) { JSON.parse(File.read("doc/pois_tours.json")) }
    let(:poi) { PoiRecord.new }

    it "stores a xml in xml_data" do
      poi.xml_data = xml_raw_data

      expect(poi.xml_data).not_to be_empty
    end

    it "converts a hash to json" do
      hash_data = { foo: "bar" }

      expect(poi.convert_to_json(hash_data)).to eq("{\"foo\":\"bar\"}")
    end

    # ToDo Refactor according to cc rspec rules
    it "converts a xml to hash" do
      poi.xml_data = xml_raw_data
      result = poi.convert_xml_to_hash

      expect(result).to be_a(Hash)
      expect(result[:point_of_interests].present?).to eq(true)
      expect(result[:tours].present?).to eq(true)
      expect(result[:point_of_interests].count).to eq(195)
      expect(result[:tours].count).to eq(47)
    end
  end
end
