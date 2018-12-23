
//shauns built in creation code to handle movement and states, with an addition of jumpcount from me

hSpeed = 0;
vSpeed = 0;

jumpcnt = 2;
jumpmax = 2;

walkSpeed = 6;
walkAcceleration = 0.5;

hFrictionGround = 1.0;
hFrictionAir = 0.6;

size_difference_w = sprite_width - sprite_get_width(oPlayer);
size_difference_y = sprite_height - sprite_get_height(oPlayer);

volume_difference = size_difference_w * size_difference_y;
volume = 1024;
speed_difference = 0;

jumpSpeed = 10.5; 
gravity_ = 0.59;
maxfallSpeed = 25;

hSpeedFraction = 0.0;
vSpeedFraction = 0.0;

z_in = false;
z_out = false;

