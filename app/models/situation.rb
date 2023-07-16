# == Schema Information
#
# Table name: post_details
#
#  id              :bigint           not null, primary key
#  detailable_type :string
#  name            :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  detailable_id   :string
#
class Situation < PostDetail
end
