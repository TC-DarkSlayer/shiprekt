#define SERVER_ONLY

#include "TileCommon.as"

const int SECS_TO_SHARK = 3;
const f32 SHARK_SPAWN_RADIUS = 126.0f;
const int MAX_SHARKS_AREA = 20;

void onTick(CRules@ this)
{
	if (getGameTime() % 90 != 0 || getRules().get_bool("whirlpool"))
		return;

	CBlob@[] humans;
	getBlobsByName("human", @humans);
	for (uint i=0; i < humans.length; i++)
	{
		CBlob@ human = humans[i];		
		if (!human.get_bool("onGround"))
		{
			SpawnShark( this, human.getPosition());
		}
	}
}

void SpawnShark(CRules@ this, Vec2f pos)
{
    if (getSharkCountInArea(this, pos) < MAX_SHARKS_AREA)
    {
        // randomize pos in radius

        Vec2f radius = Vec2f(SHARK_SPAWN_RADIUS, 0);
        radius.RotateBy( XORRandom(360) );
        
		//only spawn if position is in water and visible to human
        Vec2f spawnPos = pos + radius;
        if (isInWater(spawnPos) && !isTouchingShoal(spawnPos) && !getMap().rayCastSolid(spawnPos, pos))
        {
            CBlob @shark = server_CreateBlob("shark", -1, spawnPos);
        }
    }
}

int getSharkCountInArea( CRules@ this, Vec2f pos, const f32 radius = SHARK_SPAWN_RADIUS+5.0f )
{
	int sharks = 0;
	CBlob@[] blobsInRadius;
	if (getMap().getBlobsInRadius(pos, radius, @blobsInRadius))
	{
		for (uint i = 0; i < blobsInRadius.length; i++)
		{
			CBlob @b = blobsInRadius[i];
			if (b.getName() == "shark")
			{
				sharks++;
			}
		}
	}
	return sharks;
}