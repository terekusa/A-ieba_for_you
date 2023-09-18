# == Schema Information
#
# Table name: notifications
#
#  id              :bigint           not null, primary key
#  action_type     :integer          not null
#  check           :boolean          default(FALSE), not null
#  notifiable_type :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  notifiable_id   :bigint
#  user_id         :bigint
#
# Indexes
#
#  index_notifications_on_notifiable  (notifiable_type,notifiable_id)
#  index_notifications_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Notification < ApplicationRecord
  belongs_to :notifiable, polymorphic: true
  belongs_to :user

  include Rails.application.routes.url_helpers

  enum action_type: {
    commented_to_own_post: 0,
    liked_to_own_post: 1
  }
end
