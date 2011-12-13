=begin

  add ($num1, $num2)
  For testing. 


  addEmail ($emailString)
  Saves the given e-mail message. 

  describeCustomFields ()
  Gets all of the custom fields available for Leads, Accounts and Contacts, including appropriate meta-information. 

  editAccount ($accountId, $rev, $account)
  Edit an account. 

  editActivity ($activityId, $rev, $activity)
  Edit an activity. 

  editContact ($contactId, $rev, $contact)
  Edit a contact. 

  editLead ($leadId, $rev, $lead)
  Edit a lead. 

  editStep ($stepId, $rev, $step)
  Update a process step. 

  findAccounts ($query, $orderBy= 'name', $orderDirection= 'ASC', $limit=50, $page=1, $stubResponses=true)
  Find accounts matching a specified query. 

  findAccountTypes ($orderBy= 'name', $orderDirection= 'ASC', $limit=50, $page=1)
  Get all active account types (to be applied to an account) 

  findActivities ($query, $orderBy= 'name', $orderDirection= 'ASC', $limit=50, $page=1, $stubResponses=true)
  Find activities matching a specified query. 

  findActivityTypes ($orderBy= 'name', $orderDirection= 'ASC', $limit=50, $page=1)
  Get all active activity types. 

  findCompetitors ($orderBy= 'name', $orderDirection= 'ASC', $limit=50, $page=1)
  Get all active Competitors. 

  findContacts ($query=null, $orderBy= 'id', $orderDirection= 'ASC', $limit=50, $page=1, $stubResponses=true)
  Find contacts associated with a specified account or lead. 

  findDelays ($orderBy= 'name', $orderDirection= 'ASC', $limit=50, $page=1)
  Get all active Delays (seen in Step responses in availableDelayIds) 

  findIndustries ($orderBy= 'name', $orderDirection= 'ASC', $limit=50, $page=1)
  Get all active Industries (to be applied to an account) 

  findLead_Outcomes ($orderBy= 'description', $orderDirection= 'ASC', $limit=50, $page=1)
  Get all possible outcomes for a closed lead. 

  findLeads ($query, $orderBy= 'id', $orderDirection= 'ASC', $limit=50, $page=1, $stubResponses=true)
  Find leads matching a specified query. 

  findMarkets ($orderBy= 'name', $orderDirection= 'ASC', $limit=50, $page=1)
  Get all active markets. 

  findMilestones ($orderBy= 'name', $orderDirection= 'ASC', $limit=50, $page=1)
  Get all active milestones. 

  findOrigins ($orderBy= 'name', $orderDirection= 'ASC', $limit=50, $page=1)
  Get all active Origins. 

  findProducts ($orderBy= 'name', $orderDirection= 'ASC', $limit=50, $page=1, $stubResponses=true)
  Get all active products. 

  findSettings ($orderBy= 'name', $orderDirection= 'ASC', $limit=50, $page=1)
  Return all publicly-visible settings. 

  findSources ($orderBy= 'name', $orderDirection= 'ASC', $limit=50, $page=1)
  Get all active Sources. 

  findTeams ($orderBy= 'name', $orderDirection= 'ASC', $limit=50, $page=1)
  Get all active Teams. 

  findTerritories ($orderBy= 'name', $orderDirection= 'ASC', $limit=50, $page=1)
  Get all territories. 

  findTimeline ($query, $orderBy= 'time', $orderDirection= 'ASC', $limit=50, $page=1, $stubResponses=true)
  Find timeline events (Activities, Emails and Notes) for an Entity. 

  findUsers ($orderBy= 'last_name', $orderDirection= 'ASC', $limit=50, $page=1)
  Get all active Users. 

  getAccount ($accountId, $rev=null)
  Get the specified Account. 

  getActivity ($activityId, $rev=null)
  Get the specified Activity. 

  getAnalyticsReport ($reportType, $period, $filter=null, $options=null)
  Returns graph data and overview information for various sales analytics reports. 

  getContact ($contactId, $rev=null)
  Get the specified Contact. 

  getEmail ($emailId, $rev=null)
  Get the specified Email. 

  getLead ($leadId, $rev=null)
  Get the specified lead. 

  getMobileSettings ()
  Return all mobile-related settings in a simple key-value array. 

  getNote ($noteId, $rev=null)
  Get the specified Note. 

  getProduct ($productId, $rev=null)
  Get all information for a product (including full price list). 

  getUpdateTimes ()
  Gets the last-updated times of each of the provisioning bins. 

  getUser ($userId, $rev=null)
  Get all info about a user. 

  newAccount ($account)
  Create a new account. 

  newActivity ($activity)
  Create a new activity. 

  newContact ($contact)
  Create a new contact. 

  newLead ($lead)
  Create a new Lead. 

  newTag ($tag)
  Create a new tag. 

  searchAccounts ($string, $limit=10)
  Return a list of Account stubs matching a given search string. 

  searchByEmail ($emailAddressString)
  Works just like searchUniversal, but only searches by email address. 

  searchCompetitors ($string, $limit=10)
  Return a list of Competitor stubs matching a given search string. 

  searchContacts ($string, $limit=10)
  Return a list of Contact stubs matching a given search string. 

  searchContactsAndUsers ($string, $limit=10)
  Return a list of Contact and User stubs matching a given search string. 

  searchLeads ($string, $limit=40)
  Return a list of Lead stubs matching a given search string. 

  searchProducts ($string, $limit=10)
  Return a list of Product stubs matching a given search string. 

  searchSources ($string, $limit=10)
  Return a list of Source stubs matching a given search string. 

  searchUniversal ($string)
  Return a list of Contact, Lead, and Account stubs matching a given search string. 

  searchUsersAndTeams ($string, $limit=10)
  Return a list of User and Team stubs matching a given search string. 
=end

require 'spec_helper'

describe NutshellCrm::Client do
  before :all do
    @api_username = ENV['NUTSHELL_USERNAME']
    @api_key = ENV['NUTSHELL_APIKEY']
    @nutshell = NutshellCrm::Client.new @api_username, @api_key #'7c419cd4bc3162a02c89d9e90f96faa066f2d7f6')
    @categories = ['Contacts', 'Accounts', 'Leads']
  end

  context 'client authentication errors' do
    it 'should set up a new client instance with an invalid username and raise an error' do
      lambda { NutshellCrm::Client.new('invalid@example.com', 'APIKEY123456') }.should raise_error
    end

    it 'should set up a new client instance with a valid username but invalid API key and raise an error' do
      lambda { NutshellCrm::Client.new(@api_username, 'APIKEY123456').find_leads({status: 0}) }.should raise_error
    end
  end

  subject { @nutshell }

  context 'after a new Nutshell client has been instantiated' do
    it 'should get a valid API service url that starts with https://' do
      @nutshell.api_url.should match 'https://'
    end

    it 'should find open leads' do
      @nutshell.find_leads({status: 0}).should_not be_empty
    end

    it 'should describe custom fields' do
      custom_fields = @nutshell.describe_custom_fields
      (custom_fields.all? {|k,v| @categories.include? k}).should be_true
    end

    it 'should find tags' do
      tags = @nutshell.find_tags
      (tags.all? {|k,v| @categories.include? k}).should be_true
    end

    it 'should get update times for each provisioning bin' do
      @nutshell.get_update_times.should_not be_empty
    end
  end
end