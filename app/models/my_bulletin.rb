class MyBulletin < ActiveRecord::Base
  attr_accessible :title

  has_many :post
  belongs_to :user
end
