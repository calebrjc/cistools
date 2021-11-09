# File: assembler.py
# Author(s): Caleb Johnson-Cantrell

import click

@click.command()
def assemble():
    ''' Assembles a source program (default .asm) into hex (default .mem). '''
    print('Assemble')
