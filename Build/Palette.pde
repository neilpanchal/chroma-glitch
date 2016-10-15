class Palette {

    //FIELDS
    private int paletteBaseHue;
    private int paletteRes;
    private int paletteInterp;
    private int colorTheme;

    private int hueAlpha;
    private int hueBeta;
    private int hueAlphaRange;
    private int hueBetaRange;

    private int satAlpha;
    private int satBeta;
    private int satAlphaRange;
    private int satBetaRange;

    private int lumAlpha ;
    private int lumBeta;
    private int lumAlphaRange;
    private int lumBetaRange;

    private color[] palette;

    // CONSTRUCTOR
    Palette (int paletteRes_, int paletteInterp_, int colorTheme_,
        int hueAlpha_, int hueAlphaRange_,
        int satAlpha_, int satAlphaRange_,
        int lumAlpha_, int lumAlphaRange_,
        int hueBetaRange_,
        int satBeta_, int satBetaRange_,
        int lumBeta_, int lumBetaRange_) {


        paletteRes = paletteRes_;
        paletteInterp = paletteInterp_;
        colorTheme = colorTheme_;

        hueAlpha = hueAlpha_;
        hueAlphaRange = hueAlphaRange_;

        satAlpha = satAlpha_;
        satAlphaRange = satAlphaRange_;

        lumAlpha = lumAlpha_;
        lumAlphaRange = lumAlphaRange_;

        hueBetaRange = hueBetaRange_;

        satBeta = satBeta_;
        satBetaRange = satBetaRange_;

        lumBeta = lumBeta_;
        lumBetaRange = lumBetaRange_;

        palette = new color[paletteRes * paletteInterp];

        generatePalette();
    }

    //METHODS


    public color[] getColors() {
        return palette;
    }


    void generatePalette() {


        switch (colorTheme) {

        case 0 :
            hueBeta = getComplimentary(hueAlpha);
            break;

        case 1:
            hueBeta = getSplitComplimentaryLeft(hueAlpha);
            break;

        case 2:
            hueBeta = getSplitComplimentaryRight(hueAlpha);
            break;

        case 3:
            hueBeta = getAnalogousLeft(hueAlpha);
            break;

        case 4:
            hueBeta = getAnalogousRight(hueAlpha);
            break;

        case 5:
            hueBeta = getTriadLeft(hueAlpha);
            break;

        case 6:
            hueBeta = getTriadRight(hueAlpha);
            break;

        default:
            hueBeta = getComplimentary(hueAlpha);

        }

        int counter = 0;

        for (int i = 0; i < paletteInterp; i++) {

            float[] huslPaletteAlpha = new float[] {  getRandomHue(hueAlpha, hueAlphaRange),
                    constrain(random(satAlpha - satAlphaRange, satAlpha + satAlphaRange), 0, 100),
                    constrain(random(lumAlpha - lumAlphaRange, lumAlpha + lumAlphaRange), 0, 100)
                                                   };

            float[] huslPaletteBeta = new float[] {  getRandomHue(hueBeta, hueBetaRange),
                    constrain(random(satBeta - satBetaRange, satBeta + satBetaRange), 0, 100),
                    constrain(random(lumBeta - lumBetaRange, lumBeta + lumBetaRange), 0, 100)
                                                  };

            float[] rgbColorA = PerceptualChroma.getRGB(huslPaletteAlpha);
            float[] rgbColorB = PerceptualChroma.getRGB(huslPaletteBeta);

            colorMode(RGB, 255, 255, 255, 255);
            color colAlpha = color((int)rgbColorA[0], (int)rgbColorA[1], (int)rgbColorA[2]);
            color colBeta = color((int)rgbColorB[0], (int)rgbColorB[1], (int)rgbColorB[2]);

            for (int j = 0; j < paletteRes; j++) {

                float amount = map(j, 0, paletteRes - 1, 0, 1);

                palette[counter] = lerpColor(colAlpha, colBeta, amount);
                counter++;
            }
        }
    }


    //----------------------------------------------------------------------------------/
    //----COLOR MATH FUNCTIONS----///////////////////////////////////////////////////////
    //----------------------------------------------------------------------------------/

    // This function first generates a random number in (hueBase-hueRange, hueBase+hueRange) domain. The resulting Hue is then mapped to cyclic functions so that it conforms to (0,360) cyclic domain.
    int getRandomHue (int hueBase, int hueRange) {

        int hueRandom;

        int hueRandomTemp = (int)random(hueBase - hueRange, hueBase + hueRange);

        if (hueRandomTemp > 360) {
            hueRandom = addHue(360, (hueRandomTemp - 360));
        } else if (hueRandomTemp < 0) {
            hueRandom = subtractHue(0, (0 - hueRandomTemp));
        } else {
            hueRandom = hueRandomTemp;
        }
        return hueRandom;
    }

    // Cyclic Addition
    int addHue (int hueBase, int hueIncre) {

        int hueOutput;
        if ((hueBase + hueIncre) <= 360) {
            hueOutput = hueBase + hueIncre;
        } else {
            hueOutput = (hueBase + hueIncre) - 360;
        }
        return hueOutput;
    }

    // Cylic Substraction
    int subtractHue (int hueBase, int hueDecre) {

        int hueOutput;
        if ((hueBase - hueDecre) >= 0) {
            hueOutput = hueBase - hueDecre;
        } else {
            hueOutput = 360 + (hueBase - hueDecre);
        }
        return hueOutput;
    }

    int getComplimentary(int hueBase) {
        return addHue(hueBase, 180);
    }

    int getAnalogousLeft (int hueBase) {
        return subtractHue(hueBase, 30);
    }

    int getAnalogousRight (int hueBase) {
        return addHue(hueBase, 30);
    }

    int getTriadLeft (int hueBase) {
        return subtractHue(hueBase, 120);
    }
    int getTriadRight (int hueBase) {
        return addHue(hueBase, 120);
    }

    int getSplitComplimentaryLeft(int hueBase) {
        return getAnalogousLeft(getComplimentary(hueBase));
    }
    int getSplitComplimentaryRight(int hueBase) {
        return getAnalogousRight(getComplimentary(hueBase));
    }
}
