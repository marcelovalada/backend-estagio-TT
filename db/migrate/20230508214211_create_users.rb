class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name, limit: 40, null: false
      t.string :password_digest, limit: 60, null: false
      t.string :email, limit: 60, null: false
      t.string :cpf, limit: 14, null: false

      t.timestamps
    end
  end
end
