void fileSelected(File selection) 
{
  if (selection == null) 
  {
    
  } else 
  {
    String path = selection.getPath();
    String[] st = path.split("\\\\");
    path = st[st.length - 1];
    st = path.split("\\.");
    updateUI(loadImage(path));
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