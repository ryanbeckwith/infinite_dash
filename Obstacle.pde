import java.util.ArrayList;
/**
* Represents an Obstacle object.
* An Obstacle object is a collection
* of Platform and Triangle objects that
* moves as one congruous obstacle.
*
* 5/23/18, CSC 500, Ms. B,
* Final Project.
* @author Ryan Beckwith
*/
class Obstacle
{
  /**
  * ArrayList of Platform objects that holds all Platform objects in the Obstacle.
  */
  ArrayList<Platform> platforms;
  /**
  * ArrayList of Triangle objects that holds all Triangle objects in the Obstacle.
  */
  ArrayList<Triangle> triangles;
  /**
  * Field representing the total width of the Obstacle.
  */
  float w;
  /**
  * Fields representing the smallest x-coordinate and largest x-coordinate of the
  * Obstacle respectively.
  */
  float smallestX, largestX;
  
  /**
  * Constructor for an Obstacle object.
  * @param ps, the ArrayList of Platform objects.
  * @param ts, the ArrayList of Triangle objects.
  */
  Obstacle(ArrayList<Platform> ps, ArrayList<Triangle> ts)
  {
    platforms = new ArrayList<Platform>();
    triangles = new ArrayList<Triangle>();
    for (Platform p: ps)
    {
      platforms.add(p);
    }
    for (int i = 0; i < ts.size(); i++)
    {
      triangles.add(ts.get(i));
    }
    w = calculateWidth();
    smallestX = calculateMinX();
    largestX = smallestX + w;
  }
  
  /**
  * Checks to see if the Sprite object has died by running into
  * any of the platforms or triangles in the Obstacle.
  * @param r1, the Sprite object.
  * @return true if the Sprite has died, false otherwise.
  */
  boolean isDead(Sprite r1)
  {
    for (int i = 0; i < platforms.size(); i++)
    {
      if (platforms.get(i).isDead(r1))
        return true;
    }
    for (int i = 0; i < triangles.size(); i++)
    {
      if (triangles.get(i).isDead(r1))
        return true;
    }
    return false;
  }
  
  /**
  * Lands the sprite on the appropriate platform in the Obstacle.
  * @param r1, the Sprite object.
  */
  void landSprite(Sprite r1)
  {
    for (int i = 0; i < platforms.size(); i++)
    {
      if (platforms.get(i).intersecting(r1))
        r1.land(platforms.get(i).y);
    }
  }
  
  /**
  * Checks to see if the Sprite is intersecting any of the platforms
  * in the Obstacle.
  * @param r1, the Sprite object.
  * @return true if the Sprite is intersecting a platform, false otherwise.
  */
  boolean intersectingPlatform(Sprite r1)
  {
    for (int i = 0; i < platforms.size(); i++)
    {
      if (platforms.get(i).intersecting(r1))
        return true;
    }
    return false;
  }
  
  /**
  * Sets all the Platform and Triangle objects to their dead states.
  */
  void setDead()
  {
    for (int i = 0; i < platforms.size(); i++)
    {
      platforms.get(i).isDead = true;
    }
    for (int i = 0; i < triangles.size(); i++)
    {
      triangles.get(i).isDead = true;
    }
  }
  
  /**
  * Calculates the total width of the Obstacle.
  * @return the width of the Obstacle.
  */
  float calculateWidth()
  {
    float maxX = Integer.MIN_VALUE;
    float minX = Integer.MAX_VALUE;
    for (Platform p : platforms)
    {
      if (p.x + p.w > maxX)
        maxX = p.x + p.w;
      if (p.x < minX)
        minX = p.x;
    }
    for (Triangle t : triangles)
    {
      if (t.x3 > maxX)
        maxX = t.x3;
      if (t.x1 < minX)
        minX = t.x1;
    }
    return maxX - minX;
  }
  
  /**
  * Calculates the value of the smallest x-coordinate in the Obstacle.
  * @return minX, the smallest x-coordinate.
  */
  float calculateMinX()
  {
    float minX = Integer.MAX_VALUE;
    for (Platform p : platforms)
    {
      if (p.x < minX)
        minX = p.x;
    }
    for (Triangle t : triangles)
    {
      if (t.x1 < minX)
        minX = t.x1;
    }
    return minX;
  }
  
  /**
  * Updates the Obstacle (all its Platform and Triangle objects) with
  * respect to the Sprite object.
  * @param r1, the Sprite object.
  */
  void update(Sprite r1)
  {
    if (smallestX >= -w)
    {
      for (int i = 0; i < platforms.size(); i++)
      {
        platforms.get(i).update(r1);
      }
      for (int i = 0; i < triangles.size(); i++)
      {
        triangles.get(i).update();
      }
      smallestX = calculateMinX();
      largestX = smallestX + w;
    }
  }
  
  /**
  * Returns all Platform and Triangle objects to their original positions.
  */
  void backToStart()
  {
    for (Platform p : platforms)
    {
      p.backToStart();
    }
    for (Triangle t : triangles)
    {
      t.backToStart();
    }
    smallestX = calculateMinX();
    largestX = smallestX + w;
  }
  
  /**
  * Displays the Obstacle.
  */
  void display()
  {
    for (int i = 0; i < platforms.size(); i++)
    {
      platforms.get(i).display();
    }
    for (int i = 0; i < triangles.size(); i++)
    {
      triangles.get(i).display();
    }
  }
}
