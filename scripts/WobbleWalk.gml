wobble_angle += wobble_mod;
if (wobble_angle >= max_wobble_angle)
{
    wobble_mod = -1 * abs(wobble_mod);
}
else if (wobble_angle <= -max_wobble_angle)
{
    wobble_mod = abs(wobble_mod);
}
