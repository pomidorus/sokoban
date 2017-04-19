# Sokoban
http://rubyquiz.com/quiz5.html

`ruby game.rb`

Let's view help

````
> help
`help` - Shows this help message
`view map` - View map of the game
`man position` - View man position in the game
`man up` - Move man up
`man down` - Move man down
`man left` - Move man left
`man right` - Move man right
````

Let's view map of current level

````
> view map
    #####
    #   #
    #o  #
  ###  o##
  #  o o #
### # ## #   ######
#   # ## #####  ..#
# o  o          ..#
##### ### #@##  ..#
    #     #########
    #######
````

Let's view man position

````
> man position
   
#@#
###
````

Let's move man up

````
> man up
Man moved up
> view map
    #####
    #   #
    #o  #
  ###  o##
  #  o o #
### # ## #   ######
#   # ## #####  ..#
# o  o     @    ..#
##### ### # ##  ..#
    #     #########
    #######
````

Let's move man left

````
> man left
Man moved left
> view map
    #####
    #   #
    #o  #
  ###  o##
  #  o o #
### # ## #   ######
#   # ## #####  ..#
# o  o    @     ..#
##### ### # ##  ..#
    #     #########
    #######
````

Let's type unknown command

````
> test
Command not found. Type `help` for usage instructions
````

## Application structure

The app has modular structure based on command pattern. You can easily add new command or remove existing. Or have different behaviour of the same command for different objects.

All data are stored in the text file. Every step of the man are stored in their own text file. So you can easily rollback to any step. Commands reads file, execute code and save results back.

All string constants placed in the `sokoban_strings.rb` for simple use and modification.

## Models

App has nine models:

- `crate`, `man`, `open_floor`, `storage`, `wall` - models represents objects in the map. Their parent class is `map_object`
- `sokoban_map` - model represents map. Contains all map objects
- `null_object` - null pattern for `map_object`

## Services

App has seven services

- `commands_parser` - service for parse commands
- `commands_executor` - service for match and execute commands
- `man_position_mover` - service for update position of man and save the map
- `man_position_viewer` - service for view area near man position
- `map_parser` - parse objects presentation in map
- `map_viewer` - view map in the console
- `sokoban_reader` - read data from text file to map object

## Data

Each step are stored in their own text file. Current step are stored in the `game_stats.txt`

````
19 11 (1)
    #####
    #   #
    #o  #
  ###  o##
  #  o o #
### # ## #   ######
#   # ## #####  ..#
# o  o          ..#
##### ### #@##  ..#
    #     #########
    #######
````

(1) - width and height of the map

## Tests

I use TDD process & manual execution when developing this application. Test coverage is not 100%, but at least it cover major critical functionality

````
Testing started at 19:36 ...
Work directory: /home/terminator/dev/sokoban
Loading files.... 
=========================================
1. /home/terminator/dev/sokoban/test/services/test_commands_parser.rb:1
2. /home/terminator/dev/sokoban/test/test_helper.rb:1
3. /home/terminator/dev/sokoban/test/models/test_open_floor.rb:1
4. /home/terminator/dev/sokoban/test/models/test_storage.rb:1
5. /home/terminator/dev/sokoban/test/models/test_man.rb:1
6. /home/terminator/dev/sokoban/test/models/test_position.rb:1
7. /home/terminator/dev/sokoban/test/models/test_wall.rb:1
8. /home/terminator/dev/sokoban/test/models/test_crate.rb:1
 
8 files were loaded.
=========================================
Running tests...
Started

Finished in 0.00271s
11 tests, 12 assertions, 0 failures, 0 errors, 0 skips
````
