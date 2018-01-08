class CorrectFigureTitlesTableName < ActiveRecord::Migration
  def change
    rename_table :figure_tables, :figure_titles
  end
end
