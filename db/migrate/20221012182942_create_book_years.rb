class CreateBookYears < ActiveRecord::Migration[7.0]
  def change
    create_table :book_years do |t|
      t.references :book, null: false, foreign_key: true
      t.references :year, null: false, foreign_key: true

      t.timestamps
    end
  end
end
