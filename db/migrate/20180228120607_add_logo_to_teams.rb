class AddLogoToTeams < ActiveRecord::Migration[5.1]
  def up
    add_attachment :teams, :logo
  end

  def down
    remove_attachment :teams, :logo
  end
end
