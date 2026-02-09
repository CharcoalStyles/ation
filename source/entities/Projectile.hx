package entities;

import flixel.FlxSprite;
import flixel.math.FlxPoint;

class Projectile extends FlxSprite {
  var lifetime:Float;

  public function new() {
    super(0,0);
    kill();
  }
  
  public function init(lt:Float, vel:FlxPoint) {
    lifetime = lt;
    velocity.copyFrom(vel);
		makeGraphic(8, 8, 0xffe4e43f); // Create a yellow square as a placeholder player sprite
  }

  override function update(elapsed:Float) {
    super.update(elapsed);

    lifetime -= elapsed;

    if (lifetime <= 0){
      kill();
    }
  }
}