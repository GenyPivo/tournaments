class Team < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :tournaments, join_table: :tournament_participants
  validates :name, uniqueness: true, presence: true

  has_attached_file :logo, styles: { medium: "200x200>"}, default_url: "/assets/missing.png"
  validates_attachment_content_type :logo, content_type: /\Aimage\/.*\z/
end
