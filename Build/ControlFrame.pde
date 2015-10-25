class ControlFrame extends PApplet {

  int w, h;
  PApplet parent;
  ControlP5 cp5;

  public ControlFrame(PApplet _parent, int _w, int _h, String _name) {
    super();
    parent = _parent;
    w=_w;
    h=_h;
    PApplet.runSketch(new String[]{this.getClass().getName()}, this);
  }

  public void settings() {
    size(w,h);
  }

  public void setup() {
    surface.setLocation(100,200);
    cp5 = new ControlP5(this);
    // cp5.addButton("Choose file").plugTo(parent,"chooseFile").setPosition(10,10);
    // cp5.addButton("Save Frame").plugTo(parent, "saveFrame").setPosition(10,40);
    // cp5.addToggle("auto").plugTo(parent, "auto").setPosition(10,70);
    // cp5.addToggle("blend").plugTo(parent, "blend").setPosition(10,110);
    // cp5.addNumberbox("seed").plugTo(parent, "seed").setRange(0, 360).setValue(1).setPosition(100, 10).setSize(100,20);
    // cp5.addNumberbox("color").plugTo(parent, "c").setRange(0, 125).setValue(1).setPosition(100, 35).setSize(100,20);
    // cp5.addNumberbox("color2").plugTo(parent, "c2").setRange(0, 1000).setValue(1).setPosition(100, 60).setSize(100,20);
    // cp5.addSlider("speed").plugTo(parent, "speed").setRange(0, 0.1).setValue(0.01).setPosition(100, 260).setSize(200,20);
  }

  void draw() {
    background(40);
  }
}
