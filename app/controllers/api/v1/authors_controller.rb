class Api::V1::AuthorsController < ApplicationController
  include Paginable  
   before_action :find_author_by_id, only: %i[show]

  def index

    @authors = Author.includes(:books)
                     .page(current_page)
                     .per(per_page)
                     .where(nil)
    @authors = @authors.filter_by_genre(params[:genres]) if params[:genres].present?
    @authors = @authors.filter_by_name(params[:name]) if params[:name].present?

    options = get_links_serializer_options('api_v1_authors_path', @authors)
    options[:include] = [:books]

    render json: AuthorSerializer.new(@authors, options).serializable_hash
  end


  def show 
    options = { include: [:books] }
    render json: AuthorSerializer.new(@author, options).serializable_hash
  end

  private

  def find_author_by_id
    begin
     @author = Author.find(params[:id])
    rescue ActiveRecord::RecordNotFound
     render json: {
                    "message":"author not found"
                  }
    end
  end


end
