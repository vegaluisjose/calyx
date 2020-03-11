# Fuse Temporal Intermediate Language (FuTIL)
An intermediate language for [Dahlia](https://github.com/cucapra/dahlia).

## Installing
We are in the process of transitioning everything over to Rust. At the moment the interpreter is still in racket, although it hasn't been kept up to date with the syntax changes. `Calyx` is the name of the pass framework that we are writing. Instructions for installation are below.

### Install Calyx
Once you have rust and cargo installed ([here](https://doc.rust-lang.org/cargo/getting-started/installation.html) are instructions), you should be
able to go into the `calyx` directory and run `cargo build`. This will download and install
all the dependencies.

### Install Racket stuff
This is old stuff that isn't working with the new version of FuTIL. You probably want to just install the calyx stuff.

## Running
`cargo build` builds the Futil executable and places it in `target/debug/calyx`. I would recommend using `cargo run` directly.
This builds and and runs the executable. You can pass in arguments to the Futil executable like this: `cargo run -- <args>`

There are a series of Futil example programs in `calyx/examples`. All of these use primitive components so to get them to run
you will need to pass in a library file. The most complete library file is located in `calyx/primitives/std.lib`. This is done with
the `-l`. For example, this is how to run the `calyx/examples/simple.futil` program, assuming you are in the `calyx` directory:

```bash
cargo run -- examples/simple.futil -l primitives/std.lib
```

