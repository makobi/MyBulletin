class AddMyBulletinidToPost < ActiveRecord::Migration
  def change
  	add_column :posts, :my_bulletins_id, :integer
  end
end
