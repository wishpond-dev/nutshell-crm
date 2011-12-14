require "nutshell-crm/version"

require 'json'
require 'httparty'

# @author Michael Shafrir
module NutshellCrm
  class Client
    attr_accessor :api_url
    include HTTParty
    format :json

    def initialize(username, api_key)
      @username = username
      @api_key = api_key

      puts "Username: #{username}"
      puts "API Key: #{api_key}"

      result = exec_request(build_payload({:username => @username}), 'http://api.nutshell.com/v1/json')
      api_host = result['api']
      @api_url = "https://#{api_host}/api/v1/json"
    end

    def add_email(email_string)
      exec_request build_payload({emailString: email_string})
    end

    # Gets all of the custom fields available for Leads, Accounts and Contacts, including appropriate meta-information.
    #
    # @return [json] the custom fields available for Leads, Accounts and Contacts, including appropriate meta-information 
    def describe_custom_fields
      exec_request build_payload
    end

    def edit_account(account_id, rev, account)
      exec_request build_payload({:accountId => account_id, :rev => rev, :account => account})
    end

    def edit_activity(activity_id, rev, activity)
      exec_request build_payload({:activityId => activity_id, :rev => rev, :activity => activity})
    end

    def edit_contact(contact_id, rev, contact)
      exec_request build_payload({:contactId => contact_id, :rev => rev, :contact => contact})
    end

    def edit_lead(lead_id, rev, lead)
      exec_request build_payload({:leadId => lead_id, :rev => rev, :lead => lead})
    end

    def edit_step(step_id, rev, step)
      exec_request build_payload({:stepId => step_id, :rev => rev, :step => step})
    end

    def find_accounts(query, order_by = nil, order_direction = nil, limit = nil, page = nil, stub_responses = nil)
      params = {query: query, orderBy: order_by, orderDirection: order_direction, limit: limit, page: page, stubResponses: stub_responses}
      payload = build_payload params
      exec_request(payload)
    end

    def find_account_types(order_by = nil, order_direction = nil, limit = nil, page = nil)
      params = {orderBy: order_by, orderDirection: order_direction, limit: limit, page: page}
      payload = build_payload params
      exec_request(payload)
    end

    def find_activities(query, order_by = nil, order_direction = nil, limit = nil, page = nil, stub_responses = nil)
      params = {query: query, orderBy: order_by, orderDirection: order_direction, limit: limit, page: page, stubResponses: stub_responses}
      payload = build_payload params
      exec_request(payload)
    end

    def find_activity_types(order_by = nil, order_direction = nil, limit = nil, page = nil)
      params = {orderBy: order_by, orderDirection: order_direction, limit: limit, page: page}
      payload = build_payload params
      exec_request(payload)
    end

    def find_competitors(order_by = nil, order_direction = nil, limit = nil, page = nil)
      params = {orderBy: order_by, orderDirection: order_direction, limit: limit, page: page}
      payload = build_payload params
      exec_request(payload)
    end

    def find_contacts(query, order_by = nil, order_direction = nil, limit = nil, page = nil, stub_responses = nil)
      params = {query: query, orderBy: order_by, orderDirection: order_direction, limit: limit, page: page, stubResponses: stub_responses}
      payload = build_payload params
      exec_request(payload)
    end

    def find_delays(order_by = nil, order_direction = nil, limit = nil, page = nil)
      params = {orderBy: order_by, orderDirection: order_direction, limit: limit, page: page}
      payload = build_payload params
      exec_request(payload)
    end

    def find_industries(order_by = nil, order_direction = nil, limit = nil, page = nil)
      params = {orderBy: order_by, orderDirection: order_direction, limit: limit, page: page}
      payload = build_payload params
      exec_request(payload)
    end

    def find_lead_outcomes(order_by = nil, order_direction = nil, limit = nil, page = nil)
      params = {orderBy: order_by, orderDirection: order_direction, limit: limit, page: page}
      payload = build_payload params, 'findLead_Outcomes'
      exec_request(payload)
    end

    def find_leads(query, order_by = nil, order_direction = nil, limit = nil, page = nil, stub_responses = nil)
      params = {query: query, orderBy: order_by, orderDirection: order_direction, limit: limit, page: page, stubResponses: stub_responses}
      payload = build_payload params
      exec_request(payload)
    end

    def find_markets(order_by = nil, order_direction = nil, limit = nil, page = nil)
      params = {orderBy: order_by, orderDirection: order_direction, limit: limit, page: page}
      payload = build_payload params
      exec_request(payload)
    end

    def find_milestones(order_by = nil, order_direction = nil, limit = nil, page = nil)
      params = {orderBy: order_by, orderDirection: order_direction, limit: limit, page: page}
      payload = build_payload params
      exec_request(payload)
    end

    def find_origins(order_by = nil, order_direction = nil, limit = nil, page = nil)
      params = {orderBy: order_by, orderDirection: order_direction, limit: limit, page: page}
      payload = build_payload params
      exec_request(payload)
    end

    def find_products(order_by = nil, order_direction = nil, limit = nil, page = nil, stub_responses = nil)
      params = {orderBy: order_by, orderDirection: order_direction, limit: limit, page: page, stubResponses: stub_responses}
      payload = build_payload params
      exec_request(payload)
    end

    def find_settings(order_by = nil, order_direction = nil, limit = nil, page = nil)
      params = {orderBy: order_by, orderDirection: order_direction, limit: limit, page: page}
      payload = build_payload params
      exec_request(payload)
    end

    def find_sources(order_by = nil, order_direction = nil, limit = nil, page = nil)
      params = {orderBy: order_by, orderDirection: order_direction, limit: limit, page: page}
      payload = build_payload params
      exec_request(payload)
    end

    def find_tags
      exec_request build_payload
    end

    def find_teams(order_by = nil, order_direction = nil, limit = nil, page = nil)
      params = {orderBy: order_by, orderDirection: order_direction, limit: limit, page: page}
      payload = build_payload params
      exec_request(payload)
    end

    def find_territories(order_by = nil, order_direction = nil, limit = nil, page = nil)
      params = {orderBy: order_by, orderDirection: order_direction, limit: limit, page: page}
      payload = build_payload params
      exec_request(payload)
    end

    def find_timeline(query, order_by = nil, order_direction = nil, limit = nil, page = nil, stub_responses = nil)
      params = {query: query, orderBy: order_by, orderDirection: order_direction, limit: limit, page: page, stubResponses: stub_responses}
      payload = build_payload params
      exec_request(payload)
    end

    def find_users(order_by = nil, order_direction = nil, limit = nil, page = nil)
      params = {orderBy: order_by, orderDirection: order_direction, limit: limit, page: page}
      payload = build_payload params
      exec_request(payload)
    end

    def get_account(account_id, rev = nil)
      params = {:accountId => account_id, :rev => rev}
      exec_request build_payload(params)
    end

    def get_activity(activity_id, rev = nil)
      params = {:activityId => activity_id, :rev => rev}
      exec_request build_payload(params)
    end

    def getAnalyticsReport(report_type, period, filter_entity = nil, options = nil)
      params = {:reportType => report_type, :period => period, :filter => filter_entity, :options => options}
      exec_request build_payload(params)
    end

    def get_contact(contact_id, rev = nil)
      params = {:contactId => contact_id, :rev => rev}
      exec_request build_payload(params)
    end

    def get_email(email_id, rev = nil)
      params = {:emailId => email_id, :rev => rev}
      exec_request build_payload(params)
    end

    def get_lead(lead_id, rev = nil)
      params = {:leadId => lead_id, :rev => rev}
      exec_request build_payload(params)
    end

    def get_mobile_settings
      exec_request build_payload
    end

    def get_note(note_id, rev = nil)
      params = {:noteId => note_id, :rev => rev}
      exec_request build_payload(params)
    end

    def get_product(product_id, rev = nil)
      params = {:productId => product_id, :rev => rev}
      exec_request build_payload(params)
    end

    def get_update_times
      exec_request build_payload
    end

    def get_user(user_id = nil, rev = nil)
      params = {:userId => user_id, :rev => rev}
      exec_request build_payload(params)
    end

    def new_account(account)
      exec_request build_payload({account: account})
    end

    def new_activity(activity)
      exec_request build_payload({activity: activity})
    end

    def new_contact(contact)
      exec_request build_payload({contact: contact})
    end

    def new_lead(lead)
      exec_request build_payload({lead: lead})
    end

    def new_tag(tag)
      exec_request build_payload({tag: tag})
    end

    def search_accounts(query, limit = nil)
      exec_request build_payload({:string => query, :limit => limit})
    end

    def search_by_email(email_address)
      exec_request build_payload({:emailAddressString => email_address})
    end

    def search_competitors(query, limit = nil)
      exec_request build_payload({:string => query, :limit => limit})
    end

    def search_contacts(query, limit = nil)
      exec_request build_payload({:string => query, :limit => limit})
    end

    def search_contacts_and_users(query, limit = nil)
      exec_request build_payload({:string => query, :limit => limit})
    end

    def search_leads(query, limit = nil)
      exec_request build_payload({:string => query, :limit => limit})
    end

    def search_products(query, limit = nil)
      exec_request build_payload({:string => query, :limit => limit})
    end

    def search_sources(query, limit = nil)
      exec_request build_payload({:string => query, :limit => limit})
    end

    def search_universal(query)
      exec_request build_payload({:string => query})
    end

    def search_users_and_teams(query, limit = nil)
      exec_request build_payload({:string => query, :limit => limit})
    end




    private

    def build_payload(params = nil, override_method = nil)
      # Calculate the Nutshell API method name based on the Ruby method name (with a few exceptions)
      if override_method.nil?
        method = caller[0][/`.*'/][1..-2]
        method = 'getApiForUsername' if method == 'initialize'
      else
        method = override_method
      end

      # Create the payload
      payload = {:method => camelcase(method), :id => generate_request_id}

      # Filter out keys with nil values.
      payload[:params] = params.reject {|k,v| v.nil?} unless params.nil?

      # Return as JSON
      payload.to_json
    end


    # All Nutshell API requests need a request id.
    def generate_request_id
      Digest::MD5.hexdigest(Time.now.to_i.to_s).slice(0..8)
    end

    def exec_request(payload, override_url = nil)
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
