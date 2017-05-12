import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.io.FileOutputStream;

PImage bg;
int c;
int[][] mainMatrix = new int[168][71];
String fileName = "limitsMatrix";
File file = new File(fileName);
PrintWriter outputStream = null;

void setup(){
  bg = loadImage("mapbw.png");
  //check all x's
  for(int n = 0; n<168; n++){
    //check all y's
    for(int m = 0; m<71; m++){
      //check all x pixels of the square
      for(int i = 0; i< 30; i++){
        //check all y pixels of the square
        for(int j = 0; j<30; j++){
          c = bg.get(n*30+i, m*30+j);
          
          //if the square has a pixel from the input color then
          //the square is marked
          if(c == -16777216){
            mainMatrix[n][m] = 1;
          }
          c= 0;
        }
      }
    }
  } 
      try{
            if (!file.exists()){
                outputStream = new PrintWriter(fileName);
            } else {
                outputStream = new PrintWriter(new FileOutputStream(fileName, true));
            }
            if (file.canWrite() == true){
              for(int l = 0; l<168; l++){
                for(int k = 0; k<71; k++){
                  outputStream.println(mainMatrix[l][k]);
                }
              }  
            } else {
            }
        }
        catch(Exception e){
            System.out.println("Error opening or creating file" + fileName);
        }
        outputStream.close();
}

