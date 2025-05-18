class ChangeWeeklyMenuDefault < ActiveRecord::Migration[6.1]
  def change
    change_column_default :menus, :weekly_menu, false
    Menu.where(weekly_menu: nil).update_all(weekly_menu: false) # NULL のデータを false に更新
  end
end