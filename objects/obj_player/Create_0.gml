/// @description Init Vars

// Forces and Speeds
// Acceleration and jumping forces
x_force = 250;
y_force = 200;
// How fast player can move (pixels/second)
max_x_speed = 6.5;
// Jumping is limited by y_force and gravity room setting

// Controls
control_left = global.settings.controls.key_left;
control_right = global.settings.controls.key_right;
control_jump = global.settings.controls.key_up;

// Prevent player from falling over.
// Disable this if you're making a face dragging game.
phy_fixed_rotation=true;

depth = -1

mover_speed = 8