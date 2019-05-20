import std.container.array;
import std.conv;

class Stack {
  Array!double items;
  uint size = 0;
  
  double peek() {
    if (size)
      return items.back();
    return 0;
  }
  
  void push(double item) {
    items.insertBack(item);
    size++;
  }
  
  double pop() {
    if (size) {
      size--;
      return items.removeAny();
    }
    return 0;
  }
  
  void discard() {
    if (size) {
      items.removeBack();
      size--;
    }
  }
  
  void duplicate() {
    if (size) {
      items.insertBack(peek());
      size++;
    }
  }
  
  void swap() {
    if (size > 1) {
      auto temp = peek();
      items[size - 1] = items[size - 2];
      items[size - 2] = temp;
    }
  }
  
  void rotate_right() {
    if (size > 1) {
      items.insertBefore!double(items[0..1], items.removeAny());
    }
  }
  
  void rotate_left() {
    if (size > 1) {
      double temp = items.front();
      items.linearRemove(items[0..1]);
      items.insertBack(temp);
    }
  }
  
  void clear() {
    if (size) {
      items.clear();
      size = 0;
    }
  }
}
