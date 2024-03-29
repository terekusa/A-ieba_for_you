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
#  genre_id      :bigint
#  partner_id    :bigint
#  situation_id  :bigint
#  user_id       :bigint           not null
#
# Indexes
#
#  index_posts_on_genre_id      (genre_id)
#  index_posts_on_partner_id    (partner_id)
#  index_posts_on_situation_id  (situation_id)
#  index_posts_on_user_id       (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Post < ApplicationRecord
  mount_uploader :image, PostImageUploader

  belongs_to :user
  belongs_to :genre
  belongs_to :partner
  belongs_to :situation
  has_many :comments, dependent: :destroy

  has_many :likes, dependent: :destroy
  has_many :like_users, through: :likes, source: :user

  validates :word, presence: true, length: { maximum: 255 }
  validates :episode, length: { maximum: 65_535 }
  validates :partners_word, presence: true, length: { maximum: 255 }

  def self.ransackable_associations(auth_object = nil)
    %w[genre partner situation]
  end

  def self.ransackable_attributes(auth_object = nil)
    %w[word partners_word episode]
  end
end
