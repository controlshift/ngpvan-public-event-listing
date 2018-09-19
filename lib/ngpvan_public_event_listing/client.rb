require 'mechanize'
require 'faraday'
require 'faraday_middleware'
require 'json'

module NgpvanPublicEventListing
  class Client
    attr_accessor :mode, :event_list, :host, :username, :password

    def initialize(attrs = {})
      attrs.each do |key,value|
        if self.respond_to?("#{key}=")
          self.send("#{key}=", value)
        end
      end
    end

    def event_list?
      mode == 'event-list'
    end

    def public_site?
      mode == 'public-site'
    end

    def events
      if event_list?
        load_from_event_list
      else
        load_from_public_site
      end
    end

    private

    def load_from_public_site
      connection = Faraday.new("https://#{self.host}/") do |conn|
        conn.basic_auth(self.username, self.password)
        conn.request :json
        conn.response :json, :content_type => /\bjson$/
        conn.adapter Faraday.default_adapter
      end
      resp = connection.get '/eventsapi'
      resp.body['events']
    end

    def load_from_event_list
      agent = Mechanize.new
      resp = agent.get(event_list)
      resp.search("div.oa-event-result-container").collect do |event_result|
        event_id = event_result.attributes['data-event-id'].value
        title = event_result.attributes['data-event-name'].value
        link = event_result.search('a.oa-event-result-name-link').first

        url = link.attributes['href'].value
        {'crmEventId' => event_id, 'url' => url, 'title' => title}
      end
    end
  end
end
