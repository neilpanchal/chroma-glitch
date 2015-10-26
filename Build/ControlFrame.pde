class ControlFrame extends PApplet {

    int w, h;
    int posYCount;
    int controlHeight;
    int controlWidth;

    int paddingX, paddingY, spacingY;
    PApplet parent;
    ControlP5 cp5;

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

        // Add variables to the .plugTo method as follows.
        // .plugTo(parent, "Variable Name String")
        cp5.addToggle("buttonA")
        .setCaptionLabel("Background")
        .plugTo(parent, "bgWhite")
        .setValue(true)
        .setPosition(getX(), getY())
        .setSize(controlWidth, controlHeight);

        cp5.addToggle("buttonC")
        .setCaptionLabel("Export Video")
        .plugTo(parent, "exportVideo")
        .setPosition(getX(), getY())
        .setSize(controlWidth, controlHeight);

        cp5.addButton("buttonD")
        .setCaptionLabel("Export PDF")
        .plugTo(parent, "exportPDF")
        .setPosition(getX(), getY())
        .setSize(controlWidth, controlHeight);


        cp5.addSlider("sliderA")
        .setCaptionLabel("Slider A")
        .plugTo(parent)
        .setRange(0, 100)
        .setValue(50)
        .setPosition(getX(), getY())
        .setSize(controlWidth -50, controlHeight);

        cp5.addSlider("sliderB")
        .setCaptionLabel("Slider B")
        .plugTo(parent)
        .setRange(0, 100)
        .setValue(50)
        .setPosition(getX(), getY())
        .setSize(controlWidth - 50, controlHeight);

        cp5.setColorCaptionLabel(color(0,0,0));
        cp5.setColorActive(#CCAA00);
        cp5.setColorBackground(color(255));
        cp5.setColorForeground(#CCAA00);
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
        background(#DDDDDD);
    }
}
