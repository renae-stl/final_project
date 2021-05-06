require_relative 'tile'

class TargetBoard
    def initialize()
        #@size = 5
        @tiles = [
            Tile.new(0,0, 'red'),
            Tile.new(0,1, 'blue'),
            Tile.new(0,2, 'blue'),
            Tile.new(0,3, 'yellow'),
            Tile.new(1,0, 'green'),
            Tile.new(1,1, 'blue'),
            Tile.new(1,2, 'green'),
            Tile.new(1,3, 'red'),
            Tile.new(2,0, 'blue'),
            Tile.new(2,1, 'green'),
            Tile.new(2,2, 'yellow'),
            Tile.new(2,3, 'green'),
            Tile.new(3,0, 'red'),
            Tile.new(3,1, 'red'),
            Tile.new(3,2, 'red'),
            Tile.new(3,3, 'blue'),
            #Tile.new(0,0, blue),
            #Tile.new(0,0, blue),
            #Tile.new(0,0, blue),
            #Tile.new(0,0, blue),
            #Tile.new(0,0, blue),
            #Tile.new(0,0, blue),
            #Tile.new(0,0, blue),
            #Tile.new(0,0, blue),
            #Tile.new(0,0, blue)
        ]
    
    end

    def show_board()
        puts @tiles
    end

    def shuffle_board()
        x_coordinates = [0, 1, 2, 3]
        y_coordinates = [0, 1, 2, 3]
        color = ['red', 'blue', 'yellow', 'green']

        @tiles = []

        @tiles.push (for x in x_coordinates.each do 
            Tile.new(
                (x),(0),(color.sample)
            )
            Tile.new(
                (x),(1),(color.sample)
            )
            Tile.new(
                (x),(2),(color.sample)
            )
            Tile.new(
                (x),(3),(color.sample)
            )
        end)
        
    end

end