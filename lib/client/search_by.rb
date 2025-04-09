# frozen_string_literal: true

require_relative "searcher"

module Client
  class SearchBy < Searcher
    def set_params_data
      set :search_key, params.dig(:search_key)
      set :search_value, params.dig(:search_value)
      set :search_mode, params.dig(:search_mode) || "like"
    end

    def check_errors
      send_error "Search key is required." unless @search_key
    end

    def process_data
      clients_result = case @search_mode
      when "like"
        @clients.select do |client|
          client[@search_key].to_s.downcase.include?(@search_value.to_s.downcase)
        end
      when "equal"
        @clients.select do |client|
          client[@search_key] == @search_value
        end
      else
        []
      end

      set :clients, clients_result
    end
  end
end
