class CreateTemplates < ActiveRecord::Migration
  def change
    create_table :templates do |t|
    	t.string :name
    	t.belongs_to :course
    end
  end
end
