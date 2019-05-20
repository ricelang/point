/*
 * point - A stack-based esoteric programming language, initially inspired by Befunge and Glass.
 * 
 * By Unlimiter
 */

import std.stdio;
import std.container.array;
import std.file;

import classes;

Stack stack;
bool
  // print a newline
  nl = false,
  // number scanning enabled
  scanning_number = false,
  // string scanning enabled
  scanning_string = false,
  // number being scanned is negative
  negative_number = false,
  // number being scanned is floating point
  float_number = false,
  // divide scanned number by 100
  percent_number = false
  ;
uint
  // number of characters in string; used for scanning strings
  n = 0,
  // number of current loops
  loops = 0,
  // number of unclosed brackets
  open_brackets = 0,
  // last open bracket index
  open_bracket_index = 0,
  // current characters index
  index = 0
  ;

import funcs;
import interpreter;

void main(string[] args) {
  // the stack
  stack = new Stack;
  
  if (args.length > 1) {
    string target = args[1];
    if (!exists(target)) {
      stderr.writeln("point: ", target, " does not exist");
      exit(1);
    }
    else if (isDir(target)) {
      stderr.writeln("point: ", target, " is a directory");
      exit(1);
    }
    else if (!isFile(target)) {
      stderr.writeln("point: ", target, " is not a regular file");
      exit(1);
    }
    else {
      interpret(readText(target));
    }
  }
  else
    while (true) {
      write("> ");
      interpret(readln());
    }
}
