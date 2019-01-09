/// @description Tries to scale an object
/// @param Object
/// @param scale
/*
	Returns true if can successfully scalled
	Returns false if otherwise
	Third argument used for other scripts. It updates the position value
*/

var obj = argument[0]
var scale = argument[1]
var updatePosition = false
if (argument_count == 3) updatePosition = argument[2]
var tryAmounts = ceil(scale)
var oldScale = obj.image_xscale
	
obj.image_xscale = scale
obj.image_yscale = scale

with(obj){
	if (place_meeting(x,y,oWall)){
		for (var i = 0; i < tryAmounts; ++i;){
			#region Checking where the last place we were free was and then moving to there
		 	//right
			if (!place_meeting(x + i, y, oWall)){
				if (updatePosition) x += i;
				else{
					image_xscale = oldScale
					image_yscale = oldScale
				}
				return true
			}//Left
			if (!place_meeting(x - i, y, oWall)){
				if (updatePosition) x -= i;
				else{
					image_xscale = oldScale
					image_yscale = oldScale
				}
				return true
			}//up
			if (!place_meeting(x, y - i, oWall)){
				if (updatePosition) y -= i;
				else{
					image_xscale = oldScale
					image_yscale = oldScale
				}
				return true
			}//down
			if (!place_meeting(x, y + i, oWall)){
				if (updatePosition) y += i-2;
				else{
					image_xscale = oldScale
					image_yscale = oldScale
				}
				return true
			}//top right
			if (!place_meeting(x + i, y - i, oWall)){
				if (updatePosition){
					x += i;
					y -= i;
				}else{
					image_xscale = oldScale
					image_yscale = oldScale
				}
				return true
			}//top left
			if (!place_meeting(x - i, y - i, oWall)){
				if (updatePosition){
					x -= i;
					y -= i;
				}else{
					image_xscale = oldScale
					image_yscale = oldScale
				}
				return true
			}//bottom right
			if (!place_meeting(x + i, y + i, oWall)){
				if (updatePosition){
					x += i;
					y += i;
				}else{
					image_xscale = oldScale
					image_yscale = oldScale
				}
				return true
			}//bottom left
			if (!place_meeting(x - i, y + i, oWall)){
				if (updatePosition){
					x -= i;
					y += i;
				}else{
					image_xscale = oldScale
					image_yscale = oldScale
				}
				return true
			} #endregion
		}
		return false
	}
}

return true