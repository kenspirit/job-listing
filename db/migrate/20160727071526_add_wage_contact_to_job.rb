class AddWageContactToJob < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :wage_upper, :integer
    add_column :jobs, :wage_lower, :integer
    add_column :jobs, :contact, :string
  end
end
