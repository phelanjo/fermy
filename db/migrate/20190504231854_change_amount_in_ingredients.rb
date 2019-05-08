class ChangeAmountInIngredients < ActiveRecord::Migration[5.2]
  def change
    change_column :ingredients, :amount, :decimal
  end
end
