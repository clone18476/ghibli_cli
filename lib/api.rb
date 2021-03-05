class API 

    # NOTE: all of your API methods should be class methods

    def self.fetch_films
        url = "https://ghibliapi.herokuapp.com/films/"
        uri = URI(url)
        response = Net::HTTP.get(uri)
        films_array = JSON.parse(response)

        # each hash represents a film, and we want to initialize a new drink for each hash

        # !!!! it's important that we're making objects (instances) with our api data

        # access one hash at a time to make an instance out of one hash at a time by ITERATING (as seen below)

        films_array.each do |film_hash| 
            film = Film.new # THIS IS WHERE WE MAKE A NEW 'film' INSTANCE
            film.title = film_hash["title"]  # assigning the title of the film as a part of our film object 
            film.director = film_hash["director"] # and so on, and so forth
            film.producer = film_hash["producer"]
            film.release_date = film_hash["release_date"]
            film.run_time = film_hash["running_time"]
            film.characters = film_hash["people"]
            film.species = film_hash["species"]
            film.location = film_hash["location"]
            film.vehicles = film_hash["vehicles"]
        end 

    end 

end 