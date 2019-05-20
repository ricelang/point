import std.stdio;
import std.string;
import std.conv;

import classes;
import point;

// +
void _add() {
  if (stack.size > 1) {
    stack.push(stack.pop() + stack.pop());
  }
}

// -
void _sub() {
  if (stack.size > 1) {
    real temp = stack.pop();
    stack.push(stack.pop() - temp);
  }
}

// *
void _mul() {
  if (stack.size > 1) {
    stack.push(stack.pop() * stack.pop());
  }
}

// /
void _div() {
  if (stack.size > 1) {
    real temp = stack.pop();
    stack.push(stack.pop() / temp);
  }
}

// %
void _mod() {
  if (stack.size > 1) {
    real temp = stack.pop();
    stack.push(stack.pop() % temp);
  }
}

// ?
void _test() {
  if (stack.size)
    stack.push(stack.pop() ? 1 : 0);
}

// .
void _out_char() {
  if (stack.size) {
    write(cast(char) stack.pop());
  }
}

// :
void _out_num() {
  if (stack.size) {
    write(stack.pop());
  }
}

// ,
void _in_char() {
  string input = readln();
  stack.push(input ? input[0] : '\0');
}

// ;
void _in_num() {
  string input = readln();
  input = input[0..input.length-1];
  if (isNumeric(input))
    try
      stack.push(parse!real(input));
    catch (Exception e) {}
}
