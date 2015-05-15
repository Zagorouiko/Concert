class RemoveAndAddColumn < ActiveRecord::Migration
  def change
    remove_column(:venues, :name, :string)
    add_column(:venues, :description, :string)
end
end
