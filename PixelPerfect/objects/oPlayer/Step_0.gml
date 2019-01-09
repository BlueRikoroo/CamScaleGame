//
grounded = (place_meeting(x,y+1,oWall));

_keyLeft = keyboard_check(ord("A"));
_keyRight = keyboard_check(ord("D"));
_keyUp = keyboard_check(ord("W"));
_keyDown = keyboard_check(ord("S"));
_keyJump = keyboard_check_pressed(vk_space);
_keyJump_release = keyboard_check_released((vk_space));



//speed_difference = lerp()


//hSpeed = (_keyRight - _keyLeft) * walkSpeed;
		var dir = _keyRight - _keyLeft;
		hSpeed += dir * walkAcceleration 
		
		if (dir == 0) 
		{
			var hFriction = hFrictionGround;
			if (!grounded)  
			{
				hFriction = hFrictionAir;
			}
			
			hSpeed = scr_Approach(hSpeed,0,hFriction);
		}
		hSpeed = clamp(hSpeed,-walkSpeed,walkSpeed);
		

		
		//Terminal velocity
		if vSpeed < maxfallSpeed
		{
		vSpeed += gravity_;
		}
		else
		{
		 vSpeed = maxfallSpeed;	
		}
		vSpeed= clamp(vSpeed, -maxfallSpeed, maxfallSpeed);

		//Jumping and Jump counting
		if (_keyJump) && (jumpcnt > 0)
		{
			jumpcnt -= 1;
			grounded = false;
			//vSpeedFraction = 0;
			vSpeed = -jumpSpeed;
		}
					
		//Variable Jumping
		if (_keyJump_release && vSpeed < 0) //When the jump key is released, gravity will over-ride the upward movement
		{
			vSpeed *= 0.4;
		}
		//reset Jumpcount
		if grounded //When grounded, jumpcount resets
		{
			jumpcnt = jumpmax;
		}

		
	
hSpeed += hSpeedFraction;
vSpeed += vSpeedFraction;
hSpeedFraction = frac(hSpeed);
vSpeedFraction = frac(vSpeed);
hSpeed -= hSpeedFraction;
vSpeed -= vSpeedFraction;



//Collisions
//Normal Collisions

if (place_meeting(x+hSpeed,y,oWall))
{
	var _hStep = sign(hSpeed);
	hSpeed = 0;
	hSpeedFraction = 0;
	while(!place_meeting(x+_hStep,y,oWall)) x += _hStep;	
}
x += hSpeed;

if (place_meeting(x,y+vSpeed,oWall))
{
	var _vStep = sign(vSpeed);
	vSpeed = 0;
	vSpeedFraction = 0;
	while(!place_meeting(x,y+_vStep,oWall)) y += _vStep;	
}
y += vSpeed;

//Collision checks to stop zooming if too big for room

//Check if there is a collision at both the top and bottom of the player object
//       if there is, then the player is just big enough to fit in whatever space
//       theyre already in, and thus will prevent zooming in the oCamMaster
if (place_meeting(x,y-1,oWall)) && (place_meeting(x,y+1,oWall))
	{
		z_out = false;
	} else
		{
			z_out = true;
		}
	
//the same as check above but if the player is colliding with walls along horizontal axis
//z_out being false will prevent getting bigger via oCamMaster

if (place_meeting(x-1,y,oWall)) && (place_meeting(x+1,y,oWall))
	{
		z_out = false
	}else
		{
			z_out = true;
		}
