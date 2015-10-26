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
    // Begin Draw
    delay(0);

    if (exportPDF) {
        beginRecord(PDF, "../Export/PDF/" + projectName + "_" + UUID.randomUUID().toString().substring(0, 8) +  ".pdf");
    }

    // background(getRandomColor().get());

    // Function calls





    // End Draw
    if (exportPDF) {
        endRecord();
        exportPDF = false;
    }
    if (exportVideo && videoFrame < 900) {
        saveVideo(videoFrame++);
    } else {
        exportVideo = false;
    }
}
