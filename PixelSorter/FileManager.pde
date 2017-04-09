String lastLoadedImage;
void fileSelected(File selection) 
{
  if (selection == null) 
  {
    println("null af");
  } else 
  {
    String path = selection.getPath();
    String[] st = path.split("\\\\");    
    path = st[st.length - 1];
    lastLoadedImage = path;
    loadImageDirect(path);
  }
}

int[] checkAndScaleImage(float w, float h)
{
  if (w > 500 || h > 500) {
    float scaler;
    if (w >= h)
    {
      scaler = (w / 100);
      scaler = 580 / scaler;
      w = 580;
      h = h * (scaler / 100);
    } else
    {
      scaler = (h / 100);
      scaler = 580 / scaler;
      h = 580;
      w = w * (scaler / 100);
    }
  }
  return new int[]{(int)w, (int)h};
}

void loadImageDirect(String path)
{
  PImage img = loadImage(path);
  if (img != null)
  {      
    int[] dim = checkAndScaleImage(img.pixelWidth, img.pixelHeight);
    updateUI(img, dim[0], dim[1]);
  } else 
  {
    println("null af");
    return;
  }
}

void saveImages(File selection)
{
  if (selection == null) 
  {
  } else 
  {
    String path = selection.getPath() + "\\";
    display.save(path + ".jpg");
  }
}