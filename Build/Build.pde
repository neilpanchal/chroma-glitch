// Author: Neil Panchal
// License: The MIT License
// Copyright (c) 2015 Neil Panchal, http://neil.engineer
// ----------------------------------------------------------------------------

void settings() {
    size(CANVAS_WIDTH, CANVAS_HEIGHT, FX2D);

}

void setup() {
    // Set window title
    surface.setTitle(projectName + " / " + projectColor + " / " + CANVAS_WIDTH + " x " + CANVAS_HEIGHT);

    cf = new ControlFrame(this, 260, 640, "Controls");
    background(getRandomColor().get());
    pixelDensity(2);
    frameRate(24);
    noStroke();
    smooth();
}

void draw() {

    drawStart(); // Call routine draw functions

    // Run the process



    drawEnd(); // Call routine end draw functions
}
