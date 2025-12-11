# == Schema Information
#
# Table name: members
#
#  id   :bigint           not null, primary key
#  name :string(255)      not null
#
class Member < ApplicationRecord
  validates :name, presence: true
end
