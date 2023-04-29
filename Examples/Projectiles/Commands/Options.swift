// Created on 28/04/23. Last modified in 2023.

import ArgumentParser
import Foundation

struct Options: ParsableArguments {
    @Option(name: .customLong("input"), help: Help.inputFile, transform: URL.init(fileURLWithPath:))
    var inputFile: URL
}
