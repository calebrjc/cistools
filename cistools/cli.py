# File: cli.py
# Author(s): Caleb Johnson-Cantrell

import sys

import click

from cistools.assembler import assemble
from cistools.disassembler import disassemble

@click.group()
def cli():
    '''The entry point for this applicaiton. This function allows click to route the program flow
       to the correct function given the arguments that are passed.'''
    pass

cli.add_command(assemble)
cli.add_command(disassemble)

# Detects if this program has been frozen with pyinstaller and, if so, runs this program.
if getattr(sys, 'frozen', False):
    cli(sys.argv[1:])
