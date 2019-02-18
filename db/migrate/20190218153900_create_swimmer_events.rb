class CreateSwimmerEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :swimmer_events do |t|
      t.integer :swimmer_id
      t.integer :event_id
      t.time :best_time
    end
  end
end
