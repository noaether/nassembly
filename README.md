# nassembly

nAssembly is a high-level flavoured version of Intel Assembly, designed for the naOS Operating System

## Installation

Use [Antlr Command Line Tools](https://github.com/antlr/antlr4-tools) to parse/lex *nsmb* code.

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

## More Information

Refer to :
- [HOWTO.md](HOWTO.md) for information about how to actually make something using *nsmb*. \
- [PHILOSOPHY.md](PHILOSOPHY.md) for my rhetoric and reasoning under ***why*** I made *nsmb* into a thing.
- Everything under [examples](examples/) for basic programs that outline the functionment of *nsmb*.

## Contributing

Pull requests are welcome. For major changes, please open an issue first
to discuss what you would like to change.

Refer to [CONTRIBUTING.md](CONTRIBUTING.md) and [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md) for more information and guidelines.

## License

This project - like all of my other projects - uses the [BSD 3-Clause](LICENSE).

You can :
- modify
- commercialize
- distribute
- sublicense
- place warranty

You cannot : 
- use my trademarks 
- hold me liable 

You must : 
- Include MY Copyright
- Incluse the same license [BSD 3-Clause](LICENSE)

*i am not a lawyer, blah-blah-blah, get real advice and just be smart*
