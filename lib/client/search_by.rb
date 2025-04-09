# frozen_string_literal: true

require_relative "searcher"

module Client
  class SearchBy < Searcher
    def set_params_data
      super
      
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
        value = @search_key == "id" ? @search_value.to_i : @search_value.to_s
        
        @clients.select do |client|
          client[@search_key] == value
        end
      else
        []
      end

      set :clients, clients_result

      message = clients_result.empty? ? "No results found." : "Search results found."
      set :message, message
    end
  end
end
