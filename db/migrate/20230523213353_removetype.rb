class Removetype < ActiveRecord::Migration[6.1]
  def change
    remove_column :lessons, :type, :string
  end
end
