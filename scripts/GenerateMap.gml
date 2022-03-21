grass_counter = irandom(4);

for (i = 0; i < room_width; i += 16)
{
    for (j = 0; j < room_height; j += 16)
    {
        if (grass_counter == 0)
        {
            instance_create(i, j, Grass_obj);
            grass_counter = irandom(4);
        }
        else
        {
            grass_counter -= 1;
        }
    }
}
