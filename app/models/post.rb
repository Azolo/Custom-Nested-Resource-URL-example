class Post < ActiveRecord::Base
  before_save :set_next_user_post_id
  belongs_to :user
  
  validates :user_post_id, :uniqueness => {:scope => :user_id}

  def to_param
    self.user_post_id.to_s
  end

private
  def set_next_user_post_id
    self.user_post_id ||= get_new_user_post_id
  end

  def get_new_user_post_id
    user = self.user
    max = user.posts.maximum('user_post_id') || 0
    max + 1
  end
end
