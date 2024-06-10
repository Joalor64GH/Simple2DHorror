package;

class JumpscareSubState extends FlxSubState
{
    public function new()
    {
        super();

        var bg:FlxSprite = new FlxSprite().makeGraphic(1280, 720, FlxColor.BLACK);
        bg.cameras = [FlxG.cameras.list[1]];
        bg.scrollFactor.set();
        add(bg);

        var jump:FlxSprite = new FlxSprite().makeGraphic(200, 200, FlxColor.RED);
        jump.screenCenter(X);
        jump.scrollFactor.set();
        add(jump);
    }

    override function update(elapsed:Float)
    {
        super.update(elapsed);
        
        FlxG.camera.shake(0.01, 0.1);

        new FlxTimer().start(2, function(tmr:FlxTimer) {
            FlxG.switchState(GameOverState.new);
        });
    }
}