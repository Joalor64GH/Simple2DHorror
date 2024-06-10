package;

class JumpscareSubState extends FlxSubState {
	public function new() {
		super();

        FlxG.sound.play(Paths.sound('jumpscare'));

		var bg:FlxSprite = new FlxSprite().makeGraphic(1280, 720, FlxColor.BLACK);
		add(bg);

		var jump:FlxSprite = new FlxSprite().makeGraphic(500, 500, FlxColor.RED);
		jump.scrollFactor.set();
		jump.screenCenter(XY);
		add(jump);
	}

	override function update(elapsed:Float) {
		super.update(elapsed);

		FlxG.camera.shake(0.01, 0.1);

		new FlxTimer().start(2, function(tmr:FlxTimer) {
			FlxG.switchState(GameOverState.new);
		});
	}
}