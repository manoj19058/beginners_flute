/**
 * A class representing a raindrop with properties and behaviors.
 */
class Drop {
  private float x;
  private float y = 0;

  /**
   * Constructor for Drop class.
   * @param x1 The initial x-coordinate of the drop.
   */
  Drop(int x1) {
    x = x1;
  }

  /**
   * Method to simulate the drop falling.
   * The drop resets to the top of the screen when it reaches the bottom.
   * @param yspeed The speed at which the drop falls.
   */
  void fall(float yspeed) {
    y += yspeed;
    if (y > 500) {
      y = 0;
    }
  }

  /**
   * Method to display the drop.
   * The drop is drawn as a blue circle with a random diameter between 15 and 20.
   */
  void show() {
    stroke(0, 0, 0);
    fill(0, 0, 255);
    circle(x, y, random(15, 20));
  }

  /**
   * Method to set the y-coordinate of the drop to the top of the screen.
   */
  void top() {
    y = 10;
  }
}