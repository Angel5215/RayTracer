//
// Created by Ángel Vázquez on 01/12/22.
//

import ArgumentParser
import Foundation

struct Options: ParsableArguments {
    @Option(name: .customLong("input"), help: Help.inputFile, transform: URL.init(fileURLWithPath:))
    var inputFile: URL
}