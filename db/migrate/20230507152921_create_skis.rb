class CreateSkis < ActiveRecord::Migration[6.1]
  def change
    create_table :skis do |t|
      t.string :name
      t.integer :price
      t.integer :size
      t.integer :lesson_id
    end
  end
end
