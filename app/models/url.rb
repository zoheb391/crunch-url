class Url < ActiveRecord::Base
  belongs_to :user

  validates :target, :length => { minimum:5 }, :format => URI::regexp(%w(http https)), :presence => true
  validates :target, :uniqueness => true
  before_create :create_shortcut

  def create_shortcut
    self.shortcut = "abcde"
  end

end
