class Url < ActiveRecord::Base
  belongs_to :user

  validates :target, :length => { minimum:5 }, :format => URI::regexp(%w(http https)), :presence => true
end
