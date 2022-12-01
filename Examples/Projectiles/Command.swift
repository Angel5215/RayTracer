//
// Created by Ángel Vázquez on 24/11/22.
//

import ArgumentParser
import Foundation
import RayTracer

@main
struct Command: ParsableCommand {
    static let configuration = CommandConfiguration(
        abstract: "A utility to simulate firing projectiles",
        version: "0.1.0",
        subcommands: [Calculate.self],
        defaultSubcommand: Calculate.self
    )
}

// MARK: - Options
struct Options: ParsableArguments {
    @Option(name: .customLong("input"), help: Help.inputFile, transform: URL.init(fileURLWithPath:))
    var inputFile: URL
}