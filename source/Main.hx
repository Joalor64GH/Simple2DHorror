package;

class Main extends openfl.display.Sprite {
	public final config:Dynamic = {
		gameDimensions: [1280, 720],
		defaultFPS: 60,
		initialState: TitleState,
		skipSplash: false,
		startFullscreen: false
	};

	public function new() {
		super();

		addChild(new FlxGame(config.gameDimensions[0], config.gameDimensions[1], config.initialState, config.defaultFPS, config.defaultFPS, config.skipSplash, config.startFullscreen));
		addChild(new FPSDisplay(10, 10, 0xFFFFFF));
	}
}