class Api::V1::SearchController < ApplicationController

  def index
    @text = params[:text]
    scope = PgSearch.multisearch(@text).includes(:searchable)
    render json: scope.to_json
  end

end
