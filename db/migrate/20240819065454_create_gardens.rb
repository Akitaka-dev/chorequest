class CreateGardens < ActiveRecord::Migration[7.1]
  def change
    create_table :gardens do |t|
      t.references :household, null: false, foreign_key: true

      t.timestamps
    end
  end
end
