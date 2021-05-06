class AuthorSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :biography, :genres
  has_many :books
  cache_options enabled: true, cache_length: 12.hours
end
