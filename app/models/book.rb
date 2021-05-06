class Book < ApplicationRecord

  belongs_to :author
  validates :title, :description, :presence => true

  scope :filter_by_title, -> (title) {where title: title}

end
