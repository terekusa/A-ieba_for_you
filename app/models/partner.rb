# == Schema Information
#
# Table name: post_details
#
#  id         :bigint           not null, primary key
#  name       :string
#  type       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Partner < PostDetail
  has_many :post
end
