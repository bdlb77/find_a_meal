class AddDefaultValueToAvailable < ActiveRecord::Migration[5.2]
  def up
    change_column :events, :available, :boolean, default: true
  end
end
