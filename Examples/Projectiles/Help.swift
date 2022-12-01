//
// Created by Ángel Vázquez on 27/11/22.
//

import ArgumentParser

enum Help {
    static var inputFile: ArgumentHelp {
        let abstract = """
        Input file in JSON format from where to read position, velocity, gravity, wind and optionally \
        a maximum fraction digits for calculations presentation.

        JSON file should include position, velocity, gravity, wind, and an optional maximum \
        fraction digits like the following format. When not providing a maximum fraction digits \
        count this command defaults to showing 4 fractional digits.

        ```
        {
            "position": { "x": 10.2, "y": 20.3 },
            "velocity": { "x": 10.2, "y": 20.3 },
            "gravity": { "x": 10.2, "y": 20.3 },
            "wind": { "x": 10.2, "y": 20.3 },
            "maximumFractionDigits": 6
        }
        ```
        """
        return ArgumentHelp(abstract)
    }
}