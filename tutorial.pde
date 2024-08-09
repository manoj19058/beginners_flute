class Tutorial {

  void function1() {
    float colo = 255; // Default color for text
    background(0); // Clear the background with black color
    stroke(255, 255, 255); // Set stroke color to white

    // Draw vertical lines to create grid effect
    drawVerticalLines();

    // Handle different tutorial steps
    handleStep();

    // Restart game when 'S' is pressed in the end
    if (k == 9) {
      handleRestart();
    }
  }

  private void drawVerticalLines() {
    int[] xPositions = {300, 450, 600, 750, 900, 1050};
    for (int x : xPositions) {
      line(x, 0, x, 650);
    }
  }

  private void handleStep() {
    String[] notes = {"SA", "RE", "GA", "MA", "PA", "DHA", "NI"};
    int[] colors = {
      color(255, 255, 255), // SA
      color(235, 241, 19), // RE
      color(128, 216, 252), // GA
      color(51, 239, 18), // MA
      color(96, 162, 230), // PA
      color(144, 96, 184), // DHA
      color(228, 23, 80) // NI
    };

    if (kt >= 1 && kt <= 8) {
      textSize(50);
      fill(colors[kt - 1]);
      text(notes[kt - 1], 10, 40);

      if (temp == 0) {
        text("PRESS P FOR PLAY", 10, 100);
      }

      f1.makeit();
      d1.fall(2);
      d1.show();
      d2.fall(2);
      d2.show();
      d3.fall(2);
      d3.show();
      if (kt >= 5) {
        d4.fall(2);
        d4.show();
        d5.fall(2);
        d5.show();
        if (kt == 6 || kt == 7 || kt == 8) {
          d6.fall(2);
          d6.show();
        }
      }

      if (keyPressed) {
        if (key == 'P') {
          p = 1;
          temp = 1;
        }
      }

      if (p == 1) {
        textSize(40);
        fill(colo);
        text("FOR NEXT PRESS N", 10, 100);

        // Check conditions and advance to the next step
        if (checkConditions(kt)) {
          if (keyPressed && key == 'N') {
            p = 0;
            kt++;
            temp = 0;
            colo = 1000; // Change text color
            resetDrops();
          }
        }
      }
    }
  }

  private boolean checkConditions(int step) {
    switch (step) {
      case 1:
        return n1 == 0 && n2 == 0 && n3 == 0 && n4 > 0 && n5 > 0 && n6 > 0 && n7 == 1;
      case 2:
        return n1 == 0 && n2 == 0 && n3 > 0 && n4 > 0 && n5 > 0 && n6 > 0 && n7 == 1;
      case 3:
        return n1 == 0 && n2 > 0 && n3 > 0 && n4 > 0 && n5 > 0 && n6 > 0 && n7 == 1;
      case 4:
        return n1 >= 0 && n2 >= 0 && n3 >= 0 && n4 >= 0 && n5 >= 0 && n6 >= 0 && n7 == 1;
      case 5:
        return n1 == 0 && n2 == 0 && n3 == 0 && n4 == 0 && n5 == 0 && n6 == 0 && n7 == 1;
      case 6:
        return n1 == 0 && n2 == 0 && n3 == 0 && n4 == 0 && n5 == 0 && n6 > 0 && n7 == 1;
      case 7:
        return n1 == 0 && n2 == 0 && n3 == 0 && n4 == 0 && n5 > 0 && n6 > 0 && n7 == 1;
      case 8:
        return n1 == 0 && n2 == 0 && n3 == 0 && n4 > 0 && n5 > 0 && n6 > 0 && n7 == 1;
      default:
        return false;
    }
  }

  private void resetDrops() {
    d1.top();
    d2.top();
    d3.top();
    if (kt >= 5) {
      d4.top();
      d5.top();
      if (kt == 6 || kt == 7 || kt == 8) {
        d6.top();
      }
    }
  }

  private void handleRestart() {
    delay(200);
    background(2000);
    textSize(35);
    text("Enter S for restart", 500, 300);

    if (keyPressed && key == 'S') {
      initializer = 0;
      kt = 1;
    }
  }
}
