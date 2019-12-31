import java.util.ArrayList;
/**
* The FinalProject file represents the overarching
* file that brings all aspects of the game together.
* The game defined in this file and the related class
* files is an interpretation of the popular mobile game
* "Geometry Dash", in which the player controls a cube
* and tries to navigate it through a set of obstacles
* solely through jumping.
* 
* 5/22/18, CSC 500, Ms. B,
* Final Project.
* @author Ryan Beckwith
*/
/**
* Represents the square as a Sprite object.
*/
Sprite s;
/**
* Represents the ground of the game, which is an immobile platform.
*/
Platform ground;
/**
* Field that holds true if the space key is pressed down,
* false otherwise.
*/
boolean space;
/**
* Float that holds the y-coordinate of the ground.
*/
float groundLevel;
/**
* ArrayList of Obstacle objects, holds all the obstacles.
*/
ArrayList<Obstacle> obstacles;
/**
* The starting time, in milliseconds, of the game.
*/
long startingTime;
/**
* Integer that gets a value of a random, offscreen obstacle to display next.
*/
int randomObstacleIndex;
/**
* Integers for the background RGB values.
*/
int backgroundR, backgroundG, backgroundB;
/**
* Integers for the ground RGB values.
*/
int groundR, groundG, groundB;
/**
* Integers for the platform RGB values.
*/
int platformR, platformG, platformB;
/**
* Integers for the triangle RGB values.
*/
int triangleR, triangleG, triangleB;
/**
* Final integer representing how fast the color transition occurs.
*/
final int CHANGE_CONSTANT = 5;

/**
* Acts as a "constructor" of sorts for the FinalProject file.
* Initializes all fields to appropriate values and objects,
* and sets the size and background of the window.
*/
void setup()
{
  groundLevel = 425;
  s = new Sprite();
  obstacles = new ArrayList<Obstacle>();
  space = false;
  ground = new Platform(0, groundLevel + 40, width, height, false, true);
  
  Platform p = new Platform(width, groundLevel, 400, 40, false);
  Triangle t = new Triangle(width + p.w/2, groundLevel, 40, 40, false);
  Triangle t2 = new Triangle(width + p.w/2 + 40, groundLevel, 40, 40, false);
  ArrayList<Platform> ps = new ArrayList<Platform>();
  ArrayList<Triangle> ts = new ArrayList<Triangle>();
  ps.add(p);
  ts.add(t);
  ts.add(t2);
  Obstacle o = new Obstacle(ps, ts);
  obstacles.add(o);
  
  Platform p2 = new Platform(width + 800, groundLevel, 40, 40, false);
  Platform p3 = new Platform(width + 960, groundLevel - 40, 40, 80, false);
  Platform p4 = new Platform(width + 1120, groundLevel - 80, 40, 120, false);
  Triangle t3 = new Triangle(width + 840, groundLevel + 40, 40, 20, false);
  Triangle t4 = new Triangle(width + 880, groundLevel + 40, 40, 20, false);
  Triangle t5 = new Triangle(width + 920, groundLevel + 40, 40, 20, false);
  Triangle t6 = new Triangle(width + 1000, groundLevel + 40, 40, 20, false);
  Triangle t7 = new Triangle(width + 1040, groundLevel + 40, 40, 20, false);
  Triangle t8 = new Triangle(width + 1080, groundLevel + 40, 40, 20, false);
  ArrayList<Platform> ps2 = new ArrayList<Platform>();
  ArrayList<Triangle> ts2 = new ArrayList<Triangle>();
  ps2.add(p2);
  ps2.add(p3);
  ps2.add(p4);
  ts2.add(t3);
  ts2.add(t4);
  ts2.add(t5);
  ts2.add(t6);
  ts2.add(t7);
  ts2.add(t8);
  Obstacle o2 = new Obstacle(ps2, ts2);
  obstacles.add(o2);
  
  Platform p5 = new Platform(width + 1240, groundLevel, 400, 40, false);
  ArrayList<Platform> ps3 = new ArrayList<Platform>();
  ArrayList<Triangle> ts3 = new ArrayList<Triangle>();
  ps3.add(p5);
  Obstacle o3 = new Obstacle(ps3, ts3);
  obstacles.add(o3);
  
  Platform p6 = new Platform(width + 1800, groundLevel, 40, 40, false);
  Platform p7 = new Platform(width + 1880, groundLevel - 160, 40, 40, false);
  Triangle t9 = new Triangle(width + 1760, groundLevel + 40, 40, 40, false);
  Triangle t10 = new Triangle(width + 1720, groundLevel + 40, 40, 40, false);
  Triangle t11 = new Triangle(width + 1880, groundLevel - 120, 40, -40, false);
  ArrayList<Platform> ps4 = new ArrayList<Platform>();
  ArrayList<Triangle> ts4 = new ArrayList<Triangle>();
  ps4.add(p6);
  ps4.add(p7);
  ts4.add(t9);
  ts4.add(t10);
  ts4.add(t11);
  Obstacle o4 = new Obstacle(ps4, ts4);
  obstacles.add(o4);
  
  Platform p8 = new Platform(width + 2000, groundLevel, 600, 40, false);
  Platform p9 = new Platform(width + 2120, groundLevel - 40, 360, 40, false);
  Platform p10 = new Platform(width + 2240, groundLevel - 160, 120, 40, false); 
  Triangle t12 = new Triangle(width + 2240, groundLevel - 120, 40, -39, false);
  Triangle t13 = new Triangle(width + 2280, groundLevel - 120, 40, -39, false);
  Triangle t14 = new Triangle(width + 2320, groundLevel - 120, 40, -39, false);
  ArrayList<Platform> ps5 = new ArrayList<Platform>();
  ArrayList<Triangle> ts5 = new ArrayList<Triangle>();
  ps5.add(p8);
  ps5.add(p9);
  ps5.add(p10);
  ts5.add(t12);
  ts5.add(t13);
  ts5.add(t14);
  Obstacle o5 = new Obstacle(ps5, ts5);
  obstacles.add(o5);
  
  Platform p11 = new Platform(width + 2720, groundLevel, 80, 40, false);
  Platform p12 = new Platform(width + 2880, groundLevel - 60, 40, 20, false);
  Platform p13 = new Platform(width + 3040, groundLevel - 80, 40, 20, false);
  Triangle t15 = new Triangle(width + 2800, groundLevel + 40, 40, 20, false);
  Triangle t16 = new Triangle(width + 2840, groundLevel + 40, 40, 20, false);
  Triangle t17 = new Triangle(width + 2880, groundLevel + 40, 40, 20, false);
  Triangle t18 = new Triangle(width + 2920, groundLevel + 40, 40, 20, false);
  Triangle t19 = new Triangle(width + 2960, groundLevel + 40, 40, 20, false);
  Triangle t20 = new Triangle(width + 3000, groundLevel + 40, 40, 20, false);
  Triangle t21 = new Triangle(width + 3240, groundLevel + 40, 40, 40, false);
  Triangle t22 = new Triangle(width + 3280, groundLevel + 40, 40, 40, false);
  ArrayList<Platform> ps6 = new ArrayList<Platform>();
  ArrayList<Triangle> ts6 = new ArrayList<Triangle>();
  ps6.add(p11);
  ps6.add(p12);
  ps6.add(p13);
  ts6.add(t15);
  ts6.add(t16);
  ts6.add(t17);
  ts6.add(t18);
  ts6.add(t19);
  ts6.add(t20);
  ts6.add(t21);
  ts6.add(t22);
  Obstacle o6 = new Obstacle(ps6, ts6);
  obstacles.add(o6);
  
  Platform p14 = new Platform(width + 3480, groundLevel, 40, 40, false);
  Platform p15 = new Platform(width + 3600, groundLevel - 80, 40, 40, false);
  Platform p16 = new Platform(width + 3720, groundLevel, 40, 40, false);
  Platform p17 = new Platform(width + 3840, groundLevel - 40, 40, 40, false);
  Triangle t23 = new Triangle(width + 3440, groundLevel + 40, 40, 40, false);
  Triangle t24 = new Triangle(width + 3600, groundLevel - 40, 40, -39, false);
  Triangle t25 = new Triangle(width + 3680, groundLevel + 40, 40, 40, false);
  Triangle t26 = new Triangle(width + 3840, groundLevel - 40, 40, 20, false);
  ArrayList<Platform> ps7 = new ArrayList<Platform>();
  ArrayList<Triangle> ts7 = new ArrayList<Triangle>();
  ps7.add(p14);
  ps7.add(p15);
  ps7.add(p16);
  ps7.add(p17);
  ts7.add(t23);
  ts7.add(t24);
  ts7.add(t25);
  ts7.add(t26);
  Obstacle o7 = new Obstacle(ps7, ts7);
  obstacles.add(o7);
  
  Platform p18 = new Platform(width + 4040, groundLevel, 40, 40, false);
  Platform p19 = new Platform(width + 4200, groundLevel - 40, 40, 80, false);
  Platform p20 = new Platform(width + 4400, groundLevel - 20, 40, 20, false);
  Platform p21 = new Platform(width + 4440, groundLevel, 40, 40, false);
  Platform p22 = new Platform(width + 4480, groundLevel - 20, 40, 20, false);
  Platform p23 = new Platform(width + 4640, groundLevel - 200, 40, 40, false);
  Triangle t27 = new Triangle(width + 4400, groundLevel, 40, -20, false);
  Triangle t28 = new Triangle(width + 4440, groundLevel, 40, 40, false);
  Triangle t29 = new Triangle(width + 4480, groundLevel, 40, -20, false);
  Triangle t30 = new Triangle(width + 4640, groundLevel + 40, 40, 40, false);
  Triangle t31 = new Triangle(width + 4640, groundLevel - 160, 40, -40, false);
  ArrayList<Platform> ps8 = new ArrayList<Platform>();
  ArrayList<Triangle> ts8 = new ArrayList<Triangle>();
  ps8.add(p18);
  ps8.add(p19);
  ps8.add(p20);
  ps8.add(p21);
  ps8.add(p22);
  ps8.add(p23);
  ts8.add(t27);
  ts8.add(t28);
  ts8.add(t29);
  ts8.add(t30);
  ts8.add(t31);
  Obstacle o8 = new Obstacle(ps8, ts8);
  obstacles.add(o8);
  
  Platform p24 = new Platform(width + 4920, groundLevel, 40, 40, false);
  Platform p25 = new Platform(width + 5080, groundLevel - 40, 40, 40, false);
  Platform p26 = new Platform(width + 5240, groundLevel - 80, 40, 40, false);
  Platform p27 = new Platform(width + 5400, groundLevel - 120, 40, 40, false);
  Platform p29 = new Platform(width + 5480, groundLevel - 40, 40, 80, false);
  Platform p30 = new Platform(width + 5560, groundLevel, 40, 40, false);
  Platform p31 = new Platform(width + 5560, groundLevel - 160, 40, 40, false);
  Triangle t32 = new Triangle(width + 5080, groundLevel, 40, -40, false);
  Triangle t33 = new Triangle(width + 5240, groundLevel - 40, 40, -40, false);
  Triangle t34 = new Triangle(width + 5240, groundLevel + 40, 40, 40, false);
  Triangle t35 = new Triangle(width + 5400, groundLevel - 80, 40, -40, false);
  Triangle t36 = new Triangle(width + 5400, groundLevel + 40, 40, 40, false);
  Triangle t39 = new Triangle(width + 5560, groundLevel - 160, 40, 40, false);
  ArrayList<Platform> ps9 = new ArrayList<Platform>();
  ArrayList<Triangle> ts9 = new ArrayList<Triangle>();
  ps9.add(p24);
  ps9.add(p25);
  ps9.add(p26);
  ps9.add(p27);
  ps9.add(p29);
  ps9.add(p30);
  ps9.add(p31);
  ts9.add(t32);
  ts9.add(t33);
  ts9.add(t34);
  ts9.add(t35);
  ts9.add(t36);
  ts9.add(t39);
  Obstacle o9 = new Obstacle(ps9, ts9);
  obstacles.add(o9);
  
  startingTime = System.currentTimeMillis();
  randomObstacleIndex = 0;

  backgroundR = 66;
  backgroundG = 194;
  backgroundB = 244;
  platformR = 66;
  platformG = 244;
  platformB = 89;
  groundR = 66;
  groundG = 244;
  groundB = 89;
  triangleR = 255;
  triangleG = 153;
  triangleB = 10;
  size(1000, 600);
  background(backgroundR, backgroundG, backgroundB);
}

/**
* Checks to see if the space key has been pressed down,
* and adjusts space accordingly.
*/
void keyPressed()
{
  if (keyCode == ' ')
  {
    space = true;
  }
}

/**
* Checks to see if the space key has been released, and adjusts
* space accordingly.
*/
void keyReleased()
{
  if (keyCode == ' ')
  {
    space = false;
  }
}

/**
* Checks to see if the obstacle at the given index is offscreen.
* @param index, the index of the obstacle to check.
* @return true if the obstacle is offscreen, false otherwise.
*/
boolean isOffscreen(int index)
{
  if (obstacles.get(index).largestX < 0)
    return true;
  return false;
}

/**
* Draw method for the FinalProject file,
* acts as the main method.
* Displays all objects and runs the game.
*/
void draw()
{
  if ((System.currentTimeMillis() - startingTime) / 1000 % 20 > 10 && s.w > 0)
  {
    if (backgroundR > 0)
      backgroundR -= CHANGE_CONSTANT;
    if (backgroundG > 0)
      backgroundG -= CHANGE_CONSTANT;
    if (backgroundB > 0)
      backgroundB -= CHANGE_CONSTANT;
      
    if (groundR > 0)
      groundR -= CHANGE_CONSTANT;
    if (groundG > 0)
      groundG -= CHANGE_CONSTANT;
    if (groundB > 0)
      groundB -= CHANGE_CONSTANT;
      
    if (platformR < 255)
      platformR += CHANGE_CONSTANT;
    if (platformG < 255)
      platformG += CHANGE_CONSTANT;
    if (platformB < 255)
      platformB += CHANGE_CONSTANT;
      
    if (triangleR < 255)
      triangleR += CHANGE_CONSTANT;
    if (triangleG < 255)
      triangleG += CHANGE_CONSTANT;
    if (triangleB < 255)
      triangleB += CHANGE_CONSTANT;
  }
  else if (s.w > 0)
  {
    if (backgroundR < 66)
      backgroundR += CHANGE_CONSTANT;
    if (backgroundG < 194)
      backgroundG += CHANGE_CONSTANT;
    if (backgroundB < 244)
      backgroundB += CHANGE_CONSTANT;
      
    if (groundR < 66)
      groundR += CHANGE_CONSTANT;
    if (groundG < 244)
      groundG += CHANGE_CONSTANT;
    if (groundB < 89)
      groundB += CHANGE_CONSTANT;
      
    if (platformR > 66)
      platformR -= CHANGE_CONSTANT;
    if (platformG > 244)
      platformG -= CHANGE_CONSTANT;
    if (platformB > 89)
      platformB -= CHANGE_CONSTANT;
      
    if (triangleR > 255)
      triangleR -= CHANGE_CONSTANT;
    if (triangleG > 153)
      triangleG -= CHANGE_CONSTANT;
    if (triangleB > 10)
      triangleB -= CHANGE_CONSTANT;
  }
  background(backgroundR, backgroundG, backgroundB);
  s.space = space;
  pushMatrix();
  s.display();
  popMatrix();
  ground.display();
  for (Obstacle o : obstacles)
  {
    o.display();
  }
  
  if (ground.intersecting(s))
  {
    s.land(ground.y);
  }
  else 
  {
    for (Obstacle o : obstacles)
    {
      if (o.intersectingPlatform(s))
      {
        o.landSprite(s);
      }
    }
  }
  
  for (Obstacle o : obstacles)
  {
    if (o.isDead(s))
    {
      for (Obstacle o1 : obstacles)
      {
        o1.setDead();
      }
      s.w = 0;
      s.h = 0;
    }
  }
  s.update();
  
  if (obstacles.get(obstacles.size() - 1).largestX <= width - 120)
  {
    randomObstacleIndex = (int)(Math.random() * obstacles.size());
    if (isOffscreen(randomObstacleIndex))
    {
      obstacles.get(randomObstacleIndex).backToStart();
    }
  }
  
  for (Obstacle o : obstacles)
  {
    o.update(s);
  }
}
