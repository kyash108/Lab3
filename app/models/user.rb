# == Schema Information
#
# Table name: users
#
#  id             :integer          not null, primary key
#  first_name     :string
#  last_name      :string
#  email          :string
#  street_address :string
#  city           :string
#  province       :string
#  postal_code    :string
#  country        :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class User < ApplicationRecord
  #relationships
  has_many :microposts, dependent: :destroy

  #validations
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
end
