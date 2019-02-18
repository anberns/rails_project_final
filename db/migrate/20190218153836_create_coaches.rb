class CreateCoaches < ActiveRecord::Migration[5.2]
  def change
    create_table :coaches do |t|
      t.string :name
      t.string :password_digest
      t.string :email
      t.integer :team_id

      t.timestamps
    end
  end
end
