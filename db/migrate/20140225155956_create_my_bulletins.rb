class CreateMyBulletins < ActiveRecord::Migration
  def change
    create_table :my_bulletins do |t|
      t.string :title

      t.timestamps
    end
  end
end
