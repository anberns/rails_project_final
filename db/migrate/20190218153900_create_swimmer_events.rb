class CreateSwimmerEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :swimmer_events do |t|
      t.belongs_to :swimmer, index: true, foreign_key: true
      t.belongs_to :event, index: true, foreign_key: true
      
    end
  end
end
