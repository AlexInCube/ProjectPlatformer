#macro LOGGER_LOCALIZATION_MANAGER "[ Localization Manager ] "
target_delta = 1/60//Default game speed
actual_delta = delta_time/1000000//Delta in seconds

#macro DELTATIME global.delta_multiplier
global.delta_multiplier = actual_delta/target_delta//delta_multiplier*speed

#macro DEBUGMODE global.debugmode
global.debugmode=false