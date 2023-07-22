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
require 'rails_helper'

RSpec.describe Notification, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
