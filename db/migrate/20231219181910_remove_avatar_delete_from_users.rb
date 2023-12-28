class RemoveAvatarDeleteFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :avatar_delete, :boolean
  end
end
