class CreateVenueTableAndBandTable < ActiveRecord::Migration
  def change
    create_table(:venues) do |t|
      t.column(:name, :string)
      t.timestamps null: false
    end

    create_table(:bands) do |t|
      t.column(:name, :string)
      t.timestamps null: false
    end

    create_table(:venues_bands, id: false) do |t|
      t.belongs_to :venues, index: true
      t.belongs_to :bands, index: true
    end
  end
end
