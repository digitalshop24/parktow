class CreateEvacuators < ActiveRecord::Migration
  def change
    create_table :evacuators do |t|
      t.st_point :location, geographic: true
      t.boolean :active, null: false, default: true
      t.datetime :last_seen, null: false, default: 'now()'

      t.timestamps null: false
    end
  end
end
