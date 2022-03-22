if (Up || Down || Left || Right)
{
    WobbleWalk();
    SetWalkSpeed();
    
    x_mod = Right - Left;
    y_mod = Down - Up;
    dir = point_direction(0, 0, x_mod, y_mod);
    
    if (instance_number(Footprints_obj) == 0) 
    {
        create_footprint = true;
    }
    else
    {
        nearest_footprint = instance_nearest(x, y, Footprints_obj);
        create_footprint = (point_distance(x, y, nearest_footprint.x, nearest_footprint.y) > 16);
    }
    
    if (create_footprint)
    {
        print = instance_create(x, y, Footprints_obj);
        print.image_angle = dir;
    }
    
    target_x = x + cos(dir/180*pi)*walk_speed;
    target_y = y - sin(dir/180*pi)*walk_speed;
    
    if (!place_meeting(target_x, target_y, Wall_obj))
    {
        x = target_x;
        y = target_y;
    }
    else
    {
        test_x = x;
        test_y = y;
        
        try_x_move = true;
        try_y_move = true;
        
        test_count = ceil(walk_speed/0.1);

        
        while (!place_meeting(test_x, test_y, Wall_obj) && (try_x_move || try_y_move) && test_count > 0)
        {
            test_count -= 1;    
           
            if (try_x_move)
            {
                test_x += cos(dir/180*pi)*0.1;
            }
            
            if (try_y_move)
            {
                test_y -= sin(dir/180*pi)*0.1;
            }
            
            if (abs(x-test_x) >= abs(x-target_x)) { test_x = target_x; try_x_move = false; }
            if (abs(y-test_y) >= abs(y-target_y)) { test_y = target_y; try_y_move = false; }
            
            if (!place_meeting(test_x, test_y, Wall_obj))
            {
                x = test_x;
                y = test_y;
            }
            else if (!place_meeting(x, test_y, Wall_obj))
            {
                y = test_y;
                test_x = x;
                try_x_move = false;
            }
            else if (!place_meeting(test_x, y, Wall_obj))
            {
                x = test_x;
                test_y = y;
                try_y_move = false;
            }
            else
            {
                try_x_move = false;
                try_y_move = false;
            } 
        }
    }
}
