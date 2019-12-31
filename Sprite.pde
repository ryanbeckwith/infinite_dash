/**
* Represents a Sprite object.
* A Sprite object only represents
* the square that the character controls
* by jumping, and never changes its x position.
*
* 5/22/18, CSC 500, Ms. B,
* Final Project.
* @author Ryan Beckwith
*/
class Sprite
{
  /**
  * Fields representing the x-coordinate of the CENTER (not top left corner)
  * of the Sprite object, the y-coordinate of the CENTER, the width, and the height
  * respectively.
  */
  float x, y, w, h;
  /**
  * Field representing the speed at which a Sprite object moves along the y-axis.
  */
  float speedY;
  /**
  * Field that holds true if the Sprite is touching a Platform object, false otherwise.
  */
  boolean connected;
  /**
  * Field that holds the strength of gravity for the Sprite object.
  */
  float g;
  /**
  * Field that holds true if the space key is pressed down, false otherwise.
  * Works in conjunction with the FinalProject file.
  */
  boolean space;
  /**
  * Fields that represent the x and y coordinates of the corners of the Sprite object.
  */
  float xR, yR, xL, yL, xTR, yTR, xTL, yTL;
  
  /**
  * Constructor for a Sprite object.
  * Sprite objects can only have these hardcoded values
  * as their field values, as the Sprite will always
  * start in the same position.
  */
  Sprite()
  {
    x = 220;
    y = 445;
    w = 40;
    h = 40;
    speedY = 0;
    connected = false;
    g = 0.6;
    space = false;
    xR = x + w / 2;
    yR = y + h / 2;
    xL = x - w / 2;
    yL = y + h / 2;
    xTR = x + w / 2;
    yTR = y - h / 2;
    xTL = x - w / 2;
    yTL = y - h / 2;
  }
  
  /**
  * Determines where the Sprite should be when it lands on a Platform object.
  */
  void land(float platformY)
  {
    speedY = 0;
    connected = true;
    y = platformY - h/2;
  }
  
  /**
  * Updates the Sprite's position accordingly.
  */
  void update()
  {
    if (space && connected)
    {
      speedY = -10;
      connected = false;
    }
    if (!connected)
    {
      speedY += g;
    }
    if (y > height)
    {
      y = 0;
      speedY = 0;
    }
    
    y += speedY;
    yR = y + h / 2;
    yL = y + h / 2;
    yTR = y - h / 2;
    yTL = y - h / 2;
  }
  
  /**
  * Displays the Sprite object.
  */
  void display()
  {
    rectMode(CENTER);
    fill(244, 80, 66);
    stroke(244, 80, 66);
    rect(x, y, w, h);
    rectMode(CORNER);
  }
}
