class Film
    attr_accessor :title , :description, :director, :producer, :release_date, :run_time, :characters, :species, :location, :vehicles
        
    @@all = []  # how we are going to access all of the nested hashes from the film instance


    def initialize 
        @@all << self # this is where we add @ instances to the @@all array
    end 

    # def initialize(attr_hash)
    #     attr_hash.each do |k, v| 
    #         self.send("#{k}=", v) if self.respond.to?("#{k}=")
    #     end 
    #     save 
    # end 
# 
    # def save 
    #     @@all << self 
    # end 

    def self.all #this allows us to access @@all from inside our API class (or theoretically any other class)
        @@all 
    end 

    def self.find_by_name(name)
        self.all.select do |film| 
            film.name == name 
        end 
    end  
end  
