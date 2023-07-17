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
require 'rails_helper'

RSpec.describe Post, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
