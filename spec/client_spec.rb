RSpec.describe NgpvanPublicEventListing::Client do
  describe 'initialize' do
    it 'should set the properties' do
      client =  NgpvanPublicEventListing::Client.new(mode: 'event-list')
      expect(client.mode).to eq('event-list')
    end
  end
end

