class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |p|
      p.string :title
      p.string :content
      p.string :key
      p.belongs_to :category
    end
  end
end
