package;

class Monster extends FlxSprite
{
    public function new(x:Float, y:Float)
    {
        super(x, y);
        makeGraphic(50, 100, FlxColor.RED);
    }
}