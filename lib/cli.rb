class CLI 

    # THIS is where we will interact with out user, use 'puts' and 'gets' statements here, 
    # this brings us into another menu (api) that helps define the logic
    # NO 'puts' statements anywhere else in your project

    def start 
        puts "welcome"
        # this is an instance method, so we call it by first creating an instance
        API.fetch_films #this is how we use the class method 'fetch_films' in API from the CLI class
        self.menu 
    end 

    def menu 
        # give user the option to see list of films 
        puts "Would you like to see a list of films?"
        puts "Type 'yes' or 'y' to continue, or any other key to exit."

        user_input = gets.strip.downcase  # we CANNOT use this LOCAL VARIABLE to get user input for other methods
                                            # we only have access to local variables from within the method's they are in
        # if the user says yes
        
        # counter = 0
        # if counter == 0 
        #     puts "welcome, see a list" 
        #     counter += 1 
        # else 
        #     puts "Would you like to see another film?"
        # end 

        if user_input == "yes" || user_input == "y" 
            puts "Good choice!"
            # display the list 
            display_list_of_films
            ask_user_for_film_choice

            sleep(1) 

            menu 
        else 
            puts "Goodbye"
        end 

    end 

    def display_list_of_films
        puts "aaaaa"
        # Access all the films
        # binding.pry  
        # print each one out 
        Film.all.each.with_index(1) do |film, index|    # this gives us index numbers 
            puts "#{index}. #{film.title}"  
             # film is the ENTIRE object, we can't just print out an instance, we need to grab some sort of attribute
        end 

    end 

    def ask_user_for_film_choice
        # ask user for choice 
        puts "Enter the number of the film you'd like to know more about"
        index = gets.strip.to_i - 1
        
        # index valid? number between 0 and uhh? 
        until index.between?(0, Film.all.length) # - 1 

            puts "Sorry, invalid input. Choose a valid number"
            index = gets.strip.to_i - 1
        end 

        film_instance = Film.all[index]
        
        display_film_details(film_instance)
    end 

    def display_film_details(film)
        sleep(1)
        puts film.title 
        puts "Director: #{film.director}"
        puts "Producer: #{film.producer}" 
        puts "Release Date: #{film.release_date}" 
        puts "Run Time: #{film.run_time}"
        puts "Characters: #{film.characters}"
        puts "Species: #{film.species}"
        puts "Location: #{film.location}"
        puts "Vehicles: #{film.vehicles}"
    end 

end 