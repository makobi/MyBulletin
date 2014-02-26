class MyBulletin < ActiveRecord::Base
  include PublicActivity::Model
  
  tracked owner: ->(controller, model) { controller && controller.current_user }

  attr_accessible :title

  has_many :post
  belongs_to :user, dependent: :destroy
end
