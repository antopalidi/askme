class CreateSettings < ActiveRecord::Migration[7.0]
  def change
    create_table :settings do |t|
      t.string :header_color
      t.string :body_color
      t.string :font_size
      t.integer :user_id, index: true

      t.timestamps
    end
  end
end
