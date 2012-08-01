class Reader < ActiveRecord::Base
  attr_accessible :blog_id, :ip
  belongs_to :blog
end
