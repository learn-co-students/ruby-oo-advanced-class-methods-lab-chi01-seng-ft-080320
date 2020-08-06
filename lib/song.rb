require "pry"

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
    song.save
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
    song.save
    song ## TEST DOES NOT PASS IF THIS LINE IS REMOVED DONT UNDERSTAND WHY
  end   
  
  def self.find_by_name (name)
    self.all.find{|song| song.name == name}
  end 
  
  def self.find_or_create_by_name (name)

    if(self.find_by_name(name))
      self.find_by_name (name)
    else 
      self.create_by_name (name)
    end 
    
  end 

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end
  
  def self.new_from_filename(name)
    split_name = name.split(' - ')
    artist_name = split_name[0]
    song_name = split_name[1].split('.')[0]
    song = self.create_by_name(song_name)
    song.artist_name = artist_name
    song
  end 

  ## dont understand method difference in lab from method above
  def self.create_from_filename(name)
    self.new_from_filename(name)
  end 

  def self.destroy_all
    self.all.clear
  end 

end




song1 = Song.create_by_name("charlie")
song2 = Song.create_by_name("pao")
song3 = Song.create_by_name ("aaaaa")

# binding.pry