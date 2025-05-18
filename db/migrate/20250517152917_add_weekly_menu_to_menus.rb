class AddWeeklyMenuToMenus < ActiveRecord::Migration[6.1]
  def change
    add_column :menus, :weekly_menu, :boolean
  end
end
