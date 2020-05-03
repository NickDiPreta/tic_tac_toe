class String
    def red;            "\e[31m#{self}\e[0m" end
    def brown;          "\e[33m#{self}\e[0m" end
    def magenta;        "\e[35m#{self}\e[0m" end
  end


class Game
    attr_accessor :row_one, :row_two, :row_three, :game_over, :grid_array, :filled_cells
      def initialize()
        @grid_array = Array.new(10) {|i| (i+1).to_s} 
        @row_one = @grid_array[0,3]
        @row_two = @grid_array[3,3]
        @row_three = @grid_array[6,3]
        @game_over = false
        @filled_cells = []
      end
    
      #Display's greeting message with brown font. 
      #Displays grid in start state. 
      #Then advances to game state method.
      def start_game
        puts "\nGreetings humans. Let's play a game of Tic Tac Toe.".brown
        puts "---------------------------------------------------"
        self.display_grid
        puts "---------------------------------------------------"
        self.game_state
      end
      
      #While the game over instance variable is false, allows player 1 and player 2 to input.
      def game_state
        while game_over==false
            puts "\nPlayer 1 to play.".red
            self.choose_letter('X'.red)
                if game_over == true
                    puts "Player 1 is victorious!".red
                end
            if game_over == false
            puts "\nPlayer 2 to play.".magenta
            self.choose_letter('O'.magenta)
                if game_over == true
                    puts "Player 2 is victorious!".magenta
                end
            end
        end
      end

      def display_grid
        puts " #{row_one[0]} | #{row_one[1]} | #{row_one[2]} "
        puts "-----------"
        puts " #{row_two[0]} | #{row_two[1]} | #{row_two[2]} "
        puts "-----------"
        puts " #{row_three[0]} | #{row_three[1]} | #{row_three[2]} "
      end

      #gets letter input from default values for player 1 and player 2. 
      #Allows them to pick the cell of their choice on the grid.
      #If cell is already filled, will get another cell from input.
      def choose_letter(letter)
        if @filled_cells.length == 9
          puts "Tie game!"
        end
        puts "What cell will you play?".brown
        cell = gets.chomp.to_i
        if @filled_cells.include?(cell)
          while @filled_cells.include?(cell)
          puts "Invalid choice. Try again...noob."
          cell = gets.chomp.to_i
          end
        end
        if cell < 4
          @row_one[cell-1] = letter
          @filled_cells.push(cell)
        elsif cell < 7
          @row_two[cell-4] = letter
          @filled_cells.push(cell)
        else
          @row_three[cell-7] = letter
          @filled_cells.push(cell)
        end
    
        self.display_grid
        self.check_for_win
      end
    
    def check_for_win
        #check for row wins
        if @row_one[0] == @row_one[1] && @row_one[0] == @row_one[2]
          @game_over = true  
          puts "Game over!"
        elsif @row_two[0] == @row_two[1] && @row_two[0] == @row_two[2]
            @game_over = true  
          puts "Game over!"
        elsif @row_three[0] == @row_three[1] && @row_three[0] == @row_three[2]
            @game_over = true  
          puts "Game over!"
        #check for column wins
        elsif @row_one[0] == @row_two[0] && row_one[0] == row_three[0]
            @game_over = true  
            puts "Game over!"
        elsif @row_one[1] == @row_two[1] && row_one[1] == row_three[1]
            @game_over = true  
            puts "Game over!"
        elsif @row_one[2] == @row_two[2] && row_one[2] == row_three[2]
            @game_over = true  
            puts "Game over!"
        #check for diagonal wins
        elsif @row_one[0] == @row_two[1] && row_two[1] == row_three[2]
            @game_over = true  
            puts "Game over!"
        elsif @row_one[2] == row_two[1] && row_two[1] == row_three[2]
            @game_over = true  
            puts "Game over!"
        else
          puts "No Winner Yet"
        end
      end
    end
    
   
    Game.new().start_game

   
    
    
