class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.integer :type_id
      t.string :state
      t.string :city
      t.string :address
      t.string :phone
      t.string :email
      t.text :description
      t.string :dress
      t.string :name

      t.timestamps
    end
  end
end
