# frozen_string_literal: true

class SourceSerializer
  include FastJsonapi::ObjectSerializer
  attributes :continent, :country
end
