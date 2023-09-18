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
class Genre < PostDetail
  has_many :posts, dependent: :destroy

  def self.ransackable_attributes(auth_object = nil)
    %w[id type name]
  end
end
