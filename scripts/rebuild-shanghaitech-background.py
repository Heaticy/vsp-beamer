#!/usr/bin/env python3
"""Rebuild the background offline from the 8K master and official crest.

Requires ImageMagick, vtracer 0.6.15 and CairoSVG. Intermediate SVG/masks
are kept in build/background-review for inspection. The crest source is
https://raw.githubusercontent.com/zhangganlin/zhangganlin.github.io/master/images/education/shanghaitech_logo.svg
"""
from copy import deepcopy
from pathlib import Path
import subprocess
import os
import xml.etree.ElementTree as ET

import cairosvg
import vtracer

ROOT = Path(__file__).resolve().parents[1]
WORK = ROOT / 'build/background-review'
NS = 'http://www.w3.org/2000/svg'
ET.register_namespace('', NS)
RED = '#A40006'


def convert(*args):
    subprocess.run(['convert', *map(str, args)], check=True,
                   env={**os.environ, 'MAGICK_TEMPORARY_PATH': str(WORK)})


def trace(mask, name, scale=1):
    target = WORK / f'{name}.svg'
    vtracer.convert_image_to_svg_py(
        str(mask), str(target), colormode='binary', mode='spline',
        filter_speckle=4 * scale * scale, corner_threshold=60,
        length_threshold=4.0, splice_threshold=45, path_precision=3)
    group = ET.Element(f'{{{NS}}}g', {'fill': RED})
    if scale != 1:
        group.set('transform', f'scale({1 / scale})')
    for node in ET.parse(target).getroot():
        node.attrib.pop('fill', None)
        group.append(node)
    return group


def main():
    WORK.mkdir(parents=True, exist_ok=True)
    master = ROOT / 'shared-assets/backgrounds/shanghaitech-master.png'
    mask = WORK / 'mask.png'
    convert(master, '-background', 'white', '-alpha', 'remove', '-alpha',
            'off', '-colorspace', 'Gray', '-threshold', '55%', mask)
    # Separate the lockup so the small raster crest is never traced.
    body = WORK / 'body.png'
    convert(mask, '-crop', '7680x1320+0+3000', '+repage',
            '-blur', '0x0.8', '-threshold', '50%', body)
    words = WORK / 'wordmark.png'
    convert(mask, '-crop', '1190x309+6242+201', '+repage', '-resize', '200%',
            '-blur', '0x1.2', '-threshold', '50%', '-bordercolor', 'white',
            '-border', '4', words)
    svg = ET.Element(f'{{{NS}}}svg', {
        'width': '7680', 'height': '4320', 'viewBox': '0 0 7680 4320'})
    bottom = ET.SubElement(svg, f'{{{NS}}}g', {'transform': 'translate(0 3000)'})
    bottom.append(trace(body, 'body'))
    official = ET.parse(ROOT / 'shared-assets/logos/shanghaitech-official.svg')
    crest = deepcopy(official.getroot().find(f"{{{NS}}}g[@id='g3']"))
    crest.set('transform', 'translate(5688 116) scale(0.797274276 0.817856534)')
    crest.set('fill', RED)
    # The Illustrator source's CSS color must not override the theme red.
    for node in crest.iter():
        node.attrib.pop('class', None)
        node.attrib.pop('style', None)
        node.attrib.pop('fill', None)
    crest.set('fill', RED)
    svg.append(crest)
    positioned = ET.SubElement(svg, f'{{{NS}}}g', {
        'transform': 'translate(6240 199)'})  # Undo the four supersampled border pixels.
    positioned.append(trace(words, 'wordmark', 2))
    output = WORK / 'shanghaitech-master.svg'
    ET.ElementTree(svg).write(output, encoding='utf-8', xml_declaration=True)
    pdf = ROOT / 'shared-assets/backgrounds/shanghaitech-master.pdf'
    cairosvg.svg2pdf(url=str(output), write_to=str(pdf),
                    output_width=1920, output_height=1080)
    print(f'{sum(1 for n in svg.iter() if n.tag.endswith("}path"))} paths; '
          f'{pdf.stat().st_size} PDF bytes')


if __name__ == '__main__':
    main()
