//Array of Objects for colors
RandomColor[] colors=new RandomColor[3];


//Array of Objects for Stroke Color
RandomStroke[] strokes=new RandomStroke[2];
float squareSize = 0;
float radius = 100;
void setup() 
{
  size(2000, 2000);
  background(240);
  rectMode(CENTER);
  strokeCap(SQUARE);
  ellipseMode(CENTER);
  //THE RGB LEVELS AND OPACITY FOR THE CIRCLE(PARAMETERS ARE RED, GREEN, BLUE, OPACITY)
  colors[0]=new RandomColor(0,0,0,100);//black
  colors[1]=new RandomColor(255,255,0,100);//yellow
  colors[2]=new RandomColor (255,255,255,100);//white

  //THE RGB LEVELS AND OPACITY FOR THE STROKE. 
  strokes[0]=new RandomStroke(0,0,0,50);//black
  strokes[1]=new RandomStroke(255,255,255,100);//white

}
void draw() 
{
  
  strokeWeight(0);
  if(mouseButton==RIGHT)
  {
    frameRate(4);
    //growing ellipse on holding mouse
    if(mousePressed)
    {
      noStroke();
      int i=(int)random(0,3);
      colors[i].display();
      ellipse(mouseX, mouseY, radius, radius); 
      radius += 3;
    }
    else//function that will execute when mouse is released
    {
      mouseReleased();
    }
  }
  else
  {
      frameRate(5);
      int j=(int)random(0,2);
      strokes[j].display();
      strokeWeight(1);
      fill(255,0,0,10);
      squareSize=random(100, 500);
      rect(mouseX, mouseY, squareSize, squareSize);
  }
}
//DRAWS CIRCLEs WITH RADIUS 100 WHEN MOUSE IS RELEASED IN CASE OF RIGHT MOUSE AND SQUARES WITH SIZE 100 IN CASE OF LEFT MOUSE
void mouseReleased()
{
      noStroke();
      int i=(int)random(0,3);
      colors[i].display();
      radius=random(100,500);//RANDOMIZING THE CIRCLE SIZE BETWEEN 100 AND 500 
      ellipse(mouseX, mouseY, radius, radius);
 
}
//class for random colors
class RandomColor
{
  int r;
  int g;
  int b;
  int op;
  //constructor
  RandomColor(int red, int green, int blue, int opacity)
  {
    r=red;
    g=green;
    b=blue;
    op=opacity;
  }
  //method for fill
  void display()
  {
    fill(r,g,b,op);
  }
}
//class for Random Srokes
class RandomStroke
{
  int r;
  int g;
  int b;
  int op;
  //constructor
  RandomStroke(int red, int green, int blue, int opacity)
  {
    r=red;
    g=green;
    b=blue;
    op=opacity;
  }
  //method for stroke
 void display()
  {
    stroke(r,g,b,op);
  }
}
