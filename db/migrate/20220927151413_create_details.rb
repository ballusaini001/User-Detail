class CreateDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :details do |t|
      t.string :First_name
      t.string :Last_name
      t.string :Caste
      t.integer :Age
      t.float :Height_in_CMs
      t.float :Weight_in_KGs
      t.string :Phone_no
      t.string :Email

      t.timestamps
    end
  end
end
