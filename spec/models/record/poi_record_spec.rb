require 'rails_helper'

RSpec.describe PoiRecord, type: :model do
  describe "import" do
    let(:xml_raw_data) { File.read("doc/tmb.xml") }
    let(:poi) { PoiRecord.new }
    let(:poi_hash) { JSON.parse(File.read("doc/poi.json")) }

    it "stores a xml in xml_data" do
      poi.xml_data = xml_raw_data

      expect(poi.xml_data).not_to be_empty
    end

    it "converts an hash to json" do
      hash_data = { foo: "bar" }

      expect(poi.convert_to_json(hash_data)).to eq("{\"foo\":\"bar\"}")
    end

    it "converts an xml to hash" do
      poi.xml_data = xml_raw_data

      expect(poi.convert_xml_to_hash).to eq(2)
    end
  end
end
