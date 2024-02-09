class CreateSummaries < ActiveRecord::Migration[7.0]
  def change
    create_table :summaries do |t|
      t.string :title
      t.string :content
      t.references :schedule, null: false, foreign_key: true
      t.timestamps
    end
  end
end
