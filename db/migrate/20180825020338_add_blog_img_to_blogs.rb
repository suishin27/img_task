class AddBlogImgToBlogs < ActiveRecord::Migration[5.1]
  def change
    add_column :blogs, :blog_img, :text
  end
end
