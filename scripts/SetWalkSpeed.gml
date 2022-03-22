if (place_meeting(x, y, Road_obj))
{
    if (vehicle != noone)
    {
        walk_speed = base_walk_speed * 1.75
    }
    else
    {
        walk_speed = base_walk_speed * 1.2;
    }
    
}
else if (place_meeting(x, y, Grass_obj))
{
    walk_speed = base_walk_speed * 0.8;
}
else 
{
    walk_speed = base_walk_speed;
}
