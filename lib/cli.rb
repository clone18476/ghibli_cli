class CLI 

    # THIS is where we will interact with out user, use 'puts' and 'gets' statements here, 
    # this brings us into another menu (api) that helps define the logic
    # NO 'puts' statements anywhere else in your project

    def start # since this is an instance method we call it by first creating an instance
        puts ""
        puts "Welcome!"
        sleep(0.5)
        API.fetch_films #this is how we use the class method 'fetch_films' in the API class FROM any other class
        self.menu 
    end 

    def menu 
        puts ""
        puts "Would you like to see a list of films?"
        sleep(0.75)
        puts "Type 'yes' or 'y' to continue, or any other key to exit."
        puts ""
        user_input = gets.strip.downcase  
        # NOTE!!! we CANNOT use the above LOCAL VARIABLE to get user input for other methods
            # we only have access to local variables from within the method's they are in

        # if the user says yes:
        # counter = 0
        # if counter == 0 
        #     puts "welcome, see a list" 
        #     counter += 1 
        # else 
        #     puts "Would you like to see another film?"
        # end 
        if user_input == "yes" || user_input == "y" 
            puts ""
            puts "Good choice!"
            puts ""
            sleep(1)
            # display the list 
            display_list_of_films
            sleep(1)
            ask_user_for_film_choice
            sleep(1) 
            menu 
        else 
            puts "Goodbye"
        end 

    end 

    def display_list_of_films
        # Access all the films, print each one out with index numbers 
        Film.all.each.with_index(1) do |film, index| 
            puts "#{index}. #{film.title}"  
             # film is the ENTIRE object, 
             # we can't just print out an instance of film, we need to grab some sort of attribute of the film
        end 
    end 

    def ask_user_for_film_choice
        puts ""
        puts "Enter the number of the film you'd like to know more about"
        puts ""
        index = gets.strip.to_i - 1
        
        # index valid? number between 0 and max number of films
        until index.between?(0, Film.all.length) # - 1 
            puts "Sorry, invalid input. Choose a valid number"
            index = gets.strip.to_i - 1
        end 

        film_instance = Film.all[index]
        display_film_details(film_instance)
    end 

    def display_film_details(film)
        sleep(1)
        puts ""
        puts film.title 
        puts ""
        puts "Director: #{film.director}"
        puts "Producer: #{film.producer}" 
        puts "Release Date: #{film.release_date}" 
        puts "Run Time: #{film.run_time} minutes"
        # puts "Characters: #{film.characters}"
        # puts "Species: #{film.species}"
        # puts "Location: #{film.location}"
        # puts "Vehicles: #{film.vehicles}"
    end 

end 