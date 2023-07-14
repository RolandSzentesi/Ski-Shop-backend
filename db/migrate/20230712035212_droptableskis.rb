class Droptableskis < ActiveRecord::Migration[6.1]
  def change
    drop_table :skis
  end
end
