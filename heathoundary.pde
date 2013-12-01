//Heat Differential Equations Visualization
//Currently shows thermalization of a block with originally randomly generated internal temperatures. Can be later altered to follow a given distribution.

// Ben Horowitz (horowitz.ben@gmail.com)

int bh = 300;
int bw = 300;
int[][] temp = new int[bh][bw];
int[][] temp1 = new int[bh][bw];
int mint=0;
int maxt=100;
float k = 0.5;


 
void setup()
{
  size(600,600);
  fill(255);
  frameRate(80);
  noStroke();
  colorMode(HSB, 255);
  intcond();
}

int t;


  

void intcond()
{
  
  
 float h;
  h= height/bh;
  float w;
  w= width/bw;
  
 for(int i=0; i < bw; i+=1)
  {
      for(int j=0; j < bh; j+=1)
      {
       
        
       if(i==0 || i==bw-1 || j==0 ||  j==bh-1)
      {
        temp[i][j]=10;
        temp1[i][j]=10;
      }
      else
      {
       temp[i][j] = int(random(256));
       temp1[i][j]= temp[i][j];
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
  
  for(int i=0; i*w < width; i+=1)
  {
    for(int j=0; j*h < height; j+=1)
    {
      int x;
      int a;
     
      if(i==0 || i==bw-1 || j==0 ||  j==bh-1)
      {
        a=temp[i][j];
      }
      else
      {
      a= (temp1[i+1][j]+temp1[i-1][j]+temp1[i][j+1]+temp1[i][j-1])/4;
      }
      
      x = temp[i][j] - a;
      temp[i][j] = int(temp[i][j] - k*x);
      float value = temp[i][j];  
      fill(value, 255, 255);
      rect(i*w,j*h,w,h);
      
    }
    
  }

   for(int i=0; i*w < width; i+=1)
  {
    for(int j=0; j*h < height; j+=1)
    {
      temp1[i][j]=temp[i][j];
    }
  }
} 

