class CreateFigures < ActiveRecord::Migration
  def change
    create_table :figures do |x|
      x.string :name
    end
  end
end
