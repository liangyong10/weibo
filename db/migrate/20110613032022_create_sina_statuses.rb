class CreateSinaStatuses < ActiveRecord::Migration
  def self.up
    create_table :sina_statuses do |t|
      t.string :statusID ,:limit => 20
      t.text :text ,:limit => 512
      t.integer :favorited ,:limit => 1
      t.string :reply_to_userID ,:limit => 20
      t.string :retweeted ,:limit => 20
      t.string :usr ,:limit => 20
      t.date :date
      t.time :time

      t.timestamps
    end
  end

  def self.down
    drop_table :sina_statuses
  end
end
