class Team < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :tournaments, -> { distinct }, join_table: :tournament_participants
  validates :name, uniqueness: true

  has_attached_file :logo, styles: { medium: "200x200>"}, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :logo, content_type: /\Aimage\/.*\z/
end
