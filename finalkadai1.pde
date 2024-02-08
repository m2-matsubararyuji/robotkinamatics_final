float baseH = 60;
float armL1 = 40;
float armL2 = 40;
float handL = 25;
float armW1 = 10;
float armW2 = 10;
float handW3 = 5;
float handR;
float rotX, rotY;
float posX=1, posY=50, posZ=50;
float angle1 ;
float angle2 ;
float angle3 ;
float dif = 0.5;

void setup() {
  size(1200, 800, P3D);
  //background(255);

  camera(150, 200, 150, 0, 0, 0, 0, 0,-1);

  noStroke();  
}


void draw(){ 
   writePos();
   background(255);
   smooth();
   lights();
   
   fill(#FFE308); 
   noStroke();
   
   //rotateX(rotX);
   //rotateY(-rotY); 
   if(keyPressed){
     if (key == 's') {
      handR = handR + dif;
    }
    if (key == 'a') {
      handR = handR - dif;
    }
   }
   
   if(handR>0){
     handR=0;
   }
   if(handR<-handL/2+handW3/4){
     handR=-handL/2+handW3/4;
   
   }
     
   
      rotateZ(angle1);
      translate(0, 0, baseH/2);
    fill(175);
  box(10, 10, baseH);
     
   translate(0,0,baseH/2);
   rotateX(angle2);
    translate(0, 0 , armL1/2);
     fill(150);
  box(armW1, armW1, armL1);
      
   //2nd link
  //go to 2nd joint
  translate(0, 0,armL2/2);
  rotateX(radians(angle3));
  translate(0,armL2/2, 0);
  fill(125);
  box(armW2, armL2, armW2);
  
  //hand
  translate(0,armL2/2+handW3/2,0);
  box(handL,handW3,handW3);
  pushMatrix();
  translate(handL/2+handR,handL/4,0);
  box(handW3,handL/2,handW3);
  popMatrix();
  translate(-handL/2-handR,handL/4,0);
  box(handW3,handL/2,handW3);
  
  
  
  

   
   
}
