class CreateSinaUsers < ActiveRecord::Migration
  def self.up
    create_table :sina_users do |t|
      t.string :userID , :limit => 20
      t.string :name , :limit => 128
      t.string :location , :limit => 128
      t.text :description , :limit => 512
      t.integer :followers , :limit => 11
      t.integer :friends , :limit => 11
      t.integer :statuses , :limit => 11

      t.timestamps
    end
  end

  def self.down
    drop_table :sina_users
  end
end
