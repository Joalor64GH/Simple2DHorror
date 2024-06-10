#if !macro
#if (sys || desktop)
import sys.io.File;
import sys.FileSystem;
#end

import openfl.Lib;
import openfl.Assets;
import openfl.display.Sprite;
import openfl.system.System;

import flixel.*;
import flixel.util.*;
import flixel.math.*;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.group.FlxGroup.FlxTypedGroup;

using StringTools;
using Globals;

#if !debug
@:noDebug
#end
#end