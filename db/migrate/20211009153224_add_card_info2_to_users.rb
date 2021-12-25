class AddCardInfo2ToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :card_exp_month, :string
    add_column :users, :card_exp_year, :string
    add_column :users, :expires_at, :datetime
  end
end
