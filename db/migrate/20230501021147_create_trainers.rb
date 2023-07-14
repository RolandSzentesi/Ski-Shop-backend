class CreateTrainers < ActiveRecord::Migration[6.1]
  def change
    create_table :trainers do |t|
      t.string :name
      t.string :trainer_img
      t.string :location
      t.timestamps
    end
  end
end
