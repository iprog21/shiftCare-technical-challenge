# frozen_string_literal: true

require "spec_helper"

RSpec.describe Client::SearchBy do
  describe "search by key and value" do
    context "when search is successful" do
      it "returns clients that match the query with search_key full_name" do
        service = described_class.new(params: {
          search_key: "full_name",
          search_value: "John"
        }).call

        expect(service.success?).to be_truthy
        expect(service.result[:clients].map { |c| c["full_name"] }).to all(include("John"))
      end

      it "returns a client matching the search_key id" do
        service = described_class.new(params: {
          search_key: "id",
          search_value: 1,
          search_mode: "equal"
        }).call

        expect(service.success?).to be_truthy
        expect(service.result[:clients]).to eq([{
          "id" => 1,
          "full_name" => "John Doe",
          "email" => "john.doe@gmail.com"
        }])
      end

      it "returns a client matching the search_key email" do
        service = described_class.new(params: {
          search_key: "email",
          search_value: "john.doe@gmail.com",
          search_mode: "equal"
        }).call

        expect(service.success?).to be_truthy
        expect(service.result[:clients]).to eq([{
          "id" => 1,
          "full_name" => "John Doe",
          "email" => "john.doe@gmail.com"
        }])
      end
    end

    context "when search fails" do
      it "returns an error when search_key is nil" do
        service = described_class.new(params: {
          search_key: nil,
          search_value: "John"
        }).call

        expect(service.success?).to be_falsy
        expect(service.errors).to eq("Search key is required.")
      end

      it "returns empty if nothing found" do
        service = described_class.new(params: {
          search_key: "full_name",
          search_value: "Johntest"
        }).call

        expect(service.success?).to be_truthy
        expect(service.result[:clients]).to eq([])
        expect(service.result[:message]).to eq("No results found.")
      end
    end
  end
end
