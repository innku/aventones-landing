class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.string :email
      t.string :would_charge
      t.string :would_pay

      t.timestamps
    end
    add_index :surveys, :would_charge
    add_index :surveys, :would_pay
  end
end
