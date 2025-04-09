# frozen_string_literal: true

require_relative "searcher"

module Client
  class SearchDuplicates < Searcher
    def set_params_data
      super

      set :search_key, params.dig(:search_key)
    end

    def check_errors
      send_error "Search key is required." unless @search_key
      send_error "Search key not found." unless @clients.all? { |client| client.key?(@search_key) }
    end

    def process_data
      clients_result = search_duplicates
      message = clients_result.empty? ? "No results found." : "Search results found."
     
      set :clients, clients_result
      set :message, message  
    end

    private
      def search_duplicates
        data_counts = Hash.new(0)

        @clients.each do |client|
          data_counts[client[@search_key]] += 1
        end

        @clients.select { |client| data_counts[client[@search_key]] > 1 }
      end
  end
end
