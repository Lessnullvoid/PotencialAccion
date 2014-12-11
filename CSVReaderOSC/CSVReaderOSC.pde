import java.io.FileReader;
import java.io.FileNotFoundException;
import oscP5.*; 
import netP5.*;
import de.bezier.guido.*;


OscP5 oscP5; 
NetAddress direccionRemota;

BufferedReader mBr = null;
int lastFileRead;
String filename;


int puerto;
String ip;
String[] direccionOsc = {"/csv/AF3","/csv/F7", "/csv/FC5","/csv/T7", "/csv/O1", "/csv/T8", "/csv/FC6", "/csv/F8"};
//String[] direccionOsc = {"/csv/AF3","/csv/F7","/csv/F3","/csv/FC5","/csv/T7","/csv/P7","/csv/O1","/csv/O2","/csv/P8","/csv/T8","/csv/FC6","/csv/F4","/csv/F8","/csv/AF4"};
//Envia al archivo OSCrecibe.pd


void setup() {
  size(500, 300);
  background(200);
  
 selectInput("Select a file to process:", "fileSelected");
 
 
  ip = "127.0.0.1"; //localhost
  puerto = 11113;
  oscP5 = new OscP5(this, puerto);
  direccionRemota = new NetAddress(ip, puerto);
  

 
  lastFileRead = millis();
  
  
}
 
void draw() {
  if (mBr == null) return;

  // leer a cada 5ms
  if (millis()-lastFileRead > 5) {
    try {
      String line = mBr.readLine();
      if (line == null) {
        mBr.close();
        mBr = new BufferedReader(new FileReader(dataPath("fileSelected")));
        mBr.readLine();
      }
 
      // valArray es un array de Strings con los valores
      String[] valArray = line.trim().split("\\s*,\\s*");
      // aqui se saca los valores de float de los Strings
      for (int i=0; i<valArray.length; i++) {
        float f = Float.valueOf(valArray[i]);
        //separar datos por columna para transmitir individualmente
        OscMessage mensaje = new OscMessage(direccionOsc[i]);
        mensaje.add(f); 
        oscP5.send(mensaje, direccionRemota); 
      }
      println();
    }
    catch(Exception e) {}
 
    lastFileRead = millis();
  }
}



