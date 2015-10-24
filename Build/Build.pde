// Author: Neil Panchal
// License: The MIT License
// Copyright (c) 2015 Neil Panchal, http://neil.engineer
// ----------------------------------------------------------------------------

// Import libraries
import com.chroma.*;
import com.luma.*;

import java.util.UUID;
import java.util.ArrayList;

// Project details
String project_name = "BoilerPlate";
String project_color = "Color";
String folder_name = "Series 1";
int frame = 1;

// Canvas
int CANVASX = 1280;
int CANVASY = 720;

boolean bgWhite = false;

Chroma[] palette = generatePalette().getClusters();

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
   // Reset function
}

void keyReleased() {
    // Save a screenshot in PNG format
    if (key == 's' || key == 'S') {
        saveFrame("../Export/" + folder_name + "/"
                  + project_name + "_" + frame + "_" + UUID.randomUUID().toString().substring(0, 8) +  ".png");
                    frame++;
    }
}

// Generate Palette
Luma generatePalette() {
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
Chroma getRandomColor() {
    return (bgWhite) ? new Chroma(255) : palette[(int)random(0, palette.length)];
}

void delay(int delay) {
    int time = millis();
    while (millis() - time <= delay);
}
