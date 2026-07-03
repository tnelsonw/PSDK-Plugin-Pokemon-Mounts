module PartyMenuMountExtension

    # Overrides the original show_menu_mode_choice method to add mount/dismount options to the party menu.
    # essentially, I just copied the existing method show_menu_mode_choice but added in the mount/dismount part.
    # Yes, there is probably a better way to code this. 
    # @author tnelsonw
    def show_menu_mode_choice
        show_black_frame
        pokemon = @party[@index]
        choices = PFM::Choice_Helper.new(Yuki::ChoiceWindow::But, true, 999)

        # keep the original behavior
        unless pokemon.egg?
            pokemon.skills_set.each_with_index do |skill, i|
                if skill && (skill.map_use > 0 || PFM::SKILL_PROCESS[skill.db_symbol])
                    choices.register_choice(skill.name, i, on_validate: method(:use_pokemon_skill), color: skill_color)
                end
            end
        end
        choices.register_choice(text_get(23, 4), on_validate: method(:launch_summary)).register_choice(text_get(23, 8), on_validate: method(:action_move_current_pokemon), disable_detect: proc {@party.size <= 1 })
        unless pokemon.egg?
            if $game_switches[Yuki::Sw::BT_Party_Menu_Reminder]
                choices.register_choice(ext_text(9009, 0), on_validate: method(:launch_reminder), disable_detect: proc {pokemon.remindable_skills == [] })
            end
            if Yuki::FollowMe.in_lets_go_mode?
                if $storage.lets_go_follower == pokemon
                    choices.register_choice(text_get(23, 165), on_validate: method(:deselect_follower))
                else
                    choices.register_choice(text_get(23, 164), on_validate: method(:select_follower))
                end
            end
            choices.register_choice(text_get(23, 146), on_validate: method(:give_item)).register_choice(text_get(23, 147), on_validate: method(:take_item), disable_detect: method(:current_pokemon_has_no_item))
        end
        
        # begin mount code
        $game_player.preset_menu
        if !$game_player.mounted || ($game_player.mountable_pokemon.include?(pokemon.db_symbol) && $game_player.mounted_pokemon != pokemon)
            choices.register_choice(text_get(96, 1), pokemon, on_validate: method(:mount_pokemon))
        elsif $game_player.mounted && $game_player.mounted_pokemon == pokemon
            choices.register_choice(text_get(96, 2), pokemon, on_validate: method(:dismount_pokemon))
        end
        # end mount code

        # then continue with the rest of the original menu logic
        @base_ui.show_win_text(parse_text(23, 30, ::PFM::Text::PKNICK[0] => pokemon.given_name))
        x, y = get_choice_coordinates(choices)
        choice = choices.display_choice(@viewport, x, y, nil, choices, on_update: method(:update_menu_choice))
        @base_ui.hide_win_text if choice == 999
        hide_black_frame
    end

    # @param pokemon [PFM::Pokemon] the Pokemon to mount
    def mount_pokemon(pokemon)
        $game_player.mount(pokemon)
    end

    # @param pokemon [PFM::Pokemon] the Pokemon to dismount
    def dismount_pokemon(pokemon)
        $game_player.dismount(pokemon)
    end

end

GamePlay::Party_Menu.prepend(PartyMenuMountExtension)