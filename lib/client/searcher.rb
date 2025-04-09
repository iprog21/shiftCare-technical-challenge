# frozen_string_literal: true

require "json"
require_relative "base"

module Client
  class Searcher < Base
    def set_static_data
      set :clients, JSON.parse(File.read("clients.json"))
    end
  end
end
