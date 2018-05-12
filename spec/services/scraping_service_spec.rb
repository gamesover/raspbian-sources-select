# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ScrapingService do
  subject(:service) { described_class.new }

  describe '#sources_list' do
    it 'contains Europe' do
      expect(service.sources_list).to include(include(continent: 'Europe'))
    end
  end
end
