package;

class PlayState extends FlxState
{
	var player:Player;
	var monster:Monster;

	override public function create()
	{
		super.create();

		player = new Player(FlxG.width / 2, FlxG.height / 2);
		player.acceleration.y = 400;
		player.maxVelocity.y = 200;
		add(player);

		monster = new Monster(200, 100);
		monster.maxVelocity.x = 100;
		monster.maxVelocity.y = 100;
		add(monster);

		FlxG.camera.follow(player, FlxCamera.STYLE_PLATFORMER);
		FlxG.camera.setBounds(0, 0, FlxG.worldBounds.width, FlxG.worldBounds.height);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

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

		final keyPressed:FlxKey = FlxG.keys.firstJustPressed();
        if (keyPressed != FlxKey.NONE) {
            switch (keyPressed) {
                case LEFT: player.velocity.x = -100;
                case DOWN: player.velocity.y = 100;
                case UP: player.velocity.y = -100;
                case RIGHT: player.velocity.x = 100;
            }
        }

		if (FlxG.keys.justPressed.ESCAPE)
			FlxG.switchState(TitleState.new);

		if (FlxG.overlap(player, monster))
			openSubState(new JumpscareSubState());
	}
}