class CreateMyMails < ActiveRecord::Migration
  def self.up
    create_table :my_mails do |t|
      t.date :current_time
      t.string :from
      t.string :to
      t.string :subjec
      t.text :content

      t.timestamps
    end
  end

  def self.down
    drop_table :my_mails
  end
end
