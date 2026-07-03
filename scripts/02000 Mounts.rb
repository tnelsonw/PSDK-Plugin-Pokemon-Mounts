class Game_Player
    
    # Get the mounted attribute [Boolean]
    # @return [Boolean] true if the player is mounted, false otherwise
    attr_reader :mounted

    # get the mounted Pokemon [PFM::Pokemon]
    # @return [PFM::Pokemon] the Pokemon the player is currently mounted on
    attr_reader :mounted_pokemon

    # get the list of mountable Pokemon [Array<Symbol>]
    # @return [Array<Symbol>] the list of Pokemon symbols that can be mounted
    attr_reader :mountable_pokemon

    MOUNTABLE_POKEMON = [
            :venusaur,
            :charizard,
            :blastoise,
            :pidgeot,
            :fearow,
            :arbok,
            :nidoqueen,
            :nidoking,
            :ninetales,
            :parasect,
            :persian,
            :arcanine,
            :machoke,
            :machamp,
            :tentacruel,
            :golem,
            :rapidash,
            :dodrio,
            :dewgong,
            :cloyster,
            :gengar,
            :onix,
            :rhydon,
            :kangaskhan,
            :seaking,
            :starmie,
            :scyther,
            :pinsir,
            :tauros,
            :gyarados,
            :lapras,
            :vaporeon,
            :jolteon,
            :flareon,
            :omastar,
            :kabutops,
            :aerodactyl,
            :snorlax,
            :articuno,
            :zapdos,
            :moltres,
            :dragonair,
            :dragonite,
            :mewtwo,
            :meganium,
            :typhlosion,
            :feraligatr,
            :noctowl,
            :ariados,
            :crobat,
            :lanturn,
            :xatu,
            :ampharos,
            :sudowoodo,
            :espeon,
            :umbreon,
            :girafarig,
            :forretress,
            :steelix,
            :granbull,
            :scizor,
            :heracross,
            :ursaring,
            :magcargo,
            :octillery,
            :mantine,
            :skarmory,
            :houndoom,
            :kingdra,
            :donphan,
            :porygon2,
            :stantler,
            :miltank,
            :raikou,
            :entei,
            :suicune,
            :tyranitar,
            :lugia,
            :ho_oh,
            :sceptile,
            :blaziken,
            :swampert,
            :mightyena,
            :beautifly,
            :dustox,
            :ludicolo,
            :shiftry,
            :swellow,
            :pelipper,
            :gardevoir,
            :breloom,
            :exploud,
            :hariyama,
            :delcatty,
            :aggron,
            :medicham,
            :manectric,
            :swalot,
            :sharpedo,
            :wailmer,
            :wailord,
            :camerupt,
            :torkoal,
            :flygon,
            :cacturne,
            :altaria,
            :zangoose,
            :seviper,
            :whiscash,
            :claydol,
            :armaldo,
            :milotic,
            :banette,
            :dusclops,
            :tropius,
            :absol,
            :glalie,
            :walrein,
            :huntail,
            :gorebyss,
            :relicanth,
            :salamence,
            :metagross,
            :regirock,
            :regice,
            :registeel,
            :latias,
            :latios,
            :kyogre,
            :groudon,
            :rayquaza,
            :torterra,
            :infernape,
            :empoleon,
            :staraptor,
            :bibarel,
            :luxray,
            :rampardos,
            :bastiodon,
            :vespiquen,
            :floatzel,
            :gastrodon,
            :ambipom,
            :drifblim,
            :mismagius,
            :honchkrow,
            :purugly,
            :skuntank,
            :bronzong,
            :garchomp,
            :lucario,
            :hippowdon,
            :drapion,
            :toxicroak,
            :lumineon,
            :abomasnow,
            :weavile,
            :magnezone,
            :lickilicky,
            :rhyperior,
            :tangrowth,
            :electivire,
            :magmortar,
            :togekiss,
            :yanmega,
            :leafeon,
            :glaceon,
            :gliscor,
            :mamoswine,
            :porygon_z,
            :gallade,
            :probopass,
            :dusknoir,
            :froslass,
            :rotom,
            :uxie,
            :mesprit,
            :azelf,
            :dialga,
            :palkia,
            :heatran,
            :regigigas,
            :giratina,
            :cresselia,
            :darkrai,
            :arceus,
            :serperior,
            :emboar,
            :samurott,
            :watchog,
            :stoutland,
            :liepard,
            :musharna,
            :unfezant,
            :zebstrika,
            :gigalith,
            :swoobat,
            :conkeldurr,
            :seismitoad,
            :throh,
            :sawk,
            :leavanny,
            :scolipede,
            :basculin,
            :krookodile,
            :darmanitan,
            :crustle,
            :cofagrigus,
            :carracosta,
            :archeops,
            :garbodor,
            :zoroark,
            :cinccino,
            :gothitelle,
            :reuniclus,
            :swanna,
            :sawsbuck,
            :escavalier,
            :jellicent,
            :alomomola,
            :galvantula,
            :ferrothorn,
            :klinklang,
            :eelektross,
            :chandelure,
            :haxorus,
            :beartic,
            :mienshao,
            :druddigon,
            :golurk,
            :bisharp,
            :bouffalant,
            :braviary,
            :mandibuzz,
            :hydreigon,
            :volcarona,
            :cobalion,
            :terrakion,
            :virizion,
            :tornadus,
            :thundurus,
            :reshiram,
            :zekrom,
            :landorus,
            :kyurem,
            :genesect,
            :chesnaught,
            :delphox,
            :greninja,
            :diggersby,
            :talonflame,
            :vivillon,
            :pyroar,
            :florges,
            :gogoat,
            :pangoro,
            :meowstic,
            :aegislash,
            :malamar,
            :barbaracle,
            :dragalge,
            :heliolisk,
            :tyrantrum,
            :aurorus,
            :sylveon,
            :goodra,
            :trevenant,
            :gourgeist,
            :avalugg,
            :noivern,
            :xerneas,
            :yveltal,
            :zygarde,
            :diancie,
            :volcanion,
            :decidueye,
            :incineroar,
            :primarina,
            :toucannon,
            :vikavolt,
            :crabominable,
            :lycanroc,
            :wishiwashi,
            :toxapex,
            :mudsdale,
            :araquanid,
            :lurantis,
            :shiinotic,
            :salazzle,
            :bewear,
            :tsareena,
            :oranguru,
            :passimian,
            :golisopod,
            :palossand,
            :type_null,
            :silvally,
            :turtonator,
            :drampa,
            :dhelmise,
            :kommo_o,
            :tapu_koko,
            :tapu_lele,
            :tapu_bulu,
            :tapu_fini,
            :solgaleo,
            :lunala,
            :nihilego,
            :buzzwole,
            :pheromosa,
            :xurkitree,
            :celesteela,
            :kartana,
            :guzzlord,
            :necrozma,
            :magearna,
            :naganadel,
            :stakataka,
            :blacephalon,
            :zeraora,
            :melmetal,
            :rillaboom,
            :cinderace,
            :inteleon,
            :greedent,
            :corviknight,
            :orbeetle,
            :thievul,
            :eldegoss,
            :dubwool,
            :drednaw,
            :boltund,
            :coalossal,
            :flapple,
            :appletun,
            :sandaconda,
            :cramorant,
            :barraskewda,
            :toxtricity,
            :centiskorch,
            :grapploct,
            :polteageist,
            :hatterene,
            :grimmsnarl,
            :obstagoon,
            :runerigus,
            :alcremie,
            :falinks,
            :pincurchin,
            :frosmoth,
            :stonjourner,
            :indeedee,
            :copperajah,
            :dracozolt,
            :arctozolt,
            :dracovish,
            :arctovish,
            :duraludon,
            :dragapult,
            :zacian,
            :zamazenta,
            :eternatus,
            :urshifu,
            :zarude,
            :regieleki,
            :regidrago,
            :glastrier,
            :spectrier,
            :calyrex,
            :wyrdeer,
            :kleavor,
            :ursaluna,
            :basculegion,
            :sneasler,
            :overqwil,
            :enamorus,
            :meowscarada,
            :skeledirge,
            :quaquaval,
            :oinkologne,
            :spidops,
            :lokix,
            :pawmot,
            :dachsbun,
            :arboliva,
            :garganacl,
            :armarouge,
            :ceruledge,
            :bellibolt,
            :kilowattrel,
            :mabosstiff,
            :grafaiai,
            :brambleghast,
            :toedscruel,
            :klawf,
            :scovillain,
            :rabsca,
            :espathra,
            :bombirdier,
            :finizen,
            :palafin,
            :revavroom,
            :cyclizar,
            :orthworm,
            :glimmora,
            :houndstone,
            :flamigo,
            :cetitan,
            :veluza,
            :dondozo,
            :annihilape,
            :clodsire,
            :farigiraf,
            :dudunsparce,
            :kingambit,
            :great_tusk,
            :scream_tail,
            :brute_bonnet,
            :flutter_mane,
            :slither_wing,
            :sandy_shocks,
            :iron_treads,
            :iron_bundle,
            :iron_hands,
            :iron_jugulis,
            :iron_moth,
            :iron_thorns,
            :baxcalibur,
            :gholdengo,
            :wo_chien,
            :chien_pao,
            :ting_lu,
            :chi_yu,
            :roaring_moon,
            :iron_valiant,
            :koraidon,
            :miraidon,
            :walking_wake,
            :iron_leaves,
            :okidogi,
            :munkidori,
            :fezandipiti,
            :ogerpon,
            :archaludon,
            :hydrapple,
            :gouging_fire,
            :raging_bolt,
            :iron_boulder,
            :iron_crown,
            :terapagos,
            ].freeze

    alias default_update_appearance update_appearance

    # Launch the player update appearance
    # modified to check for the mounted state
    # The @last_mounted_poke_number is the 4 digit number (with or without 's') of the file in the graphics/characters spritesheets
    # So Venusaur would be saved as '0003' in @last_mounted_poke_number and shiny Venusaur would be saved as '0003s'
    # @param forced_pattern [Integer] pattern after update (default : 0)
    def update_appearance(forced_pattern = 0)
        
        if @mounted
            set_appearance(@last_mounted_poke_number)
        else
            default_update_appearance(forced_pattern)
        end
    end

    alias default_enter_in_acro_bike_state enter_in_acro_bike_state

    # check for the mounted state and dismount before hopping on the acro bike
    def enter_in_acro_bike_state
        if @mounted
            dismount(@mounted_pokemon)
        end
        default_enter_in_acro_bike_state
    end

    alias default_enter_in_cycling_state enter_in_cycling_state

    # check for the mounted state and dismount before hopping on the mach bike
    def enter_in_cycling_state
        if @mounted
            dismount(@mounted_pokemon)
        end
        default_enter_in_cycling_state
    end

    alias default_enter_in_surfing_state enter_in_surfing_state

    # check for the mounted state and dismount before surfing
    def enter_in_surfing_state
        if @mounted
            dismount(@mounted_pokemon)
        end
        default_enter_in_surfing_state
    end

    # called before the party menu is displayed to set up the mountable pokemon list
    def preset_menu
        @mountable_pokemon = MOUNTABLE_POKEMON
    end

    # simply setting some instance variables to ensure the mount state is correct
    # @param last_mounted_num [String] the 4 digit number of the last mounted pokemon (i.e. Venusaur is '0003')
    # @param Pokemon [PFM::Pokemon] the object of the pokemon to mount
    def ensure_mount_state(last_mounted_num, pokemon)
        @last_mounted_poke_number = last_mounted_num
        @mounted = true
        @mounted_pokemon = pokemon
    end

    # mount a pokemon
    # @param pokemon [PFM::Pokemon] the object of the pokemon to mount
    # currently sets the player sprite to the mount sprite and disables the follower
    def mount(pokemon)

        poke_db_symbol = pokemon.db_symbol
        creature_data = data_creature(poke_db_symbol)  # id == number
        pokemon.shiny? ? file_prepend = format("%04ds", creature_data.id) : file_prepend = format("%04d", creature_data.id)

        # do nothing if Pokemon is not mountable (this may be an unreachable code block right now, unless you explicitly call the $game_player.mount on an incompatible pokemon)
        unless MOUNTABLE_POKEMON.include?(poke_db_symbol)
            $scene.display_message(parse_text(96, 0, ::PFM::Text::PKNICK[1] => pokemon.name))  # because of PKNICK/additional_var I don't think this will work with ext_text
            return nil
        end

        # don't mount while surfing or biking
        if @surfing || @on_acro_bike || $game_switches[::Yuki::Sw::EV_Bicycle]
            $scene.display_message(parse_text(96, 4))
            return nil
        end

        # check if already mounted on a Pokemon. If so, dismount the current Pokemon
        if @mounted
            dismount(pokemon)
        end

        ensure_mount_state(file_prepend, pokemon)
        mount_cry(creature_data, pokemon.form)

        # this removes the follower the right way 
        if Yuki::FollowMe.enabled
            @was_enabled = Yuki::FollowMe.enabled
            @was_lets_go_mode = Yuki::FollowMe.in_lets_go_mode?
            @was_pokemon_count = Yuki::FollowMe.pokemon_count
            Yuki::FollowMe.enabled=(false)
            Yuki::FollowMe.lets_go_mode=(false)
            Yuki::FollowMe.pokemon_count=(0)
        end

        # set the player sprite to the mount sprite
        set_appearance(file_prepend)
    end

    # dismount the current pokemon
    # @param pokemon [PFM::Pokemon] the object of the pokemon to dismount
    # currently sets the player sprite back to the default sprite and re-enables the follower settings
    def dismount(pokemon)
        @mounted = false
        # set the player sprite back to the default sprite
        $game_player.set_appearance_set($game_player.charset_base)

        # re-enable the follower
        if @was_enabled
            Yuki::FollowMe.enabled=(true)
        end
        if @was_lets_go_mode
            Yuki::FollowMe.lets_go_mode=(true)
        end
        if @was_pokemon_count
            Yuki::FollowMe.pokemon_count=(@was_pokemon_count)
        end

        # play Pokemon's cry
        mount_cry(data_creature(pokemon.db_symbol), pokemon.form)
    end

    private
    # utility function to play the cry of the mounted Pokemon
    # @param creature_data [PFM::Creature] the creature data of the Pokemon
    # @param form [Integer] the form of the Pokemon
    def mount_cry(creature_data, form)
        # play the mount cry/sound effect
        creature_form = creature_data.forms.find { |data| data.form == form }
        creature_form ||= creature_data.forms.find { |data| data.form == 0 }
        cry = creature_form&.resources&.cry
        if cry.nil? || cry.empty?
            log_info("No cry found for #{poke_db_symbol} form #{form}.")
            return nil
        end

        filename = "audio/se/cries/#{cry}"
        Audio.cry_play(filename) #if File.exist?(filename)
    end
end