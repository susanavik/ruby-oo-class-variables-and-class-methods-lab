class Song
    attr_accessor :name, :artist, :genre

    @@artists = []
    @@genres = []
    @@count = 0

    def initialize(name, artist, genre)
        @name = name
        @artist = artist
        @genre = genre 
        @@count += 1
        @@artists << self.artist
        @@genres << self.genre
    end

    def self.count
        @@count
    end

    def self.artists
        @@artists.uniq
    end

    def self.genres
        @@genres.uniq
    end

    def self.genre_count
        @@genre_count = {}
        @@genres.group_by(&:itself).each { |genre, song| @@genre_count[genre] = song.count} 
        return @@genre_count
    end

    def self.artist_count
        @@artist_count = {}
        @@artists.group_by(&:itself).each { |artist, song| @@artist_count[artist] = song.count} 
        return @@artist_count
    end
end