class UserSet
  extend ActiveModel::Naming
  include ActiveModel::Conversion

  attr_accessor :users

  def users_attributes=(attributes)
    # I'm tricking "fields_for" here.
    # This should never actually be called
    raise
  end

  def make_some_posts
    self.users.each {|user| user.posts.build}
  end

  # Strip fields_for indexes and return an array
  def self.users_from(user_set_hash)
    user_set_hash[:users_attributes].values
  end

  def persisted?
    false
  end
end
