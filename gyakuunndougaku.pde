
float millisOld, gTime, gSpeed = 4;

void IK(){
  float X = posX;
  float Y = posY;
  float Z = posZ;

  angle1 = atan2(Y, X);
  angle2 = atan2((armL1+armL2*cos(angle3))*sqrt(X*X+Y*Y)-armL2*sin(angle3)*(Z-baseH),armL2*sin(angle3)*sqrt(X*X+Y*Y)+(armL1+armL2*cos(angle3))*(Z-baseH));
  angle3 = atan2(-sqrt(1-cos(angle3)*cos(angle3)),cos(angle3));
}
void setTime(){
  gTime += ((float)millis()/1000 - millisOld)*(gSpeed/4);
  if(gTime >= 8)  gTime = 0;  
  millisOld = (float)millis()/1000;
}

void writePos(){
  IK();
  setTime();
  posX = sin(gTime*PI/2)*100;
  posZ = sin(gTime*PI)*100;
}
