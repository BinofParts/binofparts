class CreateKop2009 < ActiveRecord::Migration
  def change
    create_table :kop2009s do |t|
    	t.string  :name
    	t.string  :description
    	t.string  :number
    	t.integer :qty
    	t.string  :category
    	t.string  :picture
    end
  end
end