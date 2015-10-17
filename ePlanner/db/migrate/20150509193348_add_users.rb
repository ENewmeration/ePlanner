class AddUsers < ActiveRecord::Migration
  def change
    create_table :users do |a|
      a.string :name
      a.string :email
      a.string :category
    end
  end
end
