#!/usr/bin/env python

import click

@click.command()
@click.option('--greeting', default='Hiya', help='How do you want to be greeted')
@click.option('--name', default='Gman', help='what is your name?')

def greet(greeting, name):
    print(f'{greeting} {name}')


@click.group()
def cli():
    pass

@click.group(help='Gman related commands')
def gman():
    pass

cli.add_command(gman)


if __name__ == '__main__':
    greet()