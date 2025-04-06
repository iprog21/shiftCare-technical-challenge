# frozen_string_literal: true

require "sinatra"
require "json"
require "pry"
require_relative "client_search"

get "/" do
  "Welcome to the ShiftCare API"
end

get "/search" do
  query = params["q"]
  return status 400 unless query
  
  client_search = ClientSearch.new("clients.json")

  results = client_search.search_by_name(query)
  content_type :json
  results.to_json
end

get "/duplicates" do
  client_search = ClientSearch.new("clients.json")
  
  results = client_search.find_duplicate_emails
  content_type :json
  results.to_json
end

post "/clients" do
  client_search = ClientSearch.new("clients.json")
  
  client_data = request.params
  new_client  = client_search.add_client(client_data)
  
  status 201
  content_type :json
  new_client.to_json
end
