// Author: Neil Panchal
// License: The MIT License
// Copyright (c) 2015 Neil Panchal, http://neil.panchal.io
// ----------------------------------------------------------------------------
int time = 0;
Palette thePalette;
color[] theColors;


public int paletteRes;
public int paletteInterp;
public int colorTheme;
public int colorSort;

public int hueAlpha;
public int hueBeta;
public int hueAlphaRange;
public int hueBetaRange;

public int satAlpha;
public int satBeta;
public int satAlphaRange;
public int satBetaRange;

public int lumAlpha;
public int lumBeta;
public int lumAlphaRange;
public int lumBetaRange;

public int tileCount;
public int tileCountX;
public int tileCountY;

public String sortMode;
float rectSize;
float rectSizeX;
float rectSizeY;

void settings() {

    size(CANVAS_WIDTH, CANVAS_HEIGHT, FX2D);
}

void setup() {
    // Set window title
    surface.setTitle(projectName + " / " + CANVAS_WIDTH + " x " + CANVAS_HEIGHT);

    cf = new ControlFrame(this, 450, 750, "Controller");
    // background(getRandomColor().get());
    background(255);
    pixelDensity(2);
    frameRate(60);
    noStroke();
    smooth();

	paletteRes = 10;
    paletteInterp = 100;
    colorTheme = 0;
    colorSort = 0;

    hueAlpha = 240;
    hueBeta = 120;
    hueAlphaRange = 10;
    hueBetaRange = 10;

    satAlpha = 100;
    satBeta = 100;
    satAlphaRange = 15;
    satBetaRange = 15;

    lumAlpha = 50;
    lumBeta = 50;
    lumAlphaRange = 10;
    lumBetaRange = 10;

    tileCount = 128;
    tileCountX = 128;
    tileCountY = 128;
    sortMode = null;
    rectSize = width / float(tileCount);
    rectSizeX = width/float(tileCountX);
    rectSizeY = height/float(tileCountY);
}

void draw() {

    drawBegin(); // Call routine draw functions

    // Run the process

	thePalette = new Palette(tileCount, tileCount, colorTheme,
                             hueAlpha, hueAlphaRange,
                             satAlpha, satAlphaRange,
                             lumAlpha, lumAlphaRange,
                             hueBetaRange,
                             satBeta, satBetaRange,
                             lumBeta, lumBetaRange);
    colorMode(RGB, 255, 255, 255);
    theColors = thePalette.getColors();
    if (sortMode != null) {
        theColors = GenerativeDesign.sortColors(this, theColors, sortMode);
    }
    int i = 0;
    for (int gridY = 0; gridY < tileCountY; gridY++) {

        for (int gridX = 0; gridX < tileCountX; gridX++) {

            fill(theColors[i]);
            rect(gridX * rectSizeX, gridY * rectSizeY, rectSizeX, rectSizeY);
            i++;
        }
    }

    drawEnd(); // Call routine end draw functions
}
