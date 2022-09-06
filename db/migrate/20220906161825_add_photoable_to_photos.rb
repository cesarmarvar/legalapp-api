class AddPhotoableToPhotos < ActiveRecord::Migration[7.0]
  def change
    add_reference :photos, :photoable, polymorphic: true, null: false
  end
end
