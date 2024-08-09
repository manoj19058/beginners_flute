/**
 * A class representing an object with properties and behaviors.
 */
class Object {
  private float x;
  private float y;

  /**
   * Constructor for Object class.
   * @param xob The initial x-coordinate of the object.
   * @param yob The initial y-coordinate of the object.
   */
  Object(float xob, float yob) {
    x = xob;
    y = yob;
  }

  /**
   * Method to create the object with a given color.
   * @param a Red color value.
   * @param b Green color value.
   * @param c Blue color value.
   */
  void make(int a, int b, int c) {
    fill(a, b, c);
    rect(x, y, 300, 50);
  }

  /**
   * Method to change the color of the object.
   */
  void colorchanger() {
    fill(237, 233, 8);
  }
}