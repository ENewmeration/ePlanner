class AddRememberDigestToUsers < ActiveRecord::Migration
  def change
    add_column :users, :remember_digest, :string
 
    create_table :courses_users, id: false do |t|
      t.belongs_to :course, index: true
      t.belongs_to :user, index: true
    end
  end
end
