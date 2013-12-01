// Wave equation with a fixed boundary condition
// Ben Horowitz (horowitz.ben@gmail.com)

int bh = 100;
int bw = 100;
float[][] temp = new float[bh][bw];
float[][] tm1 = new float[bh][bw];
float[][] tm2 = new float[bh][bw];
float k = 0.5;


 
void setup()
{
  size(600,600);
  fill(255);
  noStroke();
  //frameRate(1);
  colorMode(HSB, 255);
  intcond();
}

int t;

boolean incircle(float i, float j)
{
  
   float h;
  h= height/bh;
  float w;
  w= width/bw;
  
  float d= min(height,width);
 
 return( ((width/2-j*w)*(width/2-j*w) + (height/2-i*h)*(height/2-i*h))<((d/2-10)*(d/2-10)));
  
}
  

void intcond()
{
 
 for(int i=0; i < bw; i+=1)
  {
      for(int j=0; j < bh; j+=1)
      {
       
      if(!incircle(i,j))
      {
        tm2[i][j]=tm1[i][j]=128;
      }
      /*
      else if(i!=0 && i!=bw-1 && j==0 ||  j==bh-1)
      {
        tm2[i][j]=tm1[i][j]=128;
      }
      */
      else
      {
   
      tm2[i][j]=tm1[i][j]=10;
      }
      }
  }
}

void draw() 
{ 
  int[][] adjust;
 float h;
  h= height/bh;
  float w;
  w= width/bw;
  t=t+1;
  
  for(int i=0; i < bw; i+=1)
  {
    for(int j=0; j < bh; j+=1)
    {
      float x;
      float a;
     
      
      if(!incircle(i,j))
      {
        temp[i][j] = tm1[i][j];
      }
      else
      {
      //a= (tm1[i+1][j]+tm1[i-1][j]+tm1[i][j+1]+tm1[i][j-1])/4;
      temp[i][j] = 2*tm1[i][j] - tm2[i][j] +  (tm1[i+1][j]+tm2[i-1][j]+tm1[i][j+1]+tm2[i][j-1]-4*tm1[i][j]) /4;
      }
      float value = temp[i][j];  
      fill(100, 0, value);
      //fill(value, 255, 255);
      rect(i*w,j*h,w,h);
      tm2[i][j]=tm1[i][j];
      tm1[i][j]=temp[i][j];
    }
    /*
    float[][] swap = tm2;
    tm2 = tm1;
    tm1 = temp;
    temp = swap;
    */
  }

} 

