# nassembly

nAssembly is a high-level flavoured version of x86_64 assembly, designed for the naOS Operating System

## Installation

Use [Antlr Command Line Tools]https://github.com/antlr/antlr4-tools) to parse/lex nsmb code.

```bash
$ pip install antlr4-tools
```

If needed, ANTLR will download it's required libraries 

```bash
$ antlr4
```

## Usage

```bash
# run antlr
$ antlr4 -lib ./ANTLR/ -o <file output>

# returns a text tree view
$ antlr4-parse ANTLR/NAssemblyParser.g4 <start rule> -tree

# returns a visual tree view 
$ antlr4-parse ANTLR/NAssemblyParser.g4 <start rule> -gui
```

## Contributing

Pull requests are welcome. For major changes, please open an issue first
to discuss what you would like to change.

Refer to [CONTRIBUTING.md](CONTRIBUTING.md) and [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md) for more information and guidelines.

## License

[BSD 3-Clause](LICENSE)