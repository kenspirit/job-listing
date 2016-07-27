# == Schema Information
#
# Table name: jobs
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  wage_upper  :integer
#  wage_lower  :integer
#  contact     :string
#

class Job < ApplicationRecord
  validates :title, presence: true
  validates :wage_upper, numericality: {only_integer: true, greater_than: 0}
  validates :wage_lower, numericality: {only_integer: true, greater_than: 0}
end
