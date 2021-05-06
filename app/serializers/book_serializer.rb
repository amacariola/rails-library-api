class BookSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :description, :ratings
  belongs_to :author
  cache_options enabled: true, cache_length: 12.hours
end
