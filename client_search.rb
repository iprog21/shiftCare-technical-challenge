# frozen_string_literal: true

require "json"

class ClientSearch
 attr_reader :clients

 def initialize(file_path)
  @clients = JSON.parse(File.read(file_path))
 end
 
 def search_by_name(query)
  clients.select { |client| client["full_name"].downcase.include?(query.downcase) }
 end

 def find_duplicate_emails
  email_counts = Hash.new(0)
  
  clients.each do |client|
   email_counts[client["email"]] += 1
  end

  clients.select{ |client| email_counts[client["email"]] > 1  }
 end
end
