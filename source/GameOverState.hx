package;

class GameOverState extends FlxState {
	override public function create() {
		super.create();

		FlxG.sound.play(Paths.sound('sting'));

		var text:FlxText = new FlxText(0, 0, 0, "GAME OVER", 12);
		text.setFormat(Paths.font('vcr.ttf'), 64, FlxColor.WHITE, CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		text.screenCenter();
		add(text);

		var text2:FlxText = new FlxText(0, text.y + 100, 0, "R - Retry / ESCAPE - Menu", 12);
		text2.setFormat(Paths.font('vcr.ttf'), 30, FlxColor.WHITE, CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
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