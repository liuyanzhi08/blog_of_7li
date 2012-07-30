class Notice < ActiveRecord::Base
  attr_accessible :comment_blog_id, :comment_floor
  belongs_to :user
  belongs_to :comment
end
