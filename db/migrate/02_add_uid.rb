class AddUid < ActiveRecord::Migration[5.2]
  def change
    add_column :coaches, :uid, :integer
    add_column :swimmers, :uid, :integer
  end

end