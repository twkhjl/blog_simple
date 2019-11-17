class Article < ActiveRecord::Base
  has_many :comments

  validates :title, 
  presence: true,
  length: {
    minimum:5,
    blank: :en_article_title_blank,
    too_short: :en_article_title_too_short
  }

  validates :text, 
  presence: true
end
