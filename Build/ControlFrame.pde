class ControlFrame extends PApplet {

    int w, h;
    int posYCount;
    int controlHeight;
    int controlWidth;

    int paddingX, paddingY, spacingY;
    PApplet parent;
    ControlP5 cp5;

    public Slider sliderHueAlpha;
    public Slider sliderHueAlphaRange;
    public Slider sliderSatAlpha;
    public Slider sliderSatAlphaRange;
    public Slider sliderLumAlpha;
    public Slider sliderLumAlphaRange;

    public Slider sliderHueBeta;
    public Slider sliderHueBetaRange;
    public Slider sliderSatBeta;
    public Slider sliderSatBetaRange;
    public Slider sliderLumBeta;
    public Slider sliderLumBetaRange;

    public RadioButton radioColorTheme;
    public RadioButton radioColorSort;

    public ControlFrame(PApplet _parent, int _w, int _h, String _name) {
        super();
        parent = _parent;
        w = _w;
        h = _h;
        paddingX = 20;
        paddingY = 20;
        spacingY = 20;
        controlHeight = 20;
        controlWidth = _w - (2 * paddingX);

        PApplet.runSketch(new String[] {this.getClass().getName()}, this);
    }

    public void settings() {
        size(w, h);
    }

    public void setup() {
        surface.setLocation(500, 200);
        surface.setTitle(projectName + " / Controller");
        cp5 = new ControlP5(this);

		color solarizedBase03 = color(#002b36);
        color solarizedBase02 = color(#073642);
        color solarizedBase01 = color(#586e75);
        color solarizedBase00 = color(#657b83);
        color solarizedBase0 = color(#839496);
        color solarizedBase1 = color(#93a1a1);
        color solarizedBase2 = color(#eee8d5);
        color solarizedBase3 = color(#fdf6e3);
        color solarizedYellow = color(#b58900);
        color solarizedOrange = color(#cb4b16);
        color solarizedRed = color(#dc322f);
        color solarizedMagenta = color(#d33682);
        color solarizedViolet = color(#6c71c4);
        color solarizedBlue = color(#268bd2);
        color solarizedCyan = color(#2aa198);
        color solarizedGreen = color(#859900);

        int barHeight = 25;
        int barWidth = 200;
        int barHeightRange = 25;
        int barWidthRange = 60;

        float minBar = 0;
        float maxBar = 100;
        float maxBarHue = 360;

		//----HUE----////////////////////////////////////////////////////////////////////


        sliderHueAlpha = cp5.addSlider("HUE ALPHA", minBar, maxBarHue, hueAlpha, 10, 10, barWidth, barHeight)
                         .plugTo(parent, "hueAlpha")
                         .setColorBackground(solarizedBase02)
                         .setColorActive(solarizedBase2)
                         .setColorForeground(solarizedCyan)
                         .setColorValue(solarizedBase03);


        sliderHueAlphaRange = cp5.addSlider("HUE ALPHA RANGE", minBar, maxBar, hueAlphaRange, 300, 10, barWidthRange, barHeightRange)
                              .plugTo(parent, "hueAlphaRange")
                              .setColorBackground(solarizedBase02)
                              .setColorActive(solarizedBase2)
                              .setColorForeground(solarizedCyan)
                              .setColorValue(solarizedBase03);


        sliderHueBeta = cp5.addSlider("HUE BETA", minBar, maxBarHue, hueAlpha, 10, 40, barWidth, barHeight)
                        .plugTo(parent, "hueBeta")
                        .setColorBackground(solarizedBase02)
                        .setColorActive(solarizedBase2)
                        .setColorForeground(solarizedCyan)
                        .setColorValue(solarizedBase03);


        sliderHueBetaRange = cp5.addSlider("HUE BETA RANGE", minBar, maxBar, hueBetaRange, 300, 40, barWidthRange, barHeightRange)
                             .plugTo(parent, "hueBetaRange")
                             .setColorBackground(solarizedBase02)
                             .setColorActive(solarizedBase2)
                             .setColorForeground(solarizedCyan)
                             .setColorValue(solarizedBase03);


        //----SATURATION----/////////////////////////////////////////////////////////////


        sliderSatAlpha = cp5.addSlider("SAT ALPHA", minBar, maxBar, satAlpha, 10, 110, barWidth, barHeight)
                         .plugTo(parent, "satAlpha")
                         .setColorBackground(solarizedBase02)
                         .setColorActive(solarizedBase2)
                         .setColorForeground(solarizedYellow)
                         .setColorValue(solarizedBase03);


        sliderSatAlphaRange = cp5.addSlider("SAT ALPHA RANGE", minBar, maxBar, satAlphaRange, 300, 110, barWidthRange, barHeightRange)
                              .plugTo(parent, "satAlphaRange")
                              .setColorBackground(solarizedBase02)
                              .setColorActive(solarizedBase2)
                              .setColorForeground(solarizedYellow)
                              .setColorValue(solarizedBase03);


        sliderSatBeta = cp5.addSlider("SAT BETA", minBar, maxBar, satAlpha, 10, 140, barWidth, barHeight)
                        .plugTo(parent, "satBeta")
                        .setColorBackground(solarizedBase02)
                        .setColorActive(solarizedBase2)
                        .setColorForeground(solarizedYellow)
                        .setColorValue(solarizedBase03);


        sliderSatBetaRange = cp5.addSlider("SAT BETA RANGE", minBar, maxBar, satBetaRange, 300, 140, barWidthRange, barHeightRange)
                             .plugTo(parent, "satBetaRange")
                             .setColorBackground(solarizedBase02)
                             .setColorActive(solarizedBase2)
                             .setColorForeground(solarizedYellow)
                             .setColorValue(solarizedBase03);


        //----LUMINOSITY----/////////////////////////////////////////////////////////////

        sliderLumAlpha = cp5.addSlider("LUM ALPHA", minBar, maxBar, lumAlpha, 10, 210, barWidth, barHeight)
                         .plugTo(parent, "lumAlpha")
                         .setColorBackground(solarizedBase02)
                         .setColorActive(solarizedBase2)
                         .setColorForeground(solarizedMagenta)
                         .setColorValue(solarizedBase03);


        sliderLumAlphaRange = cp5.addSlider("LUM ALPHA RANGE", minBar, maxBar, lumAlphaRange, 300, 210, barWidthRange, barHeightRange)
                              .plugTo(parent, "lumAlphaRange")
                              .setColorBackground(solarizedBase02)
                              .setColorActive(solarizedBase2)
                              .setColorForeground(solarizedMagenta)
                              .setColorValue(solarizedBase03);


        sliderLumBeta = cp5.addSlider("LUM BETA", minBar, maxBar, lumAlpha, 10, 250, barWidth, barHeight)
                        .plugTo(parent, "lumBeta")
                        .setColorBackground(solarizedBase02)
                        .setColorActive(solarizedBase2)
                        .setColorForeground(solarizedMagenta)
                        .setColorValue(solarizedBase03);


        sliderLumBetaRange = cp5.addSlider("LUM BETA RANGE", minBar, maxBar, lumBetaRange, 300, 250, barWidthRange, barHeightRange)
                             .plugTo(parent, "lumBetaRange")
                             .setColorBackground(solarizedBase02)
                             .setColorActive(solarizedBase2)
                             .setColorForeground(solarizedMagenta)
                             .setColorValue(solarizedBase03);


        //----COLOR THEME----////////////////////////////////////////////////////////////

        radioColorTheme = cp5.addRadioButton("radioColorTheme")
                          .setPosition(10, 330)
                          .setColorBackground(solarizedBase02)
                          .setColorActive(solarizedBase2)
                          .setColorForeground(solarizedMagenta)
                          .setColorValue(solarizedBase03)
                          .setItemsPerRow(1)
                          .setSpacingRow(20)
                          .setSpacingColumn(50)
                          .setSize(40, 20)
                          .addItem("Complimentary", 0)
                          .addItem("Split Complimentary Left", 1)
                          .addItem("Split Complimentary Right", 2)
                          .addItem("Analogous Left", 3)
                          .addItem("Analogous Right", 4)
                          .addItem("Triad Left", 5)
                          .addItem("Triad Right", 6)
                          ;

        radioColorSort = cp5.addRadioButton("radioColorSort")
                         .setPosition(300, 330)
                         .setColorBackground(solarizedBase02)
                         .setColorActive(solarizedBase2)
                         .setColorForeground(solarizedMagenta)
                         .setColorValue(solarizedBase03)
                         .setItemsPerRow(1)
                         .setSpacingRow(20)
                         .setSpacingColumn(50)
                         .setSize(40, 20)
                         .addItem("Unsorted", 0)
                         .addItem("Hue Sort", 1)
                         .addItem("Saturation Sort", 2)
                         .addItem("Luminosity Sort", 3)
                         .addItem("Greyscale Sort", 4)
                         ;
        // Add variables to the .plugTo method as follows.
        // .plugTo(parent, "Variable Name String")
        // cp5.addToggle("buttonA")
        // .setCaptionLabel("Background")
        // .plugTo(parent, "bgWhite")
        // .setValue(true)
        // .setPosition(getX(), getY())
        // .setSize(controlWidth, controlHeight);

        // cp5.addToggle("buttonC")
        // .setCaptionLabel("Export Video")
        // .plugTo(parent, "exportVideo")
        // .setPosition(getX(), getY())
        // .setSize(controlWidth, controlHeight);

        // cp5.addButton("buttonD")
        // .setCaptionLabel("Export PDF")
        // .plugTo(parent, "exportPDF")
        // .setPosition(getX(), getY())
        // .setSize(controlWidth, controlHeight);


        // cp5.addSlider("sliderA")
        // .setCaptionLabel("Slider A")
        // .plugTo(parent)
        // .setRange(0, 100)
        // .setValue(50)
        // .setPosition(getX(), getY())
        // .setSize(controlWidth -50, controlHeight);

        // cp5.addSlider("sliderB")
        // .setCaptionLabel("Slider B")
        // .plugTo(parent)
        // .setRange(0, 100)
        // .setValue(50)
        // .setPosition(getX(), getY())
        // .setSize(controlWidth - 50, controlHeight);

        // cp5.setColorCaptionLabel(color(0,0,0));
        // cp5.setColorActive(#CCAA00);
        // cp5.setColorBackground(color(255));
        // cp5.setColorForeground(#CCAA00);
    }
    int getX() {
        return paddingX;
    }
    int getY() {
        int result = paddingY + (int)(posYCount * controlHeight*2);
        posYCount++;
        return result ;
    }

    // void setControllerBackground() {
    //     List controllerList = cp5.getAll();
    //     for (int i = 0; i < controllerList.size(); i++) {
    //         controllerList.get(i).setBackground()
    //     }
    // }
    void draw() {
        background(#002b36);
    }

    void controlEvent(ControlEvent theEvent) {
        // if (theEvent.name() == sliderHueAlpha.getName()) {
        //     println("SliderHueAlpha was clicked");
        //     sliderHueBeta.setValue(hueBeta);
        // }
        if (theEvent.isGroup()) {
            // an event from a group e.g. scrollList
            // println(theEvent.group().value() + " from " + theEvent.group());
        }

        if (theEvent.isGroup() && theEvent.name().equals("radioColorTheme")) {
            colorTheme = (int)theEvent.group().getValue();
            // println("Color Scheme " + colorTheme);
        }
        if (theEvent.isGroup() && theEvent.name().equals("radioColorSort")) {
            colorSort = (int)theEvent.group().getValue();
            if (colorSort == 0) sortMode = null;
            if (colorSort == 1) sortMode = GenerativeDesign.HUE;
            if (colorSort == 2) sortMode = GenerativeDesign.SATURATION;
            if (colorSort == 3) sortMode = GenerativeDesign.BRIGHTNESS;
            if (colorSort == 4) sortMode = GenerativeDesign.GRAYSCALE;

            // println("Color Mode " + sortMode);
        }
    }
}
