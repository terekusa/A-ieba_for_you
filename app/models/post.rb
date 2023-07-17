# == Schema Information
#
# Table name: posts
#
#  id            :bigint           not null, primary key
#  episode       :text
#  image         :string
#  partners_word :text             not null
#  word          :text             not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  user_id       :bigint           not null
#
# Indexes
#
#  index_posts_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Post < ApplicationRecord
  belongs_to :user
  belongs_to :genre
  belongs_to :partner
  belongs_to :situation
  has_many :comments, dependent: :destroy

  has_many :likes, dependent: :destroy
  has_many :like_users, through: :likes, source: :user

  #has_many :post_details, dependent: :destroy
  #has_many :genres, dependent: :destroy
  #has_many :partners, dependent: :destroy
  #has_many :situations, dependent: :destroy

  validates :word, presence: true, length: { maximum: 255 }
  validates :episode, length: { maximum: 65_535 }
  validates :partners_word, presence: true, length: { maximum: 255 }

  def self.ransackable_associations(auth_object = nil)
    ["genre", "partner", "situation"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["word", "partners_word", "episode"]
  end

end
