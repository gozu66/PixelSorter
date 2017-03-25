class UIElement
{
  int type;
  String text;
  PVector pos;
  int _width = 160, _height = 100;
  UIElement(int _type, String _text, PVector _pos)
  {
    type = _type;
    text = _text;
    pos = _pos;
  }

  void _draw()
  {
    fill(255);
    textSize(12);
    rect(pos.x, pos.y, _width, _height * 0.5);
    text(text, pos.x, pos.y + 50, _width, _height);
  }

  boolean checkClicks()
  {
    if (mouseX > pos.x && mouseY > pos.y
        && mouseX < pos.x + (_width) && mouseY < pos.y + (_height * 0.5))
    {
      return true;
    }

    return false;
  }
}