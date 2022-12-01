//
// Created by Ángel Vázquez on 27/11/22.
//

import ArgumentParser

enum Help {
    static var inputFile: ArgumentHelp {
        let abstract = """
        Input file in JSON format from where to read position, velocity, gravity, and wind.

        Example format:

        ```
        {
            "position": { "x": 10.2, "y": 20.3 },
            "velocity": { "x": 10.2, "y": 20.3 },
            "gravity": { "x": 10.2, "y": 20.3 },
            "wind": { "x": 10.2, "y": 20.3 }
        }
        ```
        """
        return ArgumentHelp(abstract)
    }
}