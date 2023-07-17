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
FactoryBot.define do
  factory :post_detail do
    detailable_id { "MyString" }
    detailable_type { "MyString" }
    name { "MyString" }
  end
end
