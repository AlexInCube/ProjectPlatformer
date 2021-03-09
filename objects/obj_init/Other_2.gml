randomize()
draw_set_font(fnt_main)
setup_default_settings()
load_settings()

//game_set_speed(global.settings.video.game_speed, gamespeed_fps);
change_v_sync_mode(global.settings.video.v_sync)


#macro GUIWIDTH global.width
#macro GUIHEIGHT global.height

change_resolution(global.settings.video.width,global.settings.video.height,1)

if !audio_group_is_loaded(ag_music)
   {
   audio_group_load(ag_music);
   }
   
if !audio_group_is_loaded(ag_sounds)
   {
   audio_group_load(ag_sounds);
   }

localization_load()
setup_level_playlist()

alarm[0] = 1

global.progress = 0
global.deaths = 0
global.time = {
	hours: 0,
	minutes: 0,
	seconds: 0,
	microseconds: 0,
}
load_game()


