if (previous_vehicle != noone)
{
    if (instance_exists(previous_vehicle))
    {
        if (!place_meeting(x, y, previous_vehicle))
        {
            previous_vehicle = noone;
        }
    }
    else
    {
        previous_vehicle = noone;
    }
}
