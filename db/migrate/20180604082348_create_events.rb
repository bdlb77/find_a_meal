class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :location
      t.date :date
      t.time :time
      t.integer :min_p
      t.integer :max_p
      t.text :description

      t.timestamps
    end
  end
end
