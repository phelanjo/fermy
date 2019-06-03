class ChangeBrewingTimeInBeers < ActiveRecord::Migration[5.2]
  def change
    change_column :beers, :brewing_time, :integer
  end
end
