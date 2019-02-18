class AddTeamIds < ActiveRecord::Migration[5.2]
  def change
    add_column :coaches, :team_id, :integer
    add_column :swimmers, :team_id, :integer
  end

end