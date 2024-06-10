#if !macro
// Default Imports
#if (sys || desktop)
import sys.io.File;
import sys.FileSystem;
#end

import haxe.Json;

import openfl.Lib;
import openfl.Assets;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.display.Sprite;
import openfl.system.System;
import openfl.geom.*;

import flixel.*;
import flixel.util.*;
import flixel.math.*;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.group.FlxSpriteGroup;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.input.gamepad.FlxGamepadInputID;
import flixel.input.gamepad.FlxGamepad;
import flixel.input.keyboard.FlxKey;

import lime.app.Application;

using StringTools;
using Globals;

#if !debug
@:noDebug
#end
#end