/**
 * A class representing a flute shape.
 */
class Flute {
  /**
   * Method to draw the flute shape.
   */
  void makeit() {
    stroke(246, 131, 13);
    fill(246, 161, 13);
    ellipse(1095, 600, 70, 70); // Right end of the body
    ellipse(100, 600, 70, 70); // Left end of the body

    rect(600, 600, 1000, 70); // Body of the flute

    fill(0); // Black color for the holes

    ellipse(150, 567, 30, 11); // First hole
    ellipse(300, 567, 35, 10); // Second hole
    ellipse(450, 567, 35, 10); // Third hole
    ellipse(600, 567, 35, 10); // Fourth hole
    ellipse(750, 567, 35, 10); // Fifth hole
    ellipse(900, 567, 35, 10); // Sixth hole
    ellipse(1050, 567, 35, 10); // Seventh hole

    stroke(0); // Black color for the vertical lines
    rect(180, 600, 1, 70); // First vertical line
    rect(195, 600, 1, 70); // Second vertical line
    rect(100, 600, 1, 70); // Left vertical line
    rect(1095, 600, 1, 70); // Right vertical line
    rect(1100, 600, 1, 70); // Right vertical line
  }
}