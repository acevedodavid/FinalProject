void lines(){
  //vertical lines
  for(int i = 0; i<= width; i++){
    rect(i*30,0,1,600);
  }
  //horizontal lines
  for(int i = 0; i<= width; i++){
    rect(0,i*30,600,1);  
  }
}
