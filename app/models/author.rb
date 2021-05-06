class Author < ApplicationRecord
  # include PgSearch::Model
  # multisearchable against: [:name, :genres]

  has_many :books
  validates :name, :biography, :genres, :presence => true  
  
  scope :filter_by_genre, -> (genres) {where genres: genres}
  scope :filter_by_name, -> (name) {where name: name}
end
