class Api::V1::BooksController < ApplicationController
  include Paginable
  before_action :find_book_by_id, only: %i[show]

  def index
    @books =   Book.includes(:author)
                   .page(current_page)
                   .per(per_page)
                   .where(nil)
    @books = @books.filter_by_title(params[:title]) if params[:title].present?

    options = get_links_serializer_options('api_v1_books_path', @books)
    options[:include] = [:author]

    render json: BookSerializer.new(@books, options).serializable_hash
  end

  def show 
    options = { include: [:author] }
    render json: BookSerializer.new(@book, options).serializable_hash
  end

  private

  def find_book_by_id
    begin
     @book = Book.find(params[:id])
    rescue ActiveRecord::RecordNotFound
     render json: {
                    "message":"book not found"
                  }
    end
  end
end
