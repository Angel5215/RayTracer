//
// Created by Ángel Vázquez on 27/11/22.
//

import ArgumentParser

enum Help {
    static let inputFile = ArgumentHelp("""
    Input file in JSON format from where to read position, velocity, gravity, wind and a speed scalar.

    Example format:

    ```
    {
        "position": { "x": 10.2, "y": 20.3 },
        "velocity": { "x": 10.2, "y": 20.3 },
        "gravity": { "x": 10.2, "y": 20.3 },
        "wind": { "x": 10.2, "y": 20.3 },
        "speed": 11.25
    }
    ```
    """)

    static let maximumFractionDigits = ArgumentHelp("Maximum fraction digits to display")

    static let width = ArgumentHelp("Width of the image to generate in pixels")
    static let height = ArgumentHelp("Height of the image to generate in pixels")

    static let outputFile = ArgumentHelp(
        "Name for custom output file for PPM file. Defaults to `projectile.ppm`"
    )
}