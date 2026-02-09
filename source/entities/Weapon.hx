package entities;

import flixel.FlxBasic;
import flixel.FlxG;
import flixel.math.FlxPoint;
import utils.GlobalState;

interface IWeaponUser
{
	public var position:FlxPoint;
	public var target:FlxPoint;
	public var activated:Bool;
}

typedef WeaponStats = {
  var shots:Int;
  var speed:Float;
  var spread:Float;
  var refresh:Float;
}

class Weapon extends FlxBasic{
  var initStats:WeaponStats;
  var timer:Float;
  var globalState:GlobalState;
  var user: IWeaponUser;

  public function new(stats:WeaponStats, user: IWeaponUser) {
    super();

    initStats = stats;

    globalState = GlobalState.instance;
    this.user = user;
    timer = 0;
  }

  override function update(elapsed:Float) {
    super.update(elapsed);
    FlxG.log.add("Weapon update: timer = " + timer + ", user activated = " + user.activated);

    if(timer > 0){
      timer = timer - elapsed;
    } else if (user.activated) {
      // FlxG.log.add("Weapon activated! Firing " + initStats.shots + " shots with speed " + initStats.speed + " and spread " + initStats.spread);
      var b = globalState.projectiles.getFirstDead();
      b.reset(user.position.x, user.position.y);
      var angle = Math.atan2(user.target.y - user.position.y, user.target.x - user.position.x);
      angle = angle + (Math.random() - 0.5) * initStats.spread;
      b.init(initStats.speed, new FlxPoint(Math.cos(angle) * initStats.speed, Math.sin(angle) * initStats.speed));

      timer = initStats.refresh;
    }
    // FlxG.log.add("timer = " + timer + " activated = " + user.activated);
  }
}