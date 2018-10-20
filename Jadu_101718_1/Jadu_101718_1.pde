//Array of Objects for colors -A
RandomColor[] colors=new RandomColor[4];

//integer array for random Stroke weight - A
int [] randStrokeWeight = {5,25,50,100};

//Array of Objects for Stroke Color- A
RandomStroke[] strokes=new RandomStroke[2];

float squareSize = 0;
float radius = 100;
void setup() 
{
  size(2000, 2000);
  background(240);
  rectMode(CENTER);
  
  //IF YOU WANT TO CHANGE THE RGB LEVELS AND OPACITY FOR THE CIRCLE, YOU CAN DO IT HERE - A
  colors[0]=new RandomColor(0,0,0,100);//black
  colors[1]=new RandomColor(0,140,250,70);//blue
  colors[2]=new RandomColor(255,255,0,100);//yellow
  colors[3]=new RandomColor (255,255,255,100);//white

  //IF YOU WANT TO CHANGE THE RGB LEVELS AND OPACITY FOR THE STROKE, YOU CAN DO IT HERE. ALSO IF YOU WANT TO ADD A NEW RANDOMSTROKE OR A NEW RANDOMCOLOR FOR THE CIRCLE, LET ME KNOW - A
  strokes[0]=new RandomStroke(255,40,20,100);//red
  strokes[1]=new RandomStroke(180,30,90,90);//magenta
}
void draw() 
{
  frameRate(4);
  strokeWeight(0);
  if(mouseButton==LEFT)
  {
    if(mousePressed)
    {
      noStroke();
      int i=(int)random(0,4);
      colors[i].display();
      ellipseMode(CENTER);
      radius=random(100,1000);//RANDOMIZING THE CIRCLE SIZE - A
      ellipse(mouseX, mouseY, radius, radius); 
    }
    else
    {
      mouseReleased();
    }
  }
  else
  {
    int j=(int)random(0,2);
    strokes[j].display();
    int i=(int)random((randStrokeWeight.length-1));
    strokeWeight(randStrokeWeight[i]);
    strokeCap(SQUARE);
    noFill();
    rectMode(CENTER);
    rect(mouseX, mouseY, squareSize, squareSize);
    squareSize += 4;
  }
}
//DRAWS A CIRCLE WITH RADIUS 100 WHEN MOUSE IS RELEASED - A
void mouseReleased()
{
      noStroke();
      int i=(int)random(0,4);
      colors[i].display();
      ellipseMode(CENTER);
      radius=100;
      ellipse(mouseX, mouseY, radius, radius);
}
//class for random colors
//PLEASE DO NOT CHANGE ANYTHING BEYOND THIS LINE - A
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
    fill(r,g,b,op);//fill function takes red, green, blue values as parameters. Please do not change the names of any variable. That makes no difference, this function will still do rgb even if you call the variables something else - A
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
    stroke(r,g,b,op);//stroke function takes red, green, blue values as parameters. Please do not change the name of any variable. That makes no difference, this function will still do rgb even if you call the variables something else - A
  }
}
