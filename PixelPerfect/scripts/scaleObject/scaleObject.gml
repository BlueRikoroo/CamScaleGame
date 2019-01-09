/// @description Tries to scale an object
/// @param Object
/// @param scale|
/// @param forceUpdate
/*
	Returns true if successfully scalled
	Returns false if something got in the way.
	Can input a third argument, force, to overide and force to update 
	size anyways.
*/

var obj = argument[0]
var scale = argument[1]
var forceUpdate = false
if argument_count == 3
	forceUpdate = argument[2]
	
var oldScale = obj.image_xscale

var scaleValid = tryScaleObject(obj,scale,true)

if !(scaleValid or forceUpdate){
	//Update object scale
	obj.image_xscale = oldScale
	obj.image_yscale = oldScale
}

return scaleValid