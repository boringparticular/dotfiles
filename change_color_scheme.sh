#!/usr/bin/env bash


./apply_color_scheme.py $(fd '*.yaml' schemes --glob | fzf --reverse --preview=window=default --preview='./color_preview.py {}')
./derive_color_formats.py
chezmoi apply
