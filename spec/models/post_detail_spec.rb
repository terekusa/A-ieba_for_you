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
require 'rails_helper'

RSpec.describe PostDetail, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
