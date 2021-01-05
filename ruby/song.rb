class Album
    def initialize(name,numSongs)
        @name = name
        @numberSongs = numSongs
    end

    def description
        puts "The album is #{@name} and has #{@numberSongs} songs"
    end
end

class Song < Album
    def initialize(name,duration,album,numSongs)
        super(album,numSongs)    #pass this arguments to Album
        @name = name
        @duration = duration
    end

    def descriptionSong
        puts "This song is #{@name} and lasts #{@duration}"
    end
end