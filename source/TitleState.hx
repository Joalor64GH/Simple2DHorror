package;

class TitleState extends FlxState {
	override public function create() {
		super.create();

		var text = new FlxText(0, 0, 0, "Simple 2D Horror", 64);
		text.screenCenter();
		add(text);

		var text2 = new FlxText(0, text.y + 100, 0, "ENTER - Play / ESCAPE - Exit", 30);
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