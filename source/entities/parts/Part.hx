package entities.parts;

import flixel.FlxG;
import flixel.FlxSprite;

typedef StatMod = {
  var add:Float;
  var mult:Float;
  var exp:Float;
}

typedef PartStats = {
  var shots:StatMod;
  var speed:StatMod;
  var spread:StatMod;
  var delay:StatMod;
  var refresh:StatMod;
}

class Part {
  var name:String;
  var description:String;
  var iconSprite:FlxSprite;

  var stats:PartStats;

  public static function genStats():PartStats {
    return {
      shots: {add: 0, mult: 1, exp: 1},
      speed: {add: FlxG.random.float(-30, 30), mult: 1, exp: 1},
      spread: {add: FlxG.random.float(-10, 10), mult: 1, exp: 1},
      delay: {add: FlxG.random.float(-0.1, 0.1), mult: 1, exp: 1},
      refresh: {add: FlxG.random.float(-0.15, 0.15), mult: 1, exp: 1}
    }
  }

  public function new(name:String, description:String, stats:PartStats) {
    this.name = name;
    this.description = description;
    this.stats = stats;
    iconSprite = new FlxSprite();
  }
}