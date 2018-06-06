class AddAvailableToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :available, :boolean
  end
end
