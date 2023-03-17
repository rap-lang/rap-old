module main

import cli { Command, Flag }
import os

fn main() {
	mut cmd := Command{
		name: 'rap'
		description: 'Rapid and Painless programming language.'
		version: '1.0.0'
		usage: '<file>'
		required_args: 1
		pre_execute: run_pre_func
		execute: run_func
	}
	mut run_cmd := Command{
		name: 'run'
		description: 'Runs a .rap file'
		usage: '<file>'
		required_args: 1
		pre_execute: run_pre_func
		execute: run_func
	}
	cmd.add_command(run_cmd)
	cmd.setup()
	cmd.parse(os.args)
}

fn run_func(cmd Command) ! {
	file := cmd.args[0]
}

fn run_pre_func(cmd Command) ! {
	file := cmd.args[0]
  if !os.exists(file) {
    println("==> No file with the name '${file}' <==")
    exit(1)
  }
}
