#!/usr/bin/env ruby

# frozen_string_literal: true

require_relative "client_search"

if ARGV.length < 1
 puts "Usage: ruby clients_app.rb <command> <query>"
 puts "-> Available commands: search and duplicates"
 puts "-> Query: required on search; optional in duplicates"
 exit
end

command   = ARGV[0]
query     = ARGV[1] || ""
file_path = "clients.json"

search = ClientSearch.new(file_path)

case command
 when "search"
  puts search.search_by_name(query)
 when "duplicates"
  puts search.find_duplicate_emails
 else
  puts "Unknown command. available commands: search and duplicates"
end
