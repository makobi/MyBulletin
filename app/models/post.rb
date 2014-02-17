class Post < ActiveRecord::Base
  attr_accessible :description, :duedate, :title, :photo, :user_id

  belongs_to :user

  has_attached_file :photo, :styles => { :small => "150x150>" },
                  :url  => "/assets/posts/:id/:style/:basename.:extension",
                  :path => ":rails_root/public/assets/posts/:id/:style/:basename.:extension"

  validates_attachment_presence :photo
  validates_attachment_size :photo, :less_than => 5.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']

  validates :title, presence: true, uniqueness: true

  validates :description, presence: true

  validates :duedate, presence: true

end
