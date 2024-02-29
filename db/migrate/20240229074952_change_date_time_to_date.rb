class ChangeDateTimeToDate < ActiveRecord::Migration[7.1]
  def change
    change_table :events do |t|
      t.rename :date_time, :event_date
    end
    change_column :events, :event_date, :date
    add_column :events, :event_time, :time
  end
end
