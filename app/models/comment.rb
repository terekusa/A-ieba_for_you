# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  body       :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  post_id    :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_comments_on_post_id  (post_id)
#  index_comments_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (post_id => posts.id)
#  fk_rails_...  (user_id => users.id)
#
class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  has_one :notification, as: :notifiable, dependent: :destroy

  validates :body, presence: true, length: { maximum: 65_535 }

  after_create_commit :create_notifications

  private
  
  def create_notifications
    Notification.create(notifiable: self, user_id: post.user.id, action_type: Notification.action_types[:commented_to_own_post])
  end

  def redirect_path
    "/#{post.user.id}/posts/#{post.id}"
  end

  def name
    user.name
  end
end
