class Film
    attr_accessor :title , :description, :director, :producer, :release_date, :run_time, :characters, :species, :location, :vehicles
        
    @@all = []  # how we are going to access all of the nested hashes from the film instance


    def initialize 
        @@all << self # this is where we add @ instances to the @@all array
    end 

    def self.all #this allows us to access @@all from inside our API class (or theoretically any other class)
        @@all 
    end 

end  
