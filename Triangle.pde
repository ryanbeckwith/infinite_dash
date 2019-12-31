/**
* Represents a Triangle object.
* A Triangle object is an isosceles triangle
* that the Sprite cannot intersect without dying.
*
* 5/22/18, CSC 500, Ms. B,
* Final Project.
* @author Ryan Beckwith
*/
class Triangle
{
  /**
  * Fields representing the x-coordinate of the leftmost point of the
  * triangle, the y-coordinate of the leftmost point, the x-coordinate
  * of the middle point, the y-coordinate of the middle point, the
  * x-coordinate of the rightmost point, and the y-coordinate of the
  * rightmost point respectively.
  */
  float x1, y1, x2, y2, x3, y3;
  /**
  * Fields representing the original coordinates of the Triangle object.
  */
  float originalX1, originalY1, originalX2, originalY2, originalX3, originalY3;
  /**
  * Fields representing the speed at which the triangle moves along the
  * x-axis, the width of the triangle (base), and the height of the triangle
  * respectively.
  */
  float xSpeed, w, h;
  /**
  * Field representing whether or not the Sprite is dead.
  */
  boolean isDead;
  
  /**
  * Constructor for a Triangle object.
  * @param x1, the x-coordinate of the leftmost point of the
  * triangle, which corresponds with the x-coordinate of the
  * BOTTOM LEFT corner of the triangle.
  * @param y1, the y-coordinate of the leftmost point of the
  * triangle, which corresponds with the y-coordinate of the
  * BOTTOM LEFT corner of the triangle.
  * @param w, the width (base) of the triangle.
  * @param h, the height of the triangle.
  * @param dead, boolean representing the death state of the Sprite.
  */
  Triangle(float x, float y, float w, float h, boolean dead)
  {
    x1 = x;
    y1 = y;
    this.w = w;
    this.h = h;
    x3 = x1 + w;
    y3 = y1;
    x2 = x1 + w/2;
    y2 = y1 - h;
    xSpeed = -5;
    isDead = dead;
    originalX1 = x1;
    originalY1 = y1;
    originalX2 = x2;
    originalY2 = y2;
    originalX3 = x3;
    originalY3 = y3;
  }
  
  /**
  * Helper method that calculates the area of a triangle
  * based off its three vertices.
  * @param x1, x-coordinate of the leftmost point.
  * @param y1, y-coordinate of the leftmost point.
  * @param x2, x-coordinate of the middle point.
  * @param y2, y-coordinate of the middle point.
  * @param x3, x-coordinate of the rightmost point.
  * @param y3, y-coordinate of the rightmost point.
  * @return the area of the specified triangle as a float.
  */
  float calculateTriangleArea(float x1, float y1, float x2, float y2, float x3, float y3)
  {
    return abs((x1 * (y2 - y3) + x2 * (y3 - y1) + x3 * (y1 - y2)) / 2.0);
  }
  
  /**
  * Checks to see if the Sprite has died by intersecting
  * a Triangle object. The way this is accomplished is that 
  * it checks to see if the bottom right, bottom left, top right,
  * and top left corners are inside the triangle.
  * The way it determines this is by calculating the areas of the
  * intermediate triangles formed by these four points and the 
  * points of the triangle, and if the sum of those areas equals
  * the area of the overall triangle, the point is intersecting 
  * the triangle.
  * @param r1, the Sprite object.
  * @param r2, a Triangle object.
  * @return true if the Sprite object is intersecting the Triangle
  * object, false otherwise.
  */
  boolean isDead(Sprite r1)
  {
    float areaTriangleOverall = calculateTriangleArea(x1, y1, x2, y2, x3, y3);
    float areaFirstSmallTriangleBR = calculateTriangleArea(r1.xR, r1.yR, x2, y2, x3, y3);
    float areaSecondSmallTriangleBR = calculateTriangleArea(x1, y1, r1.xR, r1.yR, x3, y3);
    float areaThirdSmallTriangleBR = calculateTriangleArea(x1, y1, x2, y2, r1.xR, r1.yR);
    
    float areaFirstSmallTriangleBL = calculateTriangleArea(r1.xL, r1.yL, x2, y2, x3, y3);
    float areaSecondSmallTriangleBL = calculateTriangleArea(x1, y1, r1.xL, r1.yL, x3, y3);
    float areaThirdSmallTriangleBL = calculateTriangleArea(x1, y1, x2, y2, r1.xL, r1.yL);
    
    float areaFirstSmallTriangleTR = calculateTriangleArea(r1.xTR, r1.yTR, x2, y2, x3, y3);
    float areaSecondSmallTriangleTR = calculateTriangleArea(x1, y1, r1.xTR, r1.yTR, x3, y3);
    float areaThirdSmallTriangleTR = calculateTriangleArea(x1, y1, x2, y2, r1.xTR, r1.yTR);
    
    float areaFirstSmallTriangleTL = calculateTriangleArea(r1.xTL, r1.yTL, x2, y2, x3, y3);
    float areaSecondSmallTriangleTL = calculateTriangleArea(x1, y1, r1.xTL, r1.yTL, x3, y3);
    float areaThirdSmallTriangleTL = calculateTriangleArea(x1, y1, x2, y2, r1.xTL, r1.yTL);
    
    return (areaTriangleOverall == (areaFirstSmallTriangleBR + areaSecondSmallTriangleBR + areaThirdSmallTriangleBR) ||
            areaTriangleOverall == (areaFirstSmallTriangleBL + areaSecondSmallTriangleBL + areaThirdSmallTriangleBL) ||
            areaTriangleOverall == (areaFirstSmallTriangleTR + areaSecondSmallTriangleTR + areaThirdSmallTriangleTR) ||
            areaTriangleOverall == (areaFirstSmallTriangleTL + areaSecondSmallTriangleTL + areaThirdSmallTriangleTL));
  }
  
  /**
  * Updates the Triangle's position accordingly.
  */
  void update()
  {
    if (!isDead)
    {
      x1 += xSpeed;
      x2 += xSpeed;
      x3 += xSpeed;
    }
  }
  
  /**
  * Returns the Triangle object back to its original coordinate.
  */
  void backToStart()
  {
    x1 = originalX1;
    y1 = originalY1;
    x2 = originalX2;
    y2 = originalY2;
    x3 = originalX3;
    y3 = originalY3;
  }
  
  /**
  * Displays the Triangle object.
  */
  void display()
  {
    fill(triangleR, triangleG, triangleB);
    stroke(triangleR, triangleG, triangleB);
    triangle(x1, y1, x2, y2, x3, y3);
  }
}
