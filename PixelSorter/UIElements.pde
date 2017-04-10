int uiWidth = 160, uiHeight = 50, uiHalfHeight = 25, uiX = 10, uiY = 10;
//LOCAL SORT MODE is held be each UiSubElement
//0 = sort brightness // 1 = sort Saturation // 2 = sortHue // 3 = Linear Sort horizontal // 4 = Linear Sort Vertical // etc. 

UiElement b_loadImage = new UiElement("Choose a .jpg .gif or .png", new PVector(uiX, 10));

String sortModename = "Full sort";
UiElement b_sortPixels = new UiElement(sortModename, new PVector(uiX, 80));
UiElement b_linearSort = new UiElement("Linear sort", new PVector(uiX, 150));
UiElement b_conditionalLinearSort = new UiElement("Linear sort with condition", new PVector(uiX, 230));
UiElement b_spiralPixels = new UiElement("Spiral sort", new PVector(uiX, 310));

SubUiElement cb_sortModeBrightness = new SubUiElement("Bright", new PVector(0, 5 + uiHalfHeight), b_sortPixels, 0);
SubUiElement cb_sortModeSaturation = new SubUiElement("Sat", new PVector(uiWidth / 2 + 20, 5 + uiHalfHeight), b_sortPixels, 1);
SubUiElement cb_sortModeHue = new SubUiElement("Hue", new PVector(uiWidth / 4 + 10, 5 + uiHalfHeight), b_sortPixels, 2);

SubUiElement cb_linearSortModeBrightness = new SubUiElement("Bright", new PVector(0, 5 + uiHalfHeight), b_linearSort, 0);
SubUiElement cb_linearSortModeSaturation = new SubUiElement("Sat", new PVector(uiWidth / 2 + 20, 5 + uiHalfHeight), b_linearSort, 1);
SubUiElement cb_linearSortModeHue = new SubUiElement("Hue", new PVector(uiWidth / 4 + 10, 5 + uiHalfHeight), b_linearSort, 2);
SubUiElement cb_linearSortVertical = new SubUiElement("Vert", new PVector(0, 50), b_linearSort, 3);
SubUiElement cb_linearSortHorizontal = new SubUiElement("Horiz", new PVector(uiWidth / 2 + 20, 50), b_linearSort, 4);

UiElement b_resetImage = new UiElement("Reset Image", new PVector(uiX, 460));
UiElement b_saveOutput = new UiElement("Save Image", new PVector(uiX, 490));

int pointer1, pointer2;

class UiElement
{
  String text;
  PVector pos;
  int _width = uiWidth, _height = uiHeight;

  UiElement(String _text, PVector _pos)
  {
    text = _text;
    pos = _pos;
  }

  void _draw()
  {
    fill(255);
    textSize(12);
    rect(pos.x, pos.y, _width, _height * 0.5);
    fill(0);
    text(text, pos.x, pos.y, _width, _height);
    fill(255);
  }

  boolean checkClicks()
  {
    if (mouseX > pos.x && mouseY > pos.y && mouseX < pos.x + (_width) && mouseY < pos.y + (_height * 0.5))
    {
      return true;
    }
    return false;
  }

  void changeMode(int mode)
  {
    
    switch(mode)
    {
    case 0:
      sortMode = 0;    
      return;
    case 1:
      sortMode = 1;
      return;
    case 2:
      sortMode = 2;
      return;
    case 3:
      linearSortMode = 0;
      return;
    case 4:
      linearSortMode = 1;
      return;
    }
  }
}

class SubUiElement extends UiElement
{
  SubUiElement(String _text, PVector _pos, UiElement parent, int localSortMode)
  {
    super(_text, _pos);
    _pos.x = parent.pos.x + _pos.x;
    _pos.y = parent.pos.y + _pos.y;
  }

  void _draw()
  {
    fill(255);
    textSize(12);
    rect(pos.x, pos.y, _width / 4, (_height / 4) + 5);
    fill(0);
    text(text, pos.x, pos.y, _width, _height);
    fill(255);
  }

  boolean checkClicks()
  {
    if (mouseX > pos.x && mouseY > pos.y && mouseX < pos.x + (_width / 4) && mouseY < pos.y + (_height / 4) + 5)
    {
      return true;
    }
    return false;
  }
}

void drawUI()
{
  background(100);

  b_loadImage._draw();
  
  b_sortPixels._draw();
    cb_sortModeBrightness._draw();
    cb_sortModeHue._draw();
    cb_sortModeSaturation._draw();

  b_linearSort._draw();
    cb_linearSortVertical._draw();
    cb_linearSortHorizontal._draw();
    cb_linearSortModeBrightness._draw();
    cb_linearSortModeSaturation._draw();
    cb_linearSortModeHue._draw();
  b_conditionalLinearSort._draw();

  b_spiralPixels._draw();
  
  b_saveOutput._draw();
  b_resetImage._draw();  
  
  fill(255,0,0);
  if(sortMode == 0)
  {
    ellipse(cb_sortModeBrightness.pos.x,cb_sortModeBrightness.pos.y, 10, 10);
    ellipse(cb_linearSortModeBrightness.pos.x,cb_linearSortModeBrightness.pos.y, 10, 10);
  }
  else if(sortMode == 1)
  {
    ellipse(cb_sortModeSaturation.pos.x,cb_sortModeSaturation.pos.y, 10, 10);
    ellipse(cb_linearSortModeSaturation.pos.x,cb_linearSortModeSaturation.pos.y, 10, 10);
  }
  else if(sortMode == 2)
  {    
    ellipse(cb_sortModeHue.pos.x,cb_sortModeHue.pos.y, 10, 10);
    ellipse(cb_linearSortModeHue.pos.x,cb_linearSortModeHue.pos.y, 10, 10);
  }
  
  if(linearSortMode == 0)
  {
    ellipse(cb_linearSortVertical.pos.x,cb_linearSortVertical.pos.y, 10, 10);
  }
  else if(linearSortMode == 1)
  {
    ellipse(cb_linearSortHorizontal.pos.x,cb_linearSortHorizontal.pos.y, 10, 10);
  }
  fill(200);
}

void mouseWasPressed()
{
  if (b_loadImage != null && b_loadImage.checkClicks())
  {
    selectInput("Select a file", "fileSelected");
  } else if (b_sortPixels != null && b_sortPixels.checkClicks() && display != null)
  {
    display.loadPixels();
    timer();
    display.pixels = quicksort(display.pixels, sortMode);
    timer();
    display.updatePixels();
  } else if (b_spiralPixels != null && b_spiralPixels.checkClicks() && display != null)
  {
    display.loadPixels();      
    timer();
    display.pixels = spiralOutFromCenter(display.pixels, display.pixelWidth, display.pixelHeight);
    timer();
    display.updatePixels();
  } else if (b_linearSort != null && b_linearSort.checkClicks() && display != null)
  {
    display.loadPixels();      
    timer();
    display.pixels = linearSort(display.pixels, display.pixelWidth, display.pixelHeight);
    timer();
    display.updatePixels();
  } else if (b_conditionalLinearSort != null && b_conditionalLinearSort.checkClicks() && display != null)
  {
    display.loadPixels();      
    timer();
    display.pixels = conditionalLinearSort(display.pixels, display.pixelWidth, display.pixelHeight);
    timer();
    display.updatePixels();
  } else if (b_resetImage != null && b_resetImage.checkClicks() && display != null)
  {
    loadImageDirect(lastLoadedImage);
  } else if (b_saveOutput != null && b_saveOutput.checkClicks() && display != null)
  {
    selectInput("Save Image", "saveImages");
  } else if (cb_sortModeBrightness != null && cb_sortModeBrightness.checkClicks())
  {
    cb_sortModeBrightness.changeMode(0);
  } else if (cb_sortModeSaturation != null && cb_sortModeSaturation.checkClicks())
  {
    cb_sortModeSaturation.changeMode(1);
  } else if (cb_sortModeHue != null && cb_sortModeHue.checkClicks())
  {
    cb_sortModeHue.changeMode(2);
  }  else if (cb_linearSortModeBrightness != null && cb_linearSortModeBrightness.checkClicks())
  {
    cb_linearSortModeBrightness.changeMode(0);
  } else if (cb_linearSortModeSaturation != null && cb_linearSortModeSaturation.checkClicks())
  {
    cb_linearSortModeSaturation.changeMode(1);
  } else if (cb_linearSortModeHue != null && cb_linearSortModeHue.checkClicks())
  {
    cb_linearSortModeHue.changeMode(2);
  } else if (cb_linearSortVertical != null && cb_linearSortVertical.checkClicks())
  {
    cb_linearSortVertical.changeMode(3);
  } else if (cb_linearSortHorizontal != null && cb_linearSortHorizontal.checkClicks())
  {
    cb_linearSortHorizontal.changeMode(4);
  }
  drawUI();
}