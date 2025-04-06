# frozen_string_literal: true

require_relative "../client_search"

RSpec.describe ClientSearch do
 let(:file_path) { "clients.json" }
 let(:client_search) { ClientSearch.new(file_path) }
 
 describe "#search_by_name" do
  it "returns clients that match the query" do
   results = client_search.search_by_name("John")
   
   expect(results).to include({ "id" => 1, "full_name" => "John Doe", "email" => "john.doe@gmail.com" })
  end
 end
 
 describe "#find_duplicate_emails" do
  it "returns clients with duplicate emails" do
   results = client_search.find_duplicate_emails

   expect(results).to include({ "id" => 2, "full_name" => "Jane Smith", "email" => "jane.smith@yahoo.com" })
   expect(results).to include({ "id" => 15, "full_name" => "Another Jane Smith", "email" => "jane.smith@yahoo.com" })
  end
 end
end
