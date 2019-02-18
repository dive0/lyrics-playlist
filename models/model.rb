# require "lyricfy"
# require 'rspotify'

# def get_lyrics(song,artist)
#     fetcher = Lyricfy::Fetcher.new
#     lyrics = fetcher.search(artist,song)
#     lyrics.body.split('\n') # array of lyrics
# end

# puts get_lyrics("Viva la vida","Coldplay")

class Song
    attr_reader :name, :artist, :album_img, :lyrics
    
    def initialize(name,artist,album_img)
        @name = name
        @artist = artist
        @album_img = album_img
    end
    
    def get_lyrics
        begin
            fetcher = Lyricfy::Fetcher.new
            lyrics = fetcher.search(@artist,@name)
            @lyrics = lyrics.body.split('\n') # array of lyrics
        rescue
            @lyrics = ['Sorry, no lyrics found.']
        end
    end
end

# youth = Song.new('Youth', 'Daughter', "http://")
# youth.get_lyrics
# puts youth.lyrics