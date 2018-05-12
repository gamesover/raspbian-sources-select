# frozen_string_literal: true

class Source < ApplicationRecord
  class << self
    def refresh_table_content
      Source.transaction(requires_new: true) do
        Source.destroy_all
        Source.create(ScrapingService.new.sources_list)
      end
    end
  end
end
