class DeleteEventDateTimeAndAddNewOne < ActiveRecord::Migration[7.1]
  def change
    remove_column :events, :event_date_time, :time
    add_column :events, :event_date_time, :datetime
  end
end
