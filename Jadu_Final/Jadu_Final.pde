RandomColor[] colors=new RandomColor[5];

int [] randStrokeWeight = {5,25,50,100};
RandomStroke[] strokes=new RandomStroke[4];
float squareSize = 100;
float radius = 100;
void setup() 
{
  size(2000, 2000);
  background(240);
  rectMode(CENTER);
  strokeCap(SQUARE);
  ellipseMode(CENTER);
  
  //Not using Loops as color values are rather different and follow an unknown/or non-pattern in variance.
  
  colors[0]=new RandomColor(0,0,0,50);//black
  colors[1]=new RandomColor(0,140,250,70);//blue
  colors[2]=new RandomColor(11,102,35,80);//forest green
  colors[3]=new RandomColor (255,255,255,100);//white
  colors[4]=new RandomColor(255,255,0,100);//yellow

  strokes[0]=new RandomStroke(124,17,126,90);//new purple
  strokes[1]=new RandomStroke(180,30,90,90);//magenta
  strokes[2]=new RandomStroke(52,222,187,90);//teal
  strokes[3]=new RandomStroke(249,166,2,90);//gold
  
  
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
      int i=(int)random(0,5);
      int j=(int)random(0,100);
      
      if(j>20)
      {
        colors[i].display();
      }
      else//adding stroke with a probability of appearing 1 in 5 times
      {
        stroke(0,50);
      }
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
      frameRate(4);
      int j=(int)random(0,4);
      strokes[j].display();
      int i=(int)random((randStrokeWeight.length-1));
      int k=(int)random(0,100);
      
      if(k>20)
      {
        noFill();
      }
      else//having a fill with a probability of appearing 1 in 5 times
      {
        fill(127.5, 127.5, 127.5, 30);
      }
      strokeWeight(randStrokeWeight[i]);
      squareSize=random(100, 500);
      rect(mouseX, mouseY, squareSize, squareSize);
  }
}
//DRAWS CIRCLES WITH RADIUS 100 WHEN MOUSE IS RELEASED IN CASE OF RIGHT MOUSE RELEASE
void mouseReleased()
{
  noStroke();
  int i=(int)random(0,4);
  int j=(int)random(0,100);
  if(j>20)
  {
    colors[i].display();
  }
  else
  {
    stroke(0,50);
  }
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
