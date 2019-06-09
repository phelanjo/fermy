class AddBrewStartDateToBeers < ActiveRecord::Migration[5.2]
  def change
    add_column :beers, :brew_start_date, :date
  end
end
