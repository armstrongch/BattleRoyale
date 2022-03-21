//GetBulletPos(bullet_dir);
bullet_dir = argument0;

bullet_pos[0] = x - cos(bullet_dir/180*pi)*5;
bullet_pos[1] = y + sin(bullet_dir/180*pi)*5;
return bullet_pos;
