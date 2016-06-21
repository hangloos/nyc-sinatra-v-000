class CreateFigureTitles < ActiveRecord::Migration
  def change
    create_table :figure_titles do |x|
      x.integer :title_id
      x.integer :figure_id
    end
  end
end
