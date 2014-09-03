class CreateNokogiriGas < ActiveRecord::Migration
  def change
    create_table :nokogirigas do |t|
      t.string :url
      t.string :title
      t.string :date

      t.timestamps
    end
  end
end
