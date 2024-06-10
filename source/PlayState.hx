package;

class PlayState extends FlxState
{
	var player:Player;
	var monster:Monster;

	override public function create()
	{
		super.create();

		player = new Player(FlxG.width / 2, FlxG.height / 2);
		add(player);

		monster = new Monster(200, 100);
		add(monster);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		FlxG.camera.follow(player, LOCKON);
		FlxG.overlap(player, monster, onOverlap);

		if (monster.x < player.x)
			monster.velocity.x = 50;
		else if (monster.x > player.x)
			monster.velocity.x = -50;
		else
			monster.velocity.x = 0;

		if (monster.y < player.y)
			monster.velocity.y = 50;
		else if (monster.y > player.y)
			monster.velocity.y = -50;
		else
			monster.velocity.y = 0;

		if (FlxG.keys.justPressed.LEFT)
			player.velocity.x = -100;
		else if (FlxG.keys.justPressed.RIGHT)
			player.velocity.x = 100;
		else
			player.velocity.x = 0;

		if (FlxG.keys.justPressed.UP)
			player.velocity.y = -100;
		else if (FlxG.keys.justPressed.DOWN)
			player.velocity.y = 100;
		else
			player.velocity.y = 0;

		if (FlxG.keys.justPressed.ESCAPE)
			FlxG.switchState(TitleState.new);
			
	}

	private function onOverlap(player:Player, monster:Monster)
	{
		if (player.alive && player.exists && monster.alive && monster.exists)
			openSubState(new JumpscareSubState());
	}
}