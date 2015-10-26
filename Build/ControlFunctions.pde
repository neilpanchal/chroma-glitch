// Import libraries

// import java.util.UUID;
import java.util.*;
import java.lang.ProcessBuilder;
import com.chroma.*;
import com.luma.*;
import controlP5.*;

// Project details
String projectName = "BoilerPlate";
String projectColor = "Mono";
String folderName = "Series 1";
int staticFrame = 1;
int videoFrame = 0;

// Settings
boolean bgWhite = true;
boolean exportPDF = false;
boolean exportVideo = false;

// Staging
int CANVAS_HEIGHT = 950;
int CANVAS_WIDTH = 650;

Chroma[] palette = generatePalette().getClusters();
ControlFrame cf;

// ----------------------------------------------------------------------------
void mousePressed() {
}

void keyReleased() {
    // Save a screenshot in PNG format
    if (key == 's' || key == 'S') {
        saveFrame("../Export/" + projectName + "_" + staticFrame + "_" + UUID.randomUUID().toString().substring(0, 8) +  ".png");
        staticFrame++;
    }

    // Export PDF file
    if (key == 'p' || key == 'P') {
        exportPDF = true;
    }

    // Export Video Frames
    if (key == 'v' || key == 'V') {
        exportVideo = !exportVideo;
    }

    // Reset program
    if (key == 'r' || key == 'R') {
        // Reset Function

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

void saveVideo(int i) {
    String istr = i + "";
    if (i < 10) { istr = "00000" + i; }
    else if (i < 100) { istr = "0000" + i; }
    else if (i < 1000) { istr = "000" + i; }
    else if (i < 10000) { istr = "00" + i; }
    else if (i < 100000) { istr = "0" + i; }
    saveFrame("../Export/Video/" + folderName + "/"
              + projectName + "_" + istr + ".png");
}


// HOW TO ENCODE VIDEO FILES

/*
# use format
ffmpeg [global_options] {[input_options] -i ‘input_file’} ... {[output_options] ‘output_file’} ...

# make a movie from matching .png files, write over original, codec = libx264 (H.264), framerate = 30, 1 pass, resolution = 1920×1080, video bitrate = 6Mbits, format = mp4
ffmpeg -y -pattern_type glob -i 'p_*.png' -vcodec libx264 -r 30 -q 100 -pass 1 -s 1920x1080 -vb 6M -threads 0 -f mp4 file.mp4

# convert the video file to Apple ProRes codec for use in Final Cut
ffmpeg -y -i file.mp4 -vcodec prores -vb 6M -r 30 -s 1920x1080 -f mov file.mov

# here’s another example conversion command. this one has a much higher bitrate
ffmpeg -y -i file_01.mp4 -b:v 40M -vcodec libx264 -pass 1 file_02.mp4
*/
