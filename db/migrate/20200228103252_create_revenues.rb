class CreateRevenues < ActiveRecord::Migration[6.0]
  def change
    create_table :revenues do |t|
      t.string :description
      t.string :type
      t.string :brand
      t.integer :status
      t.decimal :amount, default: 0.0
      t.date :received_at
      t.references :payment_method, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
