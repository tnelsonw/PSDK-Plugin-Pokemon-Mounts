# PSDK-Plugin-Pokemon-Mounts
A PSDK plugin designed to mount Pokemon to ride them around on the map. Currently, it replaces the character sprite with a Pokemon sprite. This plugin does not include custom sprites that have the character riding on top of a Pokemon, unfortunately.


## How to Use
Download and put the PokemonMounts.psdkplug plugin file into your scripts directory. Then run your game; it will automatically load the plugin. 

## Additional Info
The Saddle item uses RMXP common event code 96, which is not included in RMXP by default. You will need to add it in. I added it in by editing the CommonEvents.rxdata.yml file with the following lines under id 96:
```
!ruby/object:RPG::CommonEvent
  id: 96
  list:
  - !ruby/object:RPG::EventCommand
    code: 355
    indent: 0
    parameters:
    - use_mount_saddle
  - !ruby/object:RPG::EventCommand
    code: 0
    indent: 0
    parameters: []
  name: Mount saddle
  switch_id: 1
  trigger: 0
```

You then need to open the cmd.bat file in your project's root directory and run `psdk --util=restore` to load the rxdata.yml files into the .rxdata files. After that you can run your game and the saddle item will work as intended. This may or may not be the proper method to include new CommonEvents into PSDK, but it was my first time creating anything for PSDK and it works. 
