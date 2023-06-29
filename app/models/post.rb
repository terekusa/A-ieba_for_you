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

  has_many :likes, dependent: :destroy
  has_many :like_users, through: :likes, source: :user

  validates :word, presence: true, length: { maximum: 65_535 }
  validates :episode, length: { maximum: 65_535 }
  validates :partners_word, presence: true, length: { maximum: 65_535 }
end
