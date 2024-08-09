/**
 * @file Game.ino
 * @brief Manages the game logic and visuals.
 */

/**
 * @class Game
 * @brief Handles game state updates and rendering.
 */
class Game {
  private:
    // Constants
    static const int NUM = 100; // Number of particles for fountain effect

    // Game state variables
    int k = 0; // Game mode
    unsigned long lastTime = 0; // Last update time
    int score = 0; // Player score

    // Particle system variables
    PVector pos[NUM];
    PVector vel[NUM];
    int ttl[NUM];

    /**
     * @function updateGameState
     * @brief Updates the game state based on the current mode.
     * 
     * This function updates game state, draws visuals, and manages scoring.
     */
    void updateGameState() {
      if (millis() - lastTime > 3000) {
        k = (k + 1) % 9; // Increment and wrap game state
        lastTime = millis(); // Update lastTime
        resetAllButtons(); // Reset button states
      }

      background(0); // Set background color
      drawVerticalLines(); // Draw vertical lines
      f1.makeit(); // Call makeit method for f1 object

      // Handle game modes
      switch (k) {
        case 0: handleMode0(); break;
        case 1: handleMode1(); break;
        case 2: handleMode2(); break;
        case 3: handleMode3(); break;
        case 4: handleMode4(); break;
        case 5: handleMode5(); break;
        case 6: handleMode6(); break;
        case 7: handleMode7(); break;
        case 8: resetGame(); break;
      }
    }

    /**
     * @function resetAllButtons
     * @brief Resets the states of all buttons.
     */
    void resetAllButtons() {
      b1.taketop(10);
      b2.taketop(10);
      b3.taketop(10);
      b4.taketop(10);
      b5.taketop(10);
      b6.taketop(10);
    }

    /**
     * @function drawVerticalLines
     * @brief Draws vertical lines on the screen.
     */
    void drawVerticalLines() {
      stroke(255); // Set stroke color for lines
      for (int x = 300; x <= 1050; x += 150) {
        line(x, 0, x, 650);
      }
    }

    /**
     * @function updateScore
     * @brief Updates the score based on game conditions and displays it.
     */
    void updateScore() {
      textSize(35);
      t = millis() - lastTime;
      temp11 = t / 1000;
      fill(255, 0, 0); // Set fill color
      text("TIMER", 1000, 35);
      text(temp11, 1000, 70);
      text("SCORE", 12, 80);
      text(score, 15, 110);
    }

    /**
     * @function handleMode0
     * @brief Handles the logic for game mode 0.
     */
    void handleMode0() {
      handleButtonUpdate(b1, b2, b3, 64, 241, 22);
      if (checkConditions(0, 0, 0, 1)) {
        updateScoreAndFountain();
      }
    }

    /**
     * @function handleMode1
     * @brief Handles the logic for game mode 1.
     */
    void handleMode1() {
      handleButtonUpdate(b1, b2, 64, 241, 22);
      if (checkConditions(0, 0, 0, 1)) {
        updateScoreAndFountain();
      }
    }

    /**
     * @function handleMode2
     * @brief Handles the logic for game mode 2.
     */
    void handleMode2() {
      handleButtonUpdate(b1, 64, 241, 22);
      if (checkConditions(0, 0, 1, 1)) {
        updateScoreAndFountain();
      }
    }

    /**
     * @function handleMode3
     * @brief Handles the logic for game mode 3.
     */
    void handleMode3() {
      updateScore();
      if (checkConditions(0, 0, 1, 1)) {
        updateScoreAndFountain();
      }
    }

    /**
     * @function handleMode4
     * @brief Handles the logic for game mode 4.
     */
    void handleMode4() {
      handleButtonUpdate(b1, b2, b3, b4, b5, b6, 64, 241, 22);
      if (checkConditions(0, 0, 0, 1)) {
        updateScore();
      }
    }

    /**
     * @function handleMode5
     * @brief Handles the logic for game mode 5.
     */
    void handleMode5() {
      handleButtonUpdate(b1, b2, b3, b4, b5, 64, 241, 22);
      if (checkConditions(0, 0, 0, 1)) {
        updateScoreAndFountain();
      }
    }

    /**
     * @function handleMode6
     * @brief Handles the logic for game mode 6.
     */
    void handleMode6() {
      handleButtonUpdate(b1, b2, b3, b4, 64, 241, 22);
      if (checkConditions(0, 0, 0, 1)) {
        updateScoreAndFountain();
      }
    }

    /**
     * @function handleMode7
     * @brief Handles the logic for game mode 7.
     */
    void handleMode7() {
      handleButtonUpdate(b1, b2, b3, 64, 241, 22);
      if (checkConditions(0, 0, 0, 1)) {
        updateScoreAndFountain();
      }
    }

    /**
     * @function resetGame
     * @brief Resets the game to the initial state.
     */
    void resetGame() {
      initializer = 0;
      k = 0; // Reset game mode
    }

    /**
     * @function handleButtonUpdate
     * @brief Updates button states and moves them.
     * 
     * @param buttons A variable number of button objects.
     * @param color1 The color for the buttons.
     * @param color2 The color for the buttons.
     */
    void handleButtonUpdate(Button& b1, Button& b2, int color1, int color2) {
      b1.create(color1, color2, color2);
      b2.create(color1, color2, color2);
      b1.move();
      b2.move();
    }

    /**
     * @function checkConditions
     * @brief Checks specific conditions for updating the score.
     * 
     * @param condition1 The first condition value.
     * @param condition2 The second condition value.
     * @param condition3 The third condition value.
     * @param condition4 The required value for n7.
     * @return true if conditions are met, false otherwise.
     */
    bool checkConditions(int condition1, int condition2, int condition3, int condition4) {
      return n1 == condition1 && n2 == condition2 && n3 == condition3 && n4 > 0 && n5 > 0 && n6 > 0 && n7 == condition4;
    }

    /**
     * @function updateScoreAndFountain
     * @brief Updates the score and creates a fountain effect.
     */
    void updateScoreAndFountain() {
      score += 1; // Increment score
      b1.create(22, 111, 241);
      b2.create(22, 111, 241);
      b3.create(22, 111, 241);

      textSize(35);
      fill(241, 227, 22);
      text("SA", 12, 35);
      stroke(45, 246, 32);
      strokeWeight(6);
      createFountainEffects();
    }

    /**
     * @function createFountainEffects
     * @brief Creates fountain effects at specified locations.
     */
    void createFountainEffects() {
      fountain(750, 567);
      fountain(900, 567);
      fountain(1050, 567);
      fountain(600, 567);
      fountain(450, 567);
    }

    /**
     * @function fountain
     * @brief Creates a fountain effect at the specified coordinates.
     * 
     * @param x_fountain The x-coordinate of the fountain's position.
     * @param y_fountain The y-coordinate of the fountain's position.
     */
    void fountain(float x_fountain, float y_fountain) {
      for (int i = 0; i < NUM; i++) {
        point(pos[i].x + x_fountain, pos[i].y + y_fountain);
      }

      for (int i = 0; i < NUM; i++) {
        pos[i].add(vel[i]);
        ttl[i] -= 2;
        if (ttl[i] < 0) {
          vel[i] = new PVector(random(-2, 2), random(-10, -5));
          pos[i] = new PVector(0, 0);
          ttl[i] = int(random(50, 100));
        }
      }
    }

  public:
    /**
     * @function setup
     * @brief Initializes the game settings.
     */
    void setup() {
      // Initialize game settings and objects here
      // e.g., set up buttons, initialize particle system, etc.
    }

    /**
     * @function draw
     * @brief Main loop for game updates and rendering.
     */
    void draw() {
      updateGameState();
    }
};
