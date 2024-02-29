class ChangeEventDateTimeToTime < ActiveRecord::Migration[7.1]
  def change
    change_column :events, :event_date_time, :time
  end
end
