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

		if (FlxG.keys.anyPressed([LEFT, A]))
			player.velocity.x = -100;
		else if (FlxG.keys.anyPressed([RIGHT, D]))
			player.velocity.x = 100;
		else
			player.velocity.x = 0;

		if (FlxG.keys.anyPressed([UP, W]))
			player.velocity.y = -100;
		else if (FlxG.keys.anyPressed([DOWN, S]))
			player.velocity.y = 100;
		else
			player.velocity.y = 0;

		if (FlxG.keys.justPressed.ESCAPE)
			FlxG.switchState(TitleState.new);	
	}

	function onOverlap(player:Player, monster:Monster)
	{
		player.kill();
		persistentUpdate = false;
		openSubState(new JumpscareSubState());
	}
}