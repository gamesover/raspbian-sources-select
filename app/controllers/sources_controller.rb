# frozen_string_literal: true

class SourcesController < ApplicationController
  before_action :set_source, only: %i[show update destroy]

  # GET /sources
  def index
    @sources = Source.all

    render json: @sources
  end

  def scraping; end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_source
    @source = Source.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def source_params
    params.require(:source).permit(:continent, :country, :mirror, :address, :issues)
  end
end
