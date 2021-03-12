class CreateFixes < ActiveRecord::Migration[6.0]
  def change
    create_table :fixes do |t|
      t.string     :title,    null: false
      t.text       :comment,  null: false
      t.integer    :genre_id, null: false
      t.references :user,     null: false, foreign_key: true
      t.timestamps
    end
  end
end
