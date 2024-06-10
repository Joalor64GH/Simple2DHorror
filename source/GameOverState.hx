package;

class GameOverState extends FlxState {
	override public function create() {
		super.create();

		FlxG.sound.play(Paths.sound('sting'));

		var text:FlxText = new FlxText(0, 0, 0, "GAME OVER", 64);
		text.screenCenter();
		add(text);

		var text2:FlxText = new FlxText(0, text.y + 100, 0, "R - Retry / ESCAPE - Menu", 30);
		text2.screenCenter(X);
		add(text2);
	}

	override public function update(elapsed:Float) {
		super.update(elapsed);

		if (FlxG.keys.justPressed.ESCAPE)
			FlxG.switchState(TitleState.new);
		else if (FlxG.keys.justPressed.R)
			FlxG.switchState(PlayState.new);
	}
}