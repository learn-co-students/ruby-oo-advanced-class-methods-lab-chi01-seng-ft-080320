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
    song = Song.new
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = Song.new
    song.name = name
    @@all << song
    song
  end

  def self.find_by_name(name)
    self.all.find do |song_instance|
      song_instance.name == name
    end
  end

  def self.find_or_create_by_name(name)
   if !self.find_by_name(name)
    self.create_by_name(name)
   else
    self.find_by_name(name)
   end
  end

  def self.alphabetical
    self.all.sort_by do |song_instance|
      song_instance.name
    end
  end

  def self.new_from_filename(filename)
    split_name = filename.split(' - ')
    artist_name = split_name[0]
    song_name = split_name[1].delete_suffix('.mp3')

    song = self.create_by_name(song_name)
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename)
  end

  def self.destroy_all
    self.all.clear
  end


end