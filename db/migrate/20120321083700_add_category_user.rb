class AddCategoryUser < ActiveRecord::Migration
  def self.up
    create_table :categories_users, :id => false do |t|
      t.integer :category_id
      t.integer :user_id
    end
  end

  def self.down
    drop_table :categories_users
  end 
end
# CREATE TABLE `categories_users` (
#   `category_id` int(11) DEFAULT NULL,
#   `user_id` int(11) DEFAULT NULL,
#   KEY `index_categories_users_on_user_id` (`user_id`)
# ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

# INSERT INTO `categories_users` (`category_id`, `user_id`)
# VALUES
# 	(1, 1),
# 	(2, 1),
# 	(1, 6),
# 	(1, 7),
# 	(1, 8),
# 	(1, 9),
# 	(1, 10),
# 	(1, 11),
# 	(1, 12),
# 	(1, 13),
# 	(1, 14),
# 	(1, 15);