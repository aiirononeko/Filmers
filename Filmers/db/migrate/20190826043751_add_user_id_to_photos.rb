class AddUserIdToPhotos < ActiveRecord::Migration[5.2]
  def up
    # execute 'DELETE FROM photos;'
    add_reference :photos, :user, null: false, index: true
  end

  def down
    remove_reference :photos, :user, index: true
  end
end
