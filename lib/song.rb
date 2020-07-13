require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def Song.create
    song = self.new
    song.save
    song
  end

  def Song.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def Song.create_by_name(name)
    song = self.new
    song.name = name
    song.save
    song
  end

  def Song.find_by_name(name)
    @@all.find {|song| song.name == name}
  end

  def Song.find_or_create_by_name(name)
    if  self.find_by_name(name) == nil
    self.create_by_name(name)
    else
      existing_song = @@all.find {|song| song.name == name}
      existing_song
    end
  end

  def Song.alphabetical
  songs_alphabetical = @@all.sort_by {|song| song.alphabetical}
  songs_alphabetical
  end

end
