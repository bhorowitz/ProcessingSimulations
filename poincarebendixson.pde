//Demonstration of the Poincare Bendixson Theorem
//Eventually might be expanded to identify such limit cycles in a given set of equations.

// Ben Horowitz (horowitz.ben@gmail.com)


//block resolution
int bh = 34;
int bw = 34;

void setup()
{
  size(600,600);
  fill(255);
  //noStroke();
  colorMode(HSB, 255);
}

float x;
float[][] xp= new float[bw][bh];
float y;
float[][] yp= new float[bw][bh];

void arrow(int x1, int y1, int x2, int y2) {
  line(x1, y1, x2, y2);
  float d = min(dist(x1, y1, x2, y2), 40);
  pushMatrix();
  translate(x2, y2);
  float a = atan2(x1-x2, y2-y1);
  rotate(a);
  line(0, 0, -d/4, -d/4);
  line(0, 0, d/4, -d/4);
  popMatrix();
}

void draw()
{
  stroke(0);
  background(120);
  for(int i=0; i < bw; i+=1)
  {
    for(int j=0; j < bh; j+=1)
    {
      x=(i-bw*0.5)/8;
      y=(j-bh*0.5)/8;
      float xp =(-1*y+x*(1-x*x-y*y));
      float yp = (1*x+y*(1-x*x-y*y));
      int xt=i*width/bw;
      int yt=j*height/bh;
      //float nor=(sqrt((xtp)*(xtp)+(ytp)*(ytp)));
      
      int l;
      l =int( width/(sqrt(bw*bw+bh*bh)))+2;

      arrow(xt,height-yt,xt+int(10*xp),height-(yt+int(10*yp)));
    }
  }
   noFill();
   stroke(180);
      ellipse(width/2,height/2, 4*bw,4*bh);
      ellipse(width/2,height/2, 16*bw,16*bh);
}

