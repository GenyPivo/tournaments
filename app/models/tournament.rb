class Tournament < ApplicationRecord
  has_and_belongs_to_many :teams, -> { distinct }, join_table: :tournament_participants
end
