class CreateFrames < ActiveRecord::Migration[5.2]
  def change
    create_table :frames do |t|
      t.string :frame_string
      t.string :order
      t.references :film, foreign_key: true

      t.timestamps
    end
  end
end
