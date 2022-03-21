//CreateBullet(bullet_dir, bullet_range, bullet_explosive, accuracy_penalty, bullet_sprite);
bullet_dir = argument0;
bullet_range = argument1;
bullet_explosive = argument2;
accuracy_penalty = argument3;
bullet_sprite = argument4;

bullet_pos = GetBulletPos(bullet_dir);
bullet = instance_create(bullet_pos[0], bullet_pos[1], Bullet_obj);
bullet.direction = bullet_dir - accuracy_penalty + irandom(accuracy_penalty*2);
bullet.speed = 8;
bullet.range = bullet_range;
bullet.image_angle = bullet.direction;
bullet.explosive = bullet_explosive;
bullet.sprite_index = bullet_sprite;
