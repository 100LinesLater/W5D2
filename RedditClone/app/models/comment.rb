# == Schema Information
#
# Table name: comments
#
#  id         :bigint(8)        not null, primary key
#  content    :string           not null
#  parent_id  :integer
#  post_id    :integer          not null
#  author_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Comment < ApplicationRecord

  validates :content, presence: true

  belongs_to :user,
    foreign_key: :author_id,
    class_name: :User 

  belongs_to :post 

  belongs_to :parent_comment,
    foreign_key: :parent_id,
    class_name: :Comment 
  
end
