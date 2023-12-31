class RemoveProfileIdFromArticles < ActiveRecord::Migration[7.0]
  def change
    remove_reference :articles, :profile_id, null: false, foreign_key: true
  end
end
