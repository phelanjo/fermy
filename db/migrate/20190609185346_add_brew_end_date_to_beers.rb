class AddBrewEndDateToBeers < ActiveRecord::Migration[5.2]
  def change
    add_column :beers, :brew_end_date, :date
  end
end
