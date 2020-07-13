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
  songs_alphabetical = @@all.sort_by {|song| song.name}
  songs_alphabetical
  end

  def Song.new_from_filename(filename)
    new_song = filename.split(/[^(\w|\s)]/)
  #  new_song_properties = new_song.collect do |property|
      name = new_song[1].split.join(" ")
      artist_name = new_song[0].split.join
      song = Song.new
      song.name = name
      song.artist_name= artist_name
  #    binding.pry
  #  end
  #  new_song_properties
    end

end
