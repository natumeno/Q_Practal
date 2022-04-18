void setup() {
  size(500, 500, P3D);
  smooth();
  noFill();
}

void Q_fractal(float Dis,float halfDis,float boxS,float NUM,int time){
  for (int z = 0; z < NUM; z ++) {
    for (int y = 0; y < NUM; y ++) {
      for (int x = 0; x < NUM; x ++) {
        pushMatrix();
        translate(x*Dis-halfDis-time*40, y*Dis-halfDis-time*20, z*Dis-halfDis);
        box(boxS, boxS, boxS);
        popMatrix();
      }
    }
  }
}

void Fractal(float boxType, int time) {
  float Dis=boxType/time;
  float halfDis=Dis*(time-1)/2;
  float boxS=boxType*2/pow(3,(time-1));
  float NUM=pow(3,time-2);

  rotateY(radians(60));
  Q_fractal(Dis,halfDis,boxS,NUM,time);
}

float PT=30;
int KT=6; //再起回数 7以上だと処理が追いつかない

void draw() {
  background(0);
  stroke(255);
  translate(width/2, height/2); //PTとKTの値を変える際、適宜この値をいじるとおもしろい
  Fractal(PT,KT);  //240,3 96,4 60,5 30,6 <-いい感じに見える形
}
