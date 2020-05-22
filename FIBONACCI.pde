import netP5.*;
import oscP5.*;


//este es el objeto que recibe
OscP5 oscP5;

//esta será la dirección donde voy a enviar mis mensajes
NetAddress direccionRemota;

int secuencia;

void setup() {
   size(600,600);
   //inicializo el objeto oscPs, el parámetro es el puerto donde va a escuchar los mensajes entrantes
  oscP5 = new OscP5(this, 12000);

  // inicializo el objeto NetAddress pasando la dirección IP y el puerto de los mensajes salientes
  // 127.0.0.1 es mi localhost
  direccionRemota = new NetAddress("10.70.57.232", 12001);
}
 
  void draw() {
   background(0);
   translate(width*0.5, height*0.5);
   stroke(0);
   float angle = PI*(3.0-sqrt(5.0)); //137.5 in radians
   float r, theta, x, y;
   int n = 250;
   
  
   for (int i=1; i < n; i=i+1) {
      r = i;
      theta = i * angle * secuencia;
      // Convert polar to cartesian
      x = r * cos(theta);
      y = r * sin(theta);
      if (r<15){
        fill(255,0,0);
        ellipse(x, y, 12, 12);
      }
      else if (r>15 && r<45){
       fill(255,127,0); 
       ellipse(x, y, 12, 12);
      }
      else if (r>45 && r<75){
       fill(255,255,0); 
       ellipse(x, y, 12, 12);
      }
      else if (r>75 && r<105){
       fill(0,255,0); 
       ellipse(x, y, 12, 12);
      }
      else if (r>105 && r<135){
       fill(0,0,255); 
       ellipse(x, y, 12, 12);
      }
      else if (r>135 && r<165){
       fill(75,0,130); 
       ellipse(x, y, 12, 12);
      }
      else if (r>165 && r<195){
       fill(255,0,255); 
       ellipse(x, y, 12, 12);
      }
   }
}

//cada vez que se recibe un mensaje de osc en el puerto asignado, se llama esta función
void oscEvent(OscMessage theOscMessage) {  
  //si el mensaje está etiquetado como "/x"
  if (theOscMessage.checkAddrPattern("/x") == true) {
    //asigna el valor entero a la variable 
    secuencia = theOscMessage.get(0).intValue();
  }
}
