# require "lyricfy"
# require 'rspotify'
require 'pp'

RSpotify.authenticate("13777d47d2c941dab342071d9493d1bd", "fce82e12c6b647da9c3d4da9f5d52c54")

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

playlist = RSpotify::Playlist.find('guilhermesad', '1Xi8mgiuHHPLQYOw2Q16xv')
# pp playlist.tracks.first
puts playlist.tracks.first.name
puts playlist.tracks.first.artists.first.name
puts playlist.tracks.first.album.images.first['url']


class Playlist
    attr_reader :user, :playlist_id, :name, :songs
    
    def initialize(user, playlist_id)
        @user = user
        @playlist_id = playlist_id
        @songs = []
    end
    
    def get_info
        playlist = RSpotify::Playlist.find(@user,@playlist_id)
        @name = playlist.name
        
        playlist.tracks.each do |track|
            @songs << Song.new(track.name,track.artists.first.name,track.album.images.first['url'])
        end
    end
    
    def get_all_lyrics
        @songs.each do |song|
            song.get_lyrics
        end
    end
end

# relaxing = Playlist.new('andrecrins', '6kNFsowoFSQRwDJu1cgIct')