// N-Body Simulation including gravity and "sticky" collisions

// Ben Horowitz (horowitz.ben@gmail.com)

int bh = 100;
int bw = 100;
int n = 60;
float a = 0.0000000002*10; //transfer coefficient
float[] pos_x = new float[n];
float[] pos_y = new float[n];
float[] vel_x = new float[n];
float[] vel_y = new float[n];
float[] mass = new float[n];
float k = 0.5; //collision radius


 
void setup()
{
  size(700,700);
  fill(255);
  noStroke();
  frameRate(40);
  colorMode(HSB, 255);
  intcond();
}

int t=0;

void intcond()
{
\\ initial conditions of the system
  fill(255);
  
 float h;
  h= height/bh;	
  float w;
  w= width/bw;
  
 for(int i=0; i < n; i+=1)
  {
    pos_x[i]=int(random(width/2))+width/4;   
    pos_y[i]=int(random(height/2))+height/4;
    vel_x[i]=0.01*(int(random(4))-2)+200*(width/2-pos_y[i]+1)/(pos_x[i]*pos_x[i]+pos_y[i]*pos_y[i]); 
    vel_y[i]=0.01*(int(random(4))-2)-200*(height/2-pos_x[i]+1)/(pos_x[i]*pos_x[i]+pos_y[i]*pos_y[i]);   
    mass[i]=int(random(4));
  }
}

void draw() 
{ 
  fill(255);
  rect(0,0,width,height);
  
  int[][] adjust;
 float h;
  h= height/bh;
  float w;
  w= width/bw;
  
  for(int i=0; i < n; i+=1)
  {
    float dv_x = 0;
    float dv_y = 0;
    for(int j=0; j < n; j+=1){
    \\equation of motion
    	 dv_x = dv_x - a*(pos_x[i] - pos_x[j])*mass[i]*mass[j];
    	 dv_y = dv_y - a*(pos_y[i] - pos_y[j])*mass[j]*mass[i];
   
	 pos_x[i] = pos_x[i] + vel_x[i]/20;
    	 pos_y[i] = pos_y[i] + vel_y[i]/20;
    	 vel_x[i] = vel_x[i] + dv_x;
    	 vel_y[i] = vel_y[i] + dv_y;
	 \\collisions
    	 if(pos_x[i]-pos_x[j] < mass[i]/2 & pos_x[i]-pos_x[j]>0){
   	       if(pos_y[i]-pos_y[j] < mass[i]/2 & pos_y[i]-pos_y[j]>0){
      	           mass[i]=mass[i]+mass[j];
      		   mass[j]=0;
      		   vel_x[i]= (mass[i]*vel_x[i]+mass[j]*vel_x[j])/(mass[i]+mass[j]);
      		   vel_y[i]= (mass[i]*vel_y[i]+mass[j]*vel_y[j])/(mass[i]+mass[j]);
   		    }
   	 }
    }
  }
  float x_a = 0;
  float y_a = 0;
  int U = 0;
  for(int i=0; i<n; i+=1){
    if(mass[i]>0){
      U+=1;
      x_a = x_a + pos_x[i];
      y_a = y_a + pos_y[i];
    }
  }
  float x_av = x_a/U;
  float y_av = y_a/U;
  \\draw the boxes
  for(int i=0; i<n; i+=1){
  if(pos_x[i]<width){
      if(pos_y[i]<height){
        if(mass[i]>0){
        int x = int(pos_x[i] - (width/2 - x_av));
        int y = int(pos_y[i] - (height/2 - y_av));
        fill(5*i, 255, 255);
        rect(x,y,2*mass[i],2*mass[i]);
        }
      }
    }
  }
}


