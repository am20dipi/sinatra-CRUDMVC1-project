class CreateNailpolishes < ActiveRecord::Migration
  def change
    create_table :nailpolishes do |t|
      t.string :name
      t.string :brand
      t.string :color
      t.integer :user_id
  end
end
