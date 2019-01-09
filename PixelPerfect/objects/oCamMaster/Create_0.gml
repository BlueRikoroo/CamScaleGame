/// @description Set Up Camera
cam = view_camera[0];
follow = oPlayer;
view_w_half = camera_get_view_width(cam) * 0.5;
view_h_half = camera_get_view_height(cam) * 0.5;
xTo = xstart;
yTo = ystart;


//Get the starting view size to be used for interpolation later
default_zoom_width = 540 //Smallest size it can be
default_zoom_height = 360

//Zoom is the scaler to use for zooming
zoomMin = 1
zoomMax = 5
zoomCurrent = (zoomMax+zoomMin)*0.5
zoomRate = 0.05
