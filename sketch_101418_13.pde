//Array of Objects for colors -A
RandomColor[] colors=new RandomColor[4];

//integer array for random Stroke weight - A
int [] randStrokeWeight = {5,25,50,100};

//Array of Objects for Stroke Color- A
RandomStroke[] strokes=new RandomStroke[2];

//integer array for background values - A
//int [] backgroundV = {25, 75, 150, 175, 220, 250};
float squareSize = 0;


float radius = 100;


void setup() 
{
  size(2000, 2000);
 
  background(240);
  rectMode(CENTER);
  //unknown or no fixed pattern between each value so cannot use loop
  //declaring rgb values for Fill-A
  colors[0]=new RandomColor(0,0,0,100);//black
  colors[1]=new RandomColor(0,140,250,70);//blue
  colors[2]=new RandomColor(255,255,0,100);//yellow
  colors[3]=new RandomColor (255,255,255,100);//white


  //unknown or no fixed pattern between each so cannot use loop
  //declaring rgb values for Stroke - A
  strokes[0]=new RandomStroke(255,40,20,100);//red
  strokes[1]=new RandomStroke(180,30,90,90);//magenta
}

void draw() 
{
  frameRate(4);
  strokeWeight(0);
  //int bg= (int)random((backgroundV.length-1));
  //fill(backgroundV[k],3);
  //fill(250);
  //rect(width/2, height/2, width, height);
  if(mousePressed && mouseButton==LEFT)
  {
    noStroke();
    int i=(int)random(0,4);
    colors[i].display();
    ellipseMode(CENTER);
    ellipse(mouseX, mouseY, radius, radius);
    radius += 3;
  } 
  else// && mouseButton==LEFT)
  {
    int j=(int)random(0,2);
    strokes[j].display();
    //stroke(180,30,90,90);
    int i=(int)random((randStrokeWeight.length-1));
    strokeWeight(randStrokeWeight[i]);
    strokeCap(SQUARE);
    noFill();
    rectMode(CENTER);
    rect(mouseX, mouseY, squareSize, squareSize);
   squareSize += 3;
  }
}
//class for random colors - A
class RandomColor
{
  int r;
  int k;
  int b;
  int op;
  //constructor
  RandomColor(int red, int black, int blue, int opacity)
  {
    r=red;
    k=black;
    b=blue;
    op=opacity;
  }
  //method for fill
  void display()
  {
    fill(r,k,b,op);
  }
}
class RandomStroke
{
  int r;
  int k;
  int b;
  int op;
  //constructor
  RandomStroke(int red, int black, int blue, int opacity)
  {
    r=red;
    k=black;
    b=blue;
    op=opacity;
  }
  //method for stroke
 void display()
  {
    stroke(r,k,b,op);
  }
}
