public class Ghost{
  int number;
  int gx;
  int gy;
  int gpx;
  int gpy;
  int displacement = 0;
  boolean hasPlayed = false;
  boolean touchedPlayer = false;
  int direction;
  String temp;
  
  //constructor
  public Ghost(int n, int xm, int ym){
    number = n;
    gx = xm;
    gy = ym;
    gpx = gx*30;
    gpy = gy*30;
    direction = int(random(5)); 
  }
  
  void move(){
    image(ghost,this.gpx,this.gpy,90,90);
    for(int j = 0; j<3; j++){
        for(int i = 0; i<3; i++){
            if(matrixPosX == this.gx+i && matrixPosY == this.gy+j){
              touchedPlayer = true;
            };
        }
    }
    /*
    for(int l= 0 ; l<3; l++){
      switch(this.direction){
        case 0: secondaryMatrix[this.gy+3][this.gx+l] = 0;
        case 1: secondaryMatrix[this.gy+l][this.gx-1] = 0;
        case 2: secondaryMatrix[this.gy-1][this.gx+l] = 0;
        case 3: secondaryMatrix[this.gy+l][this.gx+3] = 0;
      }
    }
    */
    if(touchedPlayer && !hasPlayed){
      death.play();
      hasPlayed = true;
      bMusic.stop();
      playing = false;
      freeze = true;
      won = false;
    }
    
    
    //Part to make the ghost move in square
    //0 = up, 1 = right, 2 = down, 3 = left
    if(counter%10 == 0){
      if(this.direction == 0 && this.displacement < 6){
        this.gpy -= 30;
        this.gy -= 1;
        this.displacement += 1;
      } else if(this.direction == 1 && this.displacement != 6) {
        this.gpx += 30 ;
        this.gx += 1;
        this.displacement++;
      } else if(this.direction == 2 && this.displacement != 6) {
        this.gpy += 30;
        this.gy += 1;
        this.displacement++;
      } else if(this.direction == 3 && this.displacement != 6) {
        this.gpx -= 30 ;
        this.gx -= 1;
        this.displacement++;
      } else if(this.direction == 3 && this.displacement == 6){
        this.direction = 0;
        this.displacement = 0;
      } else if(this.displacement >= 6) {
        this.direction ++;
        this.displacement = 0;
      }
    }
  }
}
