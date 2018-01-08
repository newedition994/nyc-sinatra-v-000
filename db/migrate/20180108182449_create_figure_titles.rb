class CreateFigureTitles < ActiveRecord::Migration
  def change
    create_table :figure_tables do |t|
      t.integer :title_id
      t.integer :figure_id
    end
  end
end
