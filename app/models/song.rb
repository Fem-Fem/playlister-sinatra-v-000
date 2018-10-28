class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  def slug
    Helper.slug(self.name)
  end

  def self.find_by_slug(slug)
    string = Helper.find_by_slug(slug)
    Song.find_by(name: string)
  end
end
