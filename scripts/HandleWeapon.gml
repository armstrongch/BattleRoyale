if (weapon != noone)
{
    if (Up || Down || Left || Right)
    {
        weapon_angle += weapon.spin_rate;
    }
    weapon.image_angle = weapon_angle;
    if (weapon.melee) { weapon.image_angle -= 45; }
    weapon.x = x + cos(weapon_angle/180*pi)*20;
    weapon.y = y - sin(weapon_angle/180*pi)*20;
    
    BulletMask_obj.image_angle = weapon_angle;
    
    //Weapon is invisible if it's in a wall
    if (InsideView(x, y))
    {
        BulletMask_obj.bullet_dir = weapon_angle;
        BulletMask_obj.x = weapon.x;
        BulletMask_obj.y = weapon.y;
        with (BulletMask_obj)
        {
            weapon_visible = true;
            bullet_pos = GetBulletPos(bullet_dir);
            colliding_wall = instance_place(bullet_pos[0], bullet_pos[1], Wall_obj);
            if (colliding_wall != noone)
            {
                if (colliding_wall.sprite_index != Window_spr)
                {
                    weapon_visible = false;
                }
            }
        }
        if (!BulletMask_obj.weapon_visible)
        {
            weapon.image_alpha = 0.75;
        }
        else
        {
            weapon.image_alpha = 1;
        }
    }
    
    if ((weapon.reload_counter <= 0) && (Space))
    {
        weapon.reload_counter = weapon.max_reload_counter;
        weapon_angle += weapon.recoil;
        with (weapon)
        {
            if (melee)
            {
                spin_rate = spin_rate * -1;
            }
            else
            {   
                repeat(projectile_count)
                {
                    if (throwable) { bullet_sprite = sprite_index; } else { bullet_sprite = Bullet_spr; }
                    
                    CreateBullet(image_angle, range, explosive, accuracy_penalty, bullet_sprite);
                }
            }
        }
        
        if (weapon.throwable)
        {
            with (weapon) { instance_destroy(); }
            weapon = noone;
        }
    }
}
