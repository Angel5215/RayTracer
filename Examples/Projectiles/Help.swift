//
// Created by Ángel Vázquez on 27/11/22.
//

import ArgumentParser

enum Help {
    static var position: ArgumentHelp {
        ArgumentHelp(stringLiteral:
        """
        The starting point of the projectile. This value should be passed as a tuple \
        of two elements inside single quotes, separated by a comma without spaces. \
        Values are allowed to be negative numbers e.g. '3.59,-15.39'.
        """)
    }

    static var velocity: ArgumentHelp {
        ArgumentHelp(stringLiteral:
        """
        The velocity vector of the projectile. This value should be passed as a tuple \
        of two elements inside single quotes, separated by a comma without spaces. \
        Values are allowed to be negative numbers e.g. '3.59,-15.39'.
        """)
    }

    static var gravity: ArgumentHelp {
        ArgumentHelp(stringLiteral:
        """
        The gravity vector of the environment. This value should be passed as a tuple \
        of two elements inside single quotes, separated by a comma without spaces. \
        Values are allowed to be negative numbers e.g. '3.59,-15.39'.
        """)
    }

    static var wind: ArgumentHelp {
        ArgumentHelp(stringLiteral:
        """
        The wind vector of the environment. This value should be passed as a tuple \
        of two elements inside single quotes, separated by a comma without spaces. \
        Values are allowed to be negative numbers e.g. '3.59,-15.39'.
        """)
    }

    static var maximumFractionDigits: ArgumentHelp {
        ArgumentHelp(stringLiteral:
        """
        Maximum fraction digits to display in position calculations. Default value: 4
        """)
    }
}