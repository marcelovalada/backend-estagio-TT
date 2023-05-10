class CreateVisits < ActiveRecord::Migration[6.1]
  def change
    create_table :visits do |t|
      t.date :data
      t.references :user, null: false, foreign_key: true
      t.datetime :checkin_at
      t.datetime :checkout_at
      t.string :status

      t.timestamps
    end
  end
end
