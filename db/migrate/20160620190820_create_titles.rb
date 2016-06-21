class CreateTitles < ActiveRecord::Migration
  def change
    create_table :titles do |x|
      x.string :name
    end
  end
end
