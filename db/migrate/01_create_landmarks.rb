class CreateLandmarks < ActiveRecord::Migration
  def change
    create_table :landmarks do |x|
      x.string :name
      x.integer :figure_id
      x.integer :year_completed
    end
  end
end
