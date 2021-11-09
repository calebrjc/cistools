# File: disassembler.py
# Author(s): Caleb Johnson-Cantrell

import click

@click.command()
def disassemble():
    ''' Disassembles a hex file (default .mem) into a program listing (default .txt). '''
    print('Disassemble')
