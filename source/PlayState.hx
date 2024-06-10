package;

class PlayState extends FlxState {
	var player:FlxSprite;
	var monster:FlxSprite;

	var timeTxt:FlxText;
	var elapsedTime:Float;

	override public function create() {
		super.create();

		elapsedTime = 0;

		FlxG.sound.playMusic(Paths.music('game'));

		player = new FlxSprite(FlxG.width / 2, FlxG.height / 2).makeGraphic(50, 100, FlxColor.BLUE);
		add(player);

		monster = new FlxSprite(200, 100).makeGraphic(50, 100, FlxColor.RED);
		add(monster);

		timeTxt = new FlxText(FlxG.width / 2, 0, 0, "", 12);
		timeTxt.setFormat(Paths.font('vcr.ttf'), 50, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		timeTxt.scrollFactor.set();
		add(timeTxt);
	}

	override public function update(elapsed:Float) {
		super.update(elapsed);

		elapsedTime += elapsed;
		timeTxt.text = "Time Survived: " + FlxStringUtil.formatTime(elapsedTime, true);

		FlxG.camera.follow(player, LOCKON);

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

		if (FlxG.keys.justPressed.ESCAPE) {
			trace('paused');
			persistentUpdate = false;
			openSubState(new PauseSubState());
		}

		if (checkOverlap(monster, player)) {
			trace('oops you got caught');
			FlxG.sound.music.volume = 0;
			openSubState(new JumpscareSubState());
		}
	}

	function checkOverlap(sprite1:FlxSprite, sprite2:FlxSprite):Bool {
		return (sprite1.x < sprite2.x + sprite2.width
			&& sprite1.x + sprite1.width > sprite2.x
			&& sprite1.y < sprite2.y + sprite2.height
			&& sprite1.y + sprite1.height > sprite2.y);
	}
}