# == Schema Information
#
# Table name: visits
#
#  id               :bigint(8)        not null, primary key
#  user_id          :integer          not null
#  shortened_url_id :integer          not null
#

class Visit < ApplicationRecord
  validates :user_id, :shortened_url_id, presence: true
  
  belongs_to :users,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: 'User'
    
  belongs_to :shortened_urls,
    primary_key: :id,
    foreign_key: :shortened_url_id,
    class_name: 'ShortenedUrl'
    
  
  def self.record_visit!(user, shortened_url)
    visit = Visit.new(user_id: user.id, shortened_url_id: shortened_url.id)
    visit.save!
  end
  
end
