# frozen_string_literal: true

require "json"
require_relative "base"

module Client
  class Searcher < Base
    def set_params_data
      set :clients, load_clients
    end

    def filtered_fields
      [:clients, :message]
    end

    private
    def load_clients
      JSON.parse(
        File.read("clients.json")
      )
    end
  end
end
