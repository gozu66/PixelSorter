void fileSelected(File selection) 
{
  if (selection == null) 
  {
    println("Window was closed or the user hit cancel.");
  }
  else 
  {
    println("User selected " + selection.getAbsolutePath());
  }
}

void saveImages()
{
  save("full" + minute() + hour() + "_" + day() + "." + month() + "." + year());
  //outputImage.save("output" + minute() + hour() + "_" + day() + "." + month() + "." + year());
}