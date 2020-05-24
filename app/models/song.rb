class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name 
    self.artist ? self.artist.name : nil
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    self.genre ? self.genre.name : nil
  end
 
  def notes_contents=(notes)
    notes.each do |content|
      if !content.empty?
        self.notes << Note.create(content: content)
        self.save
      end
    end
  end

  def notes_contents
    self.notes
  end

end
