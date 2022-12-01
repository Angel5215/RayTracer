# RayTracer

<p align="center">
    <img src="https://github.com/Angel5215/RayTracer/workflows/ci/badge.svg" alt="Build Status"/>
</p>

This repository contains the source code for my attempt at building a **ray tracer** while following [The Ray Tracer Challenge](http://raytracerchallenge.com/).

The challenge allows the ray tracer to be implemented on any programming language and environment, so I chose Swift. 

The current goal is to be able to render the following images:

<table>
    <tr>
        <td>
            <img src="resources/img/README/01-transforms.jpg"/>
            <p align="center">Transformed surfaces</p>
        </td>
        <td>
            <img src="resources/img/README/02-reflect-refract.jpg"/>
            <p align="center">Reflection, Refraction, and Shadows</p>
        </td>
    </tr>
    <tr>
        <td>
            <img src="resources/img/README/03-cornell-box.jpg"/>
            <p align="center">Objects composed of polygons</p>
        </td>
        <td>
            <img src="resources/img/README/04-csg-demo.jpg"/>
            <p align="center">Constructive Solid Geometry (CSG)</p>
        </td>
    </tr>
</table>

## Current progress

### Chapter 1. Tuples, Points, and Vectors.
Chapter 1 is complete with implementation of primitives (tuples, points, and vectors) and some of its operations (add, subtract, scalar multiplication and division, dot product, cross product, normalization, and magnitude). 

To test these in action, a sample CLI tool can be run to play a simulation of firing virtual projectiles and see how far they go. To run you can set up a terminal and type the following command. 

The CLI tool reads a JSON file that requires a `position`, a `velocity`, a `gravity` and `wind`. It optionally requires a `maximumFractionDigits` that will control the amount of fraction digits displayed in calculations. An example for this file is included [here](Examples/Files/projectiles.json).

```bash
# Passing an input JSON file with values
swift run projectiles --input Examples/Files/projectiles.json
```