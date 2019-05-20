import std.c.stdlib: exit;
import std.stdio;
import std.conv;
import std.ascii;

import classes;
import funcs;
import point;

void interpret(string code) {
  for (; index < code.length; index++)
    interpret_char(code[index]);
  if (nl) {
    writeln();
    nl = false;
  }
  index = 0;
}
void interpret_char(char c, uint open_brackets_value = 0) {
  // number mode
  if (scanning_number) {
    if (c == '-') {
      if (negative_number)
        negative_number = false;
      else
        negative_number = true;
    }
    if (c == '.') {
      float_number = true;
    }
    if (c == '%') {
      percent_number = true;
    }
    if (c == ')') {
      scanning_number = false;
      if (negative_number)
        stack.push(stack.pop() * -1);
      if (percent_number)
        stack.push(stack.pop() / 100);
      negative_number = false;
      float_number = false;
      percent_number = false;
    }
    if (isDigit(c))
      if (float_number)
        stack.push(stack.pop() + (c - '0') / 10f);
      else
        stack.push(stack.pop() * 10 + (c - '0'));
  }
  // string mode
  else if (scanning_string) {
    if (c == '"') {
      foreach (_; 0..n) {
        stack.rotate_left();
      }
      n = 0;
      scanning_string = false;
    }
    else {
      stack.push(c);
      stack.rotate_right();
      n++;
    }
  }
  // loop mode
  else if (open_brackets) {
    if (c == '[')
      open_brackets++;
    else if (c == ']') {
      if (stack.peek())
        index = open_bracket_index;
      else {
        open_brackets--;
        stack.discard();
      }
    }
    else {
      uint temp = open_brackets;
      open_brackets = 0;
      interpret_char(c, temp);
    }
  }
  // normal mode
  else {
    switch (c) {
      case '0':
      case '1':
      case '2':
      case '3':
      case '4':
      case '5':
      case '6':
      case '7':
      case '8':
      case '9':
        stack.push(c - '0');
        break;
      case '(':
        stack.push(0);
        scanning_number = true;
        break;
      case '"':
        stack.push(0);
        scanning_string = true;
        break;
      case '[':
        open_bracket_index = index;
        open_brackets++;
        break;
      case '+':
        _add();
        break;
      case '-':
        _sub();
        break;
      case '*':
        _mul();
        break;
      case '/':
        _div();
        break;
      case '%':
        _mod();
        break;
      case '^':
        stack.discard();
        break;
      case '=':
        stack.duplicate();
        break;
      case '~':
        stack.swap();
        break;
      case '>':
        stack.rotate_right();
        break;
      case '<':
        stack.rotate_left();
        break;
      case '$':
        stack.clear();
        break;
      case '#':
        stack.push(stack.size);
        break;
      case '?':
        if (stack.size)
          stack.push(!!stack.pop());
        break;
      case '.':
        _out_char();
        nl = true;
        break;
      case ':':
        _out_num();
        nl = true;
        break;
      case ',':
        _in_char();
        break;
      case ';':
        _in_num();
        break;
      case '&':
        exit(0);
      default:
    }
  }
  if (open_brackets_value)
    open_brackets = open_brackets_value;
}
