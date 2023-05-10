class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.string :name
      t.references :formulary, null: false, foreign_key: true
      t.integer :question_type

      t.timestamps
    end
  end
end
