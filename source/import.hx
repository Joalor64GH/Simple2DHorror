#if !macro
#if (sys || desktop)
import sys.io.File;
import sys.FileSystem;
#end

import openfl.Lib;
import openfl.system.System;
import openfl.display.Sprite;

import flixel.*;
import flixel.util.*;
import flixel.text.FlxText;

import Paths;

using StringTools;
using Globals;

#if !debug
@:noDebug
#end
#end