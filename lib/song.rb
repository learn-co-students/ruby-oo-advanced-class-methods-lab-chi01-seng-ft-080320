class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    if !Song.all.include?(song)
      song.save
    end
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name 
    if !Song.all.include?(song)
      song.save 
    end
    song
  end

  def self.find_by_name(name)
    Song.all.find do |song|
      song.name == name
    end
  end

  def self.find_or_create_by_name(name)
    if !Song.find_by_name(name)
        Song.create_by_name(name)
    else 
        Song.find_by_name(name)
    end
  end

  def self.alphabetical
    Song.all.sort_by {|song| [song.name]}
  end

  def self.new_from_filename(filename)
    song = self.new 
    split = filename.split(" - ")
    song_name = split[1].delete_suffix(".mp3")
    artist_name = song.artist_name = split[0]

    song.name = song_name
    song.artist_name = artist_name 
    song
  end

  def self.create_from_filename(filename)
    song = self.new 
    split = filename.split(" - ")
    song_name = split[1].delete_suffix(".mp3")
    artist_name = song.artist_name = split[0]

    song.name = song_name
    song.artist_name = artist_name 

    if !Song.all.include?(song)
      song.save 
    end
    song
  end

  def self.destroy_all
    @@all.clear
  end
end
