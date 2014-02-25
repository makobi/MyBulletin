class AddUseridPostidToMyBulletin < ActiveRecord::Migration
  def change
  	add_column :my_bulletins, :user_id, :integer
  end
end
