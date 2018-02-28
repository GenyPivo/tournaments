class AddTableTournamentParticipants < ActiveRecord::Migration[5.1]
  def change
    create_table :tournament_participants do |t|
      t.belongs_to :team, index: true
      t.belongs_to :tournament, index: true
    end
  end
end
