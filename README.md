# Point

Point is a stack-based esoteric programming language, initially inspired by [Befunge](https://esolangs.org/wiki/befunge) and [Glass](https://esolangs.org/wiki/glass).

## Installation

Install the point repository using [git](https://git-scm.com/downloads) in a terminal. Go to a directory where you want the repository to be installed in, then:

```bash
git clone https://github.com/Unlimiter/point
```

If you want to rename the repository in the same command, put the new name at the end of the line:

```bash
git clone https://github.com/Unlimiter/point new-name
```

The path of the interpreter is `point/point`, or `new-name/point` if you renamed the repository, with `new-name` being the new name you gave to it.

If you want to execute point as a command from anywhere without typing its path in Linux, go to the directory where the repository is located, then:

```bash
sudo ln -s $PWD/point /usr/local/bin/point
```

Or if you want to give another name to the command, do:

```bash
sudo ln -s $PWD/point /usr/local/bin/another-name
```

If you don't want the command to be global anymore, do:

```bash
sudo rm /usr/local/bin/point
```

Or if you gave it another name, do:

```bash
sudo rm /usr/local/bin/another-name
```

## Usage

To interpret a file containing point code (optionally ending with '.pnt'), assuming the command is `point` and the file is  `file.pnt`, do:

```bash
point file.pnt
```

Additionally, you can execute point code in real time by not passing anything to the command. Example:

```
$ point
> "Hello, Point!"[.]
Hello, Point!
> &
$ 
```

To learn about point's syntax, read the file `instructions.txt`, or visit [Point's wiki page](https://esolangs.org/wiki/point).

## Getting help
If you experience any problem with the point interpreter, please open an issue.

If the problem is related to git, please check [here](https://git-scm.com/community) or open an issue on [git's repository on Github](https://github.com/git/git).

## License
[MIT](https://choosealicense.com/licenses/mit/)
