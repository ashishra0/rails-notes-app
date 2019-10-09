class CreateNotes < ActiveRecord::Migration[6.0]
  def change
    create_table :notes do |t|
      t.string :title
      t.text :description
      t.integer :user_id
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
