#!/usr/bin/env fontforge

# This script will only work with FontForge's Python extension.
import fontforge
import glob

exts = ['otf', 'ttf']
patch = './patch/patch.fea'

for ext in exts:
  fontfile = './font/*.' + ext
  fonts = glob.glob(fontfile)
  for font in fonts:
    f = fontforge.open(font)

    # Remove all GSUB lookups
    for lookup in f.gsub_lookups:  
      f.removeLookup(lookup)
      
    # Merge patch features
    f.mergeFeature(patch)
    f.generate(font, flags=('opentype', 'no-hints'))

    f.close()
