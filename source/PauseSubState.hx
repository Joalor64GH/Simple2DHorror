package;

class PauseSubState extends FlxSubState {
	public function new() {
		super();

		var bg:FlxSprite = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.WHITE);
		bg.scrollFactor.set();
		bg.alpha = 0.65;
		add(bg);

		var text:FlxText = new FlxText(0, 0, 0, "PAUSED?", 64);
		text.scrollFactor.set();
		text.screenCenter();
		add(text);

		var text2:FlxText = new FlxText(0, text.y + 100, 0, "ENTER - Resume / ESCAPE - Menu", 30);
		text2.scrollFactor.set();
		text2.screenCenter(X);
		add(text2);
	}

	override function update(elapsed:Float) {
		super.update(elapsed);

		if (FlxG.keys.justPressed.ESCAPE)
			FlxG.switchState(TitleState.new);
		else if (FlxG.keys.justPressed.ENTER)
			close();
	}
}