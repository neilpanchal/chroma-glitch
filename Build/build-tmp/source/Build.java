import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import com.chroma.*; 
import com.luma.*; 
import java.util.UUID; 
import java.util.ArrayList; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Build extends PApplet {

// Author: Neil Panchal
// License: The MIT License
// Copyright (c) 2015 Neil Panchal, http://neil.engineer
// ----------------------------------------------------------------------------

// Import libraries






// Project details
String project_name = "BoilerPlate";
String project_color = "Color";
String folder_name = "Series 1";
int frame = 1;

// Canvas
int CANVASX = 1280;
int CANVASY = 720;

boolean bgWhite = true;
boolean savePDF = false;

Chroma[] palette = generatePalette().getClusters();

// ----------------------------------------------------------------------------
public void setup() {

    
    
    background(getRandomColor().get());
    frameRate(24);
    

}

public void draw() {

    // Begin Draw
    delay(0);

    if(savePDF == true) {
        beginRecord(PDF, "../Export/PDF/" + project_name + "_" + UUID.randomUUID().toString().substring(0, 8) +  ".pdf");
    }

    // background(getRandomColor().get());

    // Function calls





    // End Draw
    if(savePDF == true) {
        endRecord();
        savePDF = false;
    }
}


// ----------------------------------------------------------------------------
public void mousePressed() {
   // Reset function
}

public void keyReleased() {
    // Save a screenshot in PNG format
    if (key == 's' || key == 'S') {
        saveFrame("../Export/" + project_name + "_" + frame + "_" + UUID.randomUUID().toString().substring(0, 8) +  ".png");
                    frame++;
    }
    if (key == 'p' || key == 'P') {
          savePDF = true;
    }
}

// Generate Palette
public Luma generatePalette() {
    // Color palette
    int lumaNumber = 8, lumaQuality = 70;
    int lumaMinL = 15, lumaMaxL = 25;
    int lumaMinC = 30, lumaMaxC = 35;
    int lumaMinH = 140, lumaMaxH = 340;

    Luma lumaColors = new Luma( lumaNumber, lumaQuality,
                                lumaMinL, lumaMaxL,
                                lumaMinC, lumaMaxC,
                                lumaMinH, lumaMaxH);
    return lumaColors;
}

// Get a random palette color
public Chroma getRandomColor() {
    return (bgWhite) ? new Chroma(255) : palette[(int)random(0, palette.length)];
}

public void delay(int delay) {
    int time = millis();
    while (millis() - time <= delay);
}
  public void settings() {  size(650, 950);  smooth();  pixelDensity(2); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Build" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
