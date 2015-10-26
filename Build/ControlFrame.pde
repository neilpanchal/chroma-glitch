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
        paddingX = 10;
        paddingY = 10;
        spacingY = 10;
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

        cp5.addButton("buttonA")
        .setCaptionLabel("Button A")
        .plugTo(parent)
        .setPosition(getX(), getY())
        .setSize(controlWidth, controlHeight);

        cp5.addButton("buttonB")
        .setCaptionLabel("Button B")
        .plugTo(parent)
        .setPosition(getX(), getY())
        .setSize(controlWidth, controlHeight);

        cp5.addToggle("toggleA")
        .setCaptionLabel("Toggle A")
        .plugTo(parent)
        .setPosition(getX(), getY())
        .setSize(controlWidth, controlHeight);

        cp5.addToggle("toggleB")
        .setCaptionLabel("Toggle B")
        .plugTo(parent)
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

        cp5.setColorCaptionLabel(color(200,0,0));
        cp5.setColorActive(#CCAA00);
        cp5.setColorBackground(color(255));
        cp5.setColorForeground(#CCAA00);
    }
    int getX() {
        return paddingX;
    }
    int getY() {
        int result = paddingY + (int)(posYCount * controlHeight*3);
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
        background(#CCCCCC);
    }
}
