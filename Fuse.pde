public class Fuse{
  int number;
  boolean status; //Status is true if fuse is on screen
  int fx;
  int fy;
  int fpx;
  int fpy;
  
  //constructor
  public Fuse(int n, int xm, int ym){
    number = n;
    fx = xm;
    fy = ym;
    fpx = fx*30;
    fpy = fy*30;
    status = true;
  }
  
  void fusePlacement(){
    if(this.status){
      image(fuse,this.fpx,this.fpy,30,60);
    }
    if(matrixPosX == this.fx && ((matrixPosY == this.fy) || (matrixPosY == this.fy +1)) && this.status){
      collectFuse.play();
      fusesNumber++;
      this.status = false;
    }
  }
}
