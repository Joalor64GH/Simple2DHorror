package;

class TitleState extends FlxState {
	override public function create() {
		super.create();

		var text:FlxText = new FlxText(0, 0, 0, "Simple 2D Horror", 12);
		text.setFormat(Paths.font('vcr.ttf'), 64, FlxColor.WHITE, CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		text.screenCenter();
		add(text);

		var text2:FlxText = new FlxText(0, text.y + 100, 0, "ENTER - Play / ESCAPE - Exit", 12);
		text2.setFormat(Paths.font('vcr.ttf'), 30, FlxColor.WHITE, CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		text2.screenCenter(X);
		add(text2);
	}

	override public function update(elapsed:Float) {
		super.update(elapsed);

		if (FlxG.keys.justPressed.ESCAPE) {
			#if (sys || desktop)
			Sys.exit(0);
			#else
			System.exit(0);
			#end
		} else if (FlxG.keys.justPressed.ENTER)
			FlxG.switchState(PlayState.new);
	}
}