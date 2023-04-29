// Created on 28/04/23. Last modified in 2023.

import ArgumentParser
import Foundation
import RayTracer

@main
struct Command: ParsableCommand {
    static let configuration = CommandConfiguration(
        abstract: "A utility to simulate firing projectiles",
        version: "0.1.0",
        subcommands: [Calculate.self, Graph.self],
        defaultSubcommand: Calculate.self
    )
}
