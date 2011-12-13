require "nutshell-crm/version"

require 'json'
require 'httparty'

module NutshellCrm
  class Client
    attr_accessor :api_url
    include HTTParty
    format :json

    def initialize(username, api_key)
      @username = username
      @api_key = api_key

      result = exec_request(build_payload({:username => @username}), 'http://api.nutshell.com/v1/json')
      api_host = result['api']
      @api_url = "https://#{api_host}/api/v1/json"
    end

    def describe_custom_fields
      exec_request build_payload
    end

    def find_leads(query, order_by = 'id', order_direction = 'ASC', limit = 50, page = 1, stub_responses = true)
      params = {query: query, orderBy: order_by, orderDirection: order_direction, limit: limit, page: page, stubResponses: stub_responses}
      payload = build_payload params
      exec_request(payload)
    end

    def find_tags
      exec_request build_payload
    end

    def get_update_times
      exec_request build_payload
    end



    private

    def build_payload(params = nil)
      method = caller[0][/`.*'/][1..-2]
      method = 'getApiForUsername' if method == 'initialize'
      payload = {:method => camelcase(method), :id => generate_request_id}
      payload[:params] = params unless params.nil?
      payload.to_json
    end

    def generate_request_id
      Digest::MD5.hexdigest(Time.now.to_i.to_s).slice(0..8)
    end

    def exec_request(payload = nil, override_url = nil)
      response = HTTParty.post(override_url.nil? ? @api_url : override_url,
        :basic_auth => {:username => @username, :password => @api_key},
        :body => payload,
        :query => {:output => :json}
      )

      unless response['error'].nil?
        error = response['error']
        error_code = error['code']
        error_msg = error['message']
        raise "#{error_msg} (#{error_code})"
      end

      response['result']
    end

    def camelcase(method_name)
      parts = []
      method_name.split('_').each_with_index {|str, idx| parts << (idx == 0 ? str : str.capitalize)}
      parts.join ''
    end
  end
end
