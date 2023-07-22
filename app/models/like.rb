# == Schema Information
#
# Table name: likes
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  post_id    :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_likes_on_post_id              (post_id)
#  index_likes_on_user_id              (user_id)
#  index_likes_on_user_id_and_post_id  (user_id,post_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (post_id => posts.id)
#  fk_rails_...  (user_id => users.id)
#
class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  has_one :notification, as: :notifiable, dependent: :destroy

  validates :user_id, uniqueness: { scope: :post_id }

  after_create_commit :create_notifications

  private
  
  def create_notifications
    Notification.create(notifiable: self, user_id: post.user.id, action_type: Notification.action_types[:liked_to_own_post])
  end

  def redirect_path
    "/#{post.user.id}/posts/#{post.id}"
  end

  def name
    user.name
  end
end
