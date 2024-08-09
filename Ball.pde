/**
 * A class representing a ball with properties and behaviors.
 */
class Ball {
  private float x;
  private float y;
  private float diameter;
  private float speed = 5;

  /**
   * Constructor for Ball class.
   * @param xpos The initial x-coordinate of the ball.
   * @param ypos The initial y-coordinate of the ball.
   */
  Ball(float xpos, float ypos) {
    x = xpos;
    y = ypos;
    diameter = 20;
  }

  /**
   * Method to create the ball with a given color.
   * @param a Red color value.
   * @param b Green color value.
   * @param c Blue color value.
   */
  void create(float a, float b, float c) {
    stroke(a, b, c);
    fill(a, b, c);
    ellipse(x, y, diameter, diameter);
  }

  /**
   * Method to move the ball vertically.
   * The ball reverses direction when it hits the top or bottom of the screen.
   */
  void move() {
    y += speed;
    if (y < 0 || y > height - diameter) {
      speed *= -1;
    }
  }

  /**
   * Method to set the y-coordinate of the ball.
   * @param val The new y-coordinate value.
   */
  void takeTop(int val) {
    y = val;
  }
}