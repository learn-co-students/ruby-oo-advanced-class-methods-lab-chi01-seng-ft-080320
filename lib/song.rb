class Song
  attr_accessor :name, :artist_name

  @@all = []

  def self.all
    @@all
  end

  def self.create
    song = self.new
    if !Song.all.include?(song)
      song.save
    end
    song
  end

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = self.new
    song.name = song_name
    if !Song.all.include?(song)
      song.save
      end
      song
    end

    def self.find_by_name(song_name)
    
    Song.all.find do |songs|
      songs.name == song_name 
    end
  end

  def self.find_or_create_by_name(song_name)
    if !Song.find_by_name(song_name)
      Song.create_by_name(song_name)
    else
      Song.find_by_name(song_name)
    end
  end

  def self.alphabetical
    Song.all.sort_by {|song| [song.name]}
  end

  def self.new_from_filename(file_name)
    song = self.new 
    split_file = file_name.split(" - ")
    song_name = split_file[1].delete_suffix(".mp3")
    artist_name = song.artist_name = split_file[0]

    song.name = song_name
    song.artist_name = artist_name 
    song 
  end

  def self.create_from_filename(file_name)
    song = self.new 
    split_file = file_name.split(" - ")
    song_name = split_file[1].delete_suffix(".mp3")
    artist_name = song.artist_name = split_file[0]

    song.name = song_name
    song.artist_name = artist_name

    if !Song.all.include?(song)
      song.save 
    end
    song
  end 

  def self.destroy_all
    @@all = []
  end 
  
  def save
    self.class.all << self
  end

end

