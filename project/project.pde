// Author: Neil Panchal
// License: http://opensource.org/licenses/MIT
// Copyright (c) 2015 Neil Panchal, http://neil.engineer
// --------------------------------------------------------------------------------------

// Import color libraries
import com.chroma.*;
import com.luma.*;

// Project details
String title = "Boiler Plate";

int series = 1;
int frame = 1;

// Canvas
int CANVASX = 1280;
int CANVASY = 720;

boolean bgWhite = true;

// Color palette
int lumaNumber = 18, lumaQuality = 50;
int lumaMinL = 20, lumaMaxL = 32;
int lumaMinC = 20, lumaMaxC = 60;
int lumaMinH = 200, lumaMaxH = 360;

Luma lumaColors = new Luma(lumaNumber, lumaQuality, lumaMinL, lumaMaxL, lumaMinC, lumaMaxC, lumaMinH, lumaMaxH);

Chroma[] palette = lumaColors.getClusters();



// --------------------------------------------------------------------------------------
void setup() {

    size(CANVASX, CANVASY, "processing.core.PGraphicsRetina2D");
    background(getRandomColor().get());
    frameRate(30);
    smooth();

}

void draw() {

}


// --------------------------------------------------------------------------------------
void mousePressed() {

    background(getRandomColor().get());
}

void keyReleased() {
    // Save a screenshot in PNG format
    if (key == 's' || key == 'S') {
        saveFrame("../export/Series " + series + "/" + title + "_" + series + "_" + frame + ".png");
        frame++;
    }
}

// Get a random palette color
Chroma getRandomColor() {
    if (bgWhite) {
        return new Chroma(255);
    } else {
        return palette[(int)random(0, palette.length)];
    }
}


