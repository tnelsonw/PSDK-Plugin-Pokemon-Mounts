class Interpreter

    def use_mount_saddle
        log_info("in function mount_saddle")
        unless $game_player.mounted
            call_party_menu(::Yuki::Var::Party_Menu_Sel, $actors, :map)#, { mode: :mount_saddle, on_select: proc { |pokemon| $game_player.mount(pokemon) } })
            if $game_variables[Yuki::Var::Party_Menu_Sel] != -1
                pokemon = $actors[$game_variables[Yuki::Var::Party_Menu_Sel]]
                $game_player.mount(pokemon)
            end
        else
            $game_player.dismount($game_player.mounted_pokemon)
        end

    end

end
