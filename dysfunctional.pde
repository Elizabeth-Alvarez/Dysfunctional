//Declaration of global variables
int maxImages = 20; //Total of images
int imageIndex = 1; //initial image displayed

PImage img;
PImage [] images = new PImage[maxImages];


String[] headlines = {"Damn girl", "No Way!!!","OMG","Did it hurt?!?!?!","How much did you pay for it?",
"Do you like it?!","It looks sick dude!"," That's awesome",
"I would never be able to do that","What's the meaning behind it?",
"It looks painful!","What did your mom say?!"," OUCH!!!", "Uhm...", "WOW"};
PFont f; //fonts text
float x; //horizontal location of text
int index = 0;

int value = 0;

int savedTime;
int totalTime = 1000;


void setup()
{
  //Background picture
  size(1181,830);
  img = loadImage("bg1.jpg");
  
  //Loads images from array
  for(int i = 0; i < images.length; i++)
  {
    images[i] = loadImage("image" + i + ".jpg");
  }
  
  //font setup
  f = loadFont("AppleGothic-48.vlw");
  x = width; //initializing to the right
  
 savedTime = millis();
}
 

void draw()
{
  background(0);
  image(img,0,0);
  image(images[imageIndex],250,100);
  

  //displays images in random sequences
 // imageIndex = (imageIndex + 1) % images.length;

//Images timing
int passedTime = millis() - savedTime;
if(passedTime > totalTime)
{
  println("1 seconds has passed");
  //displays images in random sequences
  imageIndex = (imageIndex + 1) % images.length;
  savedTime = millis();
}

  //text stuff
  textFont(f,36); //font to be used
  fill(255); //font color
  textAlign(LEFT);
  text(headlines[index],x,720);
  x = x-6; // Speed value of x

float w = textWidth(headlines[index]);
if(x < -w)
{
  x = width;
  index = (index + 1) % headlines.length;
}
}
