# frozen_string_literal: true

require "spec_helper"

RSpec.describe Client::SearchDuplicates do
  describe "search duplicates" do
   context "when search is successful" do
    it "return clients with duplicate emails" do
      service = described_class.new(params: {
        search_key: "email"
      }).call

      expect(service.success?).to be_truthy
      expect(service.result[:clients]).to eq([
        {
          "id" => 2,
          "full_name" => "Jane Smith",
          "email" => "jane.smith@yahoo.com"
        },
        {
          "id" => 15,
          "full_name" => "Another Jane Smith",
          "email" => "jane.smith@yahoo.com"
        }
      ])
    end

    it "return clients with duplicate ids" do
      service = described_class.new(params: {
        search_key: "id"
      }).call

      expect(service.success?).to be_truthy
      expect(service.result[:clients]).to eq([
        {
          "id" => 34,
          "full_name" => "Samuel Turner",
          "email" => "samuel.turner@outlook.com"
        },
        {
          "id" => 34,
          "full_name" => "Victoria Phillips",
          "email" => "victoria.phillips@aol.com"
        }
      ])
    end

    it "return clients with duplicate full name" do
      service = described_class.new(params: {
        search_key: "full_name"
      }).call

      expect(service.success?).to be_truthy
      expect(service.result[:clients]).to eq([
        {
          "id" => 33,
          "full_name" => "Victoria Phillips",
          "email" => "chloe.roberts@hotmail.com"
        },
        {
          "id" => 34,
          "full_name" => "Victoria Phillips",
          "email" => "victoria.phillips@aol.com"
        }
      ])
    end

    it "return error if search_key doesn't exist" do
      service = described_class.new(params: {
        search_key: "full_namesss"
      }).call

      expect(service.success?).to be_falsy
      expect(service.errors).to eq("Search key not found.")
    end
    
   end
  end
end
