
//Update Destionation

camera_set_view_angle(cam,0.5);

if (instance_exists(follow)){
	xTo = follow.x;
	yTo = follow.y;
}



//this changes the zoom based on scolling but you can set it how ever you like//
//zoom_level = clamp(zoom_level + (((oPlayer._keyZoom_out - oPlayer._keyZoom_in)) * 0.1), 0.2, 3);

//checks the parameters for z_out in oPlayers step event, and if z_out is false
//	then zoom level only registers zooming in (getting smaller) if true it runs as normal
if oPlayer.z_out = false{
	zoom_level = zoom_level + oPlayer._keyZoom_in	
}else{
	zoom_level = clamp(zoom_level + (((oPlayer._keyZoom_out - oPlayer._keyZoom_in)) * 0.1), 0.2, 3);
}

//Get current size
var view_w = camera_get_view_width(cam);
var view_h = camera_get_view_height(cam);

//Set the rate of interpolation
var rate = 0.1;

//Get new sizes by interpolating current and target zoomed size
var new_w = lerp(view_w, zoom_level * default_zoom_width, rate);
var new_h = lerp(view_h, zoom_level * default_zoom_height, rate);

//Apply the new size
camera_set_view_size(cam, new_w, new_h);

var vpos_x = camera_get_view_x(cam);
var vpos_y = camera_get_view_y(cam);

////change coordinates of camera so zoom is centered
//change coordinates of camera so zoom is centered
var new_x = lerp(vpos_x,vpos_x+(view_w - zoom_level * default_zoom_width)/4, rate);
var new_y = lerp(vpos_y,vpos_y+(view_h - zoom_level * default_zoom_height)/4, rate);

//Get the shift necessary to re-align the view.
var shift_x = camera_get_view_x(view_camera[0]) - (new_w - view_w) * 0.5;
var shift_y = camera_get_view_y(view_camera[0]) - (new_h - view_h) * 0.5;


//Get the shift necessary to re-align the view.
//var shift_x = camera_get_view_x(view_camera[0]) - (new_w - view_w) * 0.5;
//var shift_y = camera_get_view_y(view_camera[0]) - (new_h - view_h) * 0.5;

//Update Object Position
//x += (xTo - x) / 6;
//y += (yTo - y) / 6;


//Update Camera View
//camera_set_view_pos(cam,x-view_w_half,y-view_h_half);