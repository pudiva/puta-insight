class CreateInsights < ActiveRecord::Migration[6.1]
  def change
    create_table :insights do |t|
      t.text :q1
      t.text :q2

      t.timestamps
    end
  end
end
