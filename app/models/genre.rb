class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs


  def slug
    Helper.slug(self.name)
  end

  def self.find_by_slug(slug)
    string = Helper.find_by_slug(slug)
    Genre.find_by(name: string)
  end
end
