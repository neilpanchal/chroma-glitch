// Author: Neil Panchal
// License: The MIT License
// Copyright (c) 2015 Neil Panchal, http://neil.engineer
// ----------------------------------------------------------------------------

// Import libraries
import com.chroma.*;
import com.luma.*;
import java.util.UUID;

// Project details
String project_name = "Boiler Plate";
String project_color = "Color";
String folder_name = "Series 1";
String file_title = "boiler_plate";

int frame = 1;

// Canvas
int CANVASX = 1280;
int CANVASY = 720;

boolean bgWhite = false;

// Color palette
int lumaNumber = 18, lumaQuality = 60;
int lumaMinL = 15, lumaMaxL = 25;
int lumaMinC = 15, lumaMaxC = 55;
int lumaMinH = 170, lumaMaxH = 360;

Luma lumaColors = new Luma( lumaNumber, lumaQuality,
                            lumaMinL, lumaMaxL,
                            lumaMinC, lumaMaxC,
                            lumaMinH, lumaMaxH);

Chroma[] palette = lumaColors.getClusters();


// ----------------------------------------------------------------------------
void setup() {

    size(1280, 720);
    pixelDensity(2);
    background(getRandomColor().get());
    frameRate(30);
    smooth();

}

void draw() {
    delay(1000);
    background(getRandomColor().get());
}


// ----------------------------------------------------------------------------
void mousePressed() {

    background(getRandomColor().get());
}

void keyReleased() {
    // Save a screenshot in PNG format
    if (key == 's' || key == 'S') {
        saveFrame("../Export/" + project_name + "/" + project_color + "/" + folder_name + "/"
                  + file_title + "_" + frame + "_" + UUID.randomUUID().toString().substring(0, 8) +  ".png");
                    frame++;
    }
}

// Get a random palette color
Chroma getRandomColor() {
    return (bgWhite) ? new Chroma(255) : palette[(int)random(0, palette.length)];
}

void delay(int delay) {
    int time = millis();
    while (millis() - time <= delay);
}
