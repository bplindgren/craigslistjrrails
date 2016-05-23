class Post < ActiveRecord::Base
  belongs_to :seller, class_name: 'User'
  belongs_to :category
end
