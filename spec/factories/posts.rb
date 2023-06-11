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
FactoryBot.define do
  factory :post do
    word { "MyText" }
    image { "MyString" }
    episode { "MyText" }
    partners_word { "MyText" }
    user { nil }
  end
end
