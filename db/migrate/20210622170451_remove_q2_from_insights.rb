class RemoveQ2FromInsights < ActiveRecord::Migration[6.1]
  def up
    execute <<~SQL
      INSERT INTO insights (q1, created_at, updated_at)
        SELECT i.q2, i.created_at, i.updated_at FROM insights i WHERE i.q2 IS NOT NULL;
    SQL

    change_table :insights do |t|
      t.rename :q1, :body
      t.remove :q2
    end
  end
end
