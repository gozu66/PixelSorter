void fileSelected(File selection) 
{
  if (selection == null) 
  {
    
  } 
  else 
  {
    String path = selection.getPath();
    String[] st = path.split("\\\\");
    path = st[st.length - 1];
    st = path.split("\\.");
    String ext = st[st.length - 1];    

    updateUI(loadImage(path));
  }
}

void saveImages()
{
  save("full" + minute() + hour() + "_" + day() + "." + month() + "." + year());
  //outputImage.save("output" + minute() + hour() + "_" + day() + "." + month() + "." + year());
}