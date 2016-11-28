class Url < ActiveRecord::Base
  belongs_to :user

  validates :target, :length => { minimum:5 }, :format => URI::regexp(%w(http https)), :presence => true
  after_create :create_shortcut

  def create_shortcut
    update_attribute(:shortcut, self.id.to_s(36))
  end

end
  