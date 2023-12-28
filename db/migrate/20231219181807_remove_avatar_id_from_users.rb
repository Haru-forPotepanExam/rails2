class RemoveAvatarIdFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :avatar_id, :integer
  end
end
