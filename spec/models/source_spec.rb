# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Source, type: :model do
  describe '.refresh_table_content' do
    it 'changes source count' do
      expect { described_class.refresh_table_content }.to change(Source, :count)
    end
  end
end
