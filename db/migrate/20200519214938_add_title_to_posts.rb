class AddTitleToPosts < ActiveRecord::Migration[5.0]
  def change
    #add_column テーブル名, カラム名, データ型
    add_column :posts, :title, :string
  end
end
