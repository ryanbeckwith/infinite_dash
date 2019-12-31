/**
* Represents a Platform object.
* A Platform object is a type of obstacle that the
* sprite can land on, but cannot run into the front of it.
* Platforms are represented as rectangles.
* 
* 5/22/18, CSC 500, Ms. B,
* Final Project.
* @author Ryan Beckwith
*/
class Platform
{
  /**
  * Fields representing the x coordinate of the top left corner
  * of the Platform, the y coordinate of the top left corner, the
  * width of the platform, and the height of the platform respectively.
  */
  float x, y, w, h;
  /**
  * Fields representing the original x and y coordinates of the Platform
  * object.
  */
  float originalX, originalY;
  /**
  * Field representing the speed at which a Platform object moves
  * across the screen.
  */
  float xSpeed;
  /**
  * Field that holds true if the Sprite is dead,
  * false otherwise.
  */
  boolean isDead;
  /**
  * Field that holds true if the Platform object is the ground,
  * false otherwise.
  */
  boolean isGround;
  
  /**
  * Constructor that initializes a Platform object to the given parameters.
  * @param x1, x coordinate of top left corner.
  * @param y1, y coordinate of top left corner.
  * @param w1, width of Platform.
  * @param h1, height of Platform.
  * @param dead, boolean representing the death state of the Sprite.
  */
  public Platform(float x1, float y1, float w1, float h1, boolean dead)
  {
    x = x1;
    y = y1;
    w = w1;
    h = h1;
    xSpeed = -5;
    isDead = dead;
    originalX = x1;
    originalY = y1;
    isGround = false;
  }
  
  /**
  * Constructor used for the ground.
  * @param x1, x coordinate of top left corner.
  * @param y1, y coordinate of top left corner.
  * @param w1, width of Platform.
  * @param h1, height of Platform.
  * @param dead, boolean representing the death state of the Sprite.
  * @param ground, boolean representing whether or not this object is the ground.
  */
  public Platform(float x1, float y1, float w1, float h1, boolean dead, boolean ground)
  {
    x = x1;
    y = y1;
    w = w1;
    h = h1;
    xSpeed = -5;
    isDead = dead;
    originalX = x1;
    originalY = y1;
    isGround = ground;
  }
  
  /**
  * Checks to see if a Sprite object is intersecting with
  * a Platform object.
  * @return true if the objects are intersecting, false otherwise.
  */
  boolean intersecting(Sprite r1)
  {
    if (r1.x + r1.w/2 > x && r1.x - r1.w/2 <= x + w)
    {
      if (r1.y + r1.h/2 >= y && r1.y + r1.h/2 <= y + h)
      {
        return true;
      }
    }
    return false;
  }
  
  /**
  * Checks to see if the Sprite object has "died", which
  * means it has run into the beginning of a platform.
  * @param r1, the Sprite object.
  * @param r2, a Platform object.
  * @return true if the Sprite object has died, false otherwise.
  */
  boolean isDead(Sprite r1)
  {
    if (r1.x + r1.w/2 >= x - 2 && r1.x + r1.w/2 <= x + 2)
    {
      if (r1.y + r1.h/2 > y + 1 && r1.y + r1.h/2 <= y + h)
      {
        return true;
      }
    }
    return false;
  }
  
  /**
  * Updates the Platform object's position based on where it is on the screen.
  */
  void update(Sprite r1)
  {
    if (!intersecting(r1))
      r1.connected = false;
    if (!isDead)
      x += xSpeed;
  }
  
  /**
  * Returns the Platform object to its original coordinate.
  */
  void backToStart()
  {
    x = originalX;
    y = originalY;
  }
  
  /**
  * Displays the Platform object at the coordinates specified by x and y.
  */
  void display()
  {
    fill(groundR, groundG, groundB);
    stroke(platformR, platformG, platformB);
    if (isGround)
    {
      stroke(groundR, groundG, groundB);
    }
    rect(x, y, w, h);
  }
}
