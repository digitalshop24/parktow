class CreateParkings < ActiveRecord::Migration
  def change
    create_table :parkings do |t|
      t.references :device, index: true, foreign_key: true
      t.st_point :location, geographic: true
      t.boolean :active, null: false, default: true

      t.timestamps null: false
    end
  end
end
