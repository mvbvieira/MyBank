class CreatePaymentMethods < ActiveRecord::Migration[6.0]
  def change
    create_table :payment_methods do |t|
      t.string :description
      t.string :code
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
