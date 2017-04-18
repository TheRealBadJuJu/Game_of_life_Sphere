Cells c;
Texture t;
int cellCount = 10;
int time = 100;
int lastTime = 0;
float RotateX = 0;
float RotateY = 0;
float rotateXMag = 0;
float rotateYMag = 0;
PShape Sphere;
PImage tex;
String Tex;
int[][] cells;
int[][] cellBuffer;
float isaliveProbability = 60;
color Alive = color(0, 255, 0);
color Dead = color(0);
int isAlive;

void setup()
{
  noStroke();
  Sphere = createShape(SPHERE, 500);
  mouseX = width/2;
  mouseY = height/2;
  noCursor();
  fullScreen(P3D);
  noSmooth();
  background(255);
  c = new Cells();
  t = new Texture();
  cells = new int [width/cellCount][height/cellCount];
  cellBuffer = new int [width/cellCount][height/cellCount];
  for (int i=0; i<width/cellCount; i++)
  {
    for (int j=0; j<height/cellCount; j++)
    {
      float IsAlive = random(100);
      if (IsAlive > isaliveProbability)
      {
        isAlive = 0;
      } else
      {
        isAlive = 1;
      }
      cells[i][j] = isAlive;
    }
  }
}

void draw()
{
  c.updateCells();
  c.drawCells();
  tex = get();
  background(0);
  t.textureSphere();
  t.draw();
}

void keyPressed()
{
  if (key == CODED)
  {
    if (keyCode == UP)
    {
      rotateXMag = 0.01;
    }
    if (keyCode == DOWN)
    {
      rotateXMag = -0.01;
    }
    if (keyCode == RIGHT)
    {
      rotateYMag = 0.01;
    }
    if (keyCode == LEFT)
    {
      rotateYMag = -0.01;
    }
  }
}

void keyReleased()
{
  if (key == CODED)
  {
    if (keyCode == UP)
    {
      rotateXMag = 0;
    }
    if (keyCode == DOWN)
    {
      rotateXMag = 0;
    }
    if (keyCode == RIGHT)
    {
      rotateYMag = 0;
    }
    if (keyCode == LEFT)
    {
      rotateYMag = 0;
    }
  }
}