class CreateLessons < ActiveRecord::Migration[6.1]
  def change
    create_table :lessons do |t|
      t.string :date
      t.integer :price
      t.string :type
      t.string :description
      t.integer :trainer_id
    end
  end
end
