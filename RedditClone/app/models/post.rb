# == Schema Information
#
# Table name: posts
#
#  id         :bigint(8)        not null, primary key
#  title      :string           not null
#  url        :string
#  content    :string
#  sub_id     :integer          not null
#  author     :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ApplicationRecord

  validates :title, presence: true
    
  belongs_to :user,
    foreign_key: :author,
    class_name: :User 

  has_many :post_subs, 
    foreign_key: :post_id, 
    class_name: :PostSub,
    inverse_of: :post

  has_many :subs,
    through: :post_subs,
    source: :sub
  
end
