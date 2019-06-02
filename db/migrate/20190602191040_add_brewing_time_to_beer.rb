class AddBrewingTimeToBeer < ActiveRecord::Migration[5.2]
  def change
    add_column :beers, :brewing_time, :integer
  end
end
