class ChangeEventDateToEventDateTime < ActiveRecord::Migration[7.1]
  def change
    change_table :events do |t|
      t.rename :event_date, :event_date_time
    end
    change_column :events, :event_date_time, :datetime
    remove_column :events, :event_time, :time
  end
end
