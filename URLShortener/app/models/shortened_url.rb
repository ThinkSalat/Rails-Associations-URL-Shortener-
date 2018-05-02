# == Schema Information
#
# Table name: shortened_urls
#
#  id        :bigint(8)        not null, primary key
#  long_url  :string           not null
#  short_url :string           not null
#  user_id   :integer          not null
#

class ShortenedUrl < ApplicationRecord
  validates :user_id, :long_url, :short_url, presence: true
  validates :short_url, uniqueness: true
  
  belongs_to :submitter,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: 'User'
    
  has_many :visits,
    primary_key: :id,
    foreign_key: :shortened_url_id,
    class_name: 'Visit'
    
  has_many :visitors,
    through: :visits,
    source: :users
    
  def self.random_code
    code = SecureRandom::urlsafe_base64 
    code = SecureRandom::urlsafe_base64 until !ShortenedUrl.exists?(short_url: code)
    code
  end
  
  def self.generate_code(user,long_url)
    code = ShortenedUrl.random_code
    url = ShortenedUrl.new(long_url: long_url, short_url: 'www.shawnandryansshorturlsextravaganza.com/' + code, user_id: user.id)
    url.save!
  end
  
  def num_clicks
  end
  
  def num_uniques
  end
  
  def num_recent_uniques
  end
    
end
