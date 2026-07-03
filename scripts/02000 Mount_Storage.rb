module GamePlay

    class PokemonStorage
    
        alias default_move_pokemon move_pokemon

        # adds functionality to check if the player is mounted on the selected Pokemon
        # if so, displays a message and prevents the move
        def move_pokemon
            if $game_player.mounted && $game_player.mounted_pokemon == @current_pokemon
                $scene.display_message(parse_text(96, 3))
                @selection.clear
                refresh
            else
                default_move_pokemon
            end
        end

    end
end