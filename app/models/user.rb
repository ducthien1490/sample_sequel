class User < Sequel::Model
  plugin :nested_attributes
  one_to_many :posts
  nested_attributes :posts
end
