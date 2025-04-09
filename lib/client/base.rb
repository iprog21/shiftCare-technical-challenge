# frozen_string_literal: true

module Client
    class Base
      attr_writer :data
      attr_reader :result, :errors, :params
  
      def initialize params: {}
        @params = params
        @data   = {}
  
        set_params_data
        set_static_data
  
        extract_and_intialize_instance_variables
      end
  
      def call
        check_errors
        return self if errors?
  
        process_data
  
        send_result filtered_response
      end
  
      def process_data
        {}
      end
  
      def filtered_response
        filtered_fields.any? ? result_data.slice(*filtered_fields) : result_data
      end
  
      def filtered_fields
        []
      end
  
      def check_errors
        nil
      end
  
      def set key, value
        result_data[key] = value
      end
  
      def result_data
        @data
      end
  
      def set_params_data
        {}
      end
  
      def set_static_data
        {}
      end
  
      def extract_and_intialize_instance_variables
        result_data.each do |key, value|
          instance_variable_set("@#{key}", value)
        end
      end
  
      def success?
        errors.nil?
      end
  
      def errors?
        !errors.nil?
      end
  
      def send_result data
        @result = data || []
  
        self
      end
  
      def send_error data
        @errors = data || []
  
        self
      end
    end
  end