package;

import openfl.display.FPS;

class Main extends Sprite {
	public final config = {
		gameDimensions: [1280, 720],
		defaultFPS: 60,
		initialState: TitleState,
		skipSplash: false,
		startFullscreen: false
	};

	public function new() {
		super();
		addChild(new FPS(10, 10, 0xFFFFFF));
		addChild(new FlxGame(config.gameDimensions[0], config.gameDimensions[1], config.initialState, config.defaultFPS, config.defaultFPS, config.skipSplash,
			config.startFullscreen));
	}
}