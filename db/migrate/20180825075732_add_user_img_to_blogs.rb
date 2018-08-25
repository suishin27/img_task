class AddUserImgToBlogs < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :user_img, :text
  end
end
