// swift-tools-version:4.2

import PackageDescription
import Foundation

extension String {
  var pascalCased: String {
    let items = self.components(separatedBy: "-")
    return items.reduce("", { $0 + $1.capitalized })
  }
}
let currentDirectory = FileManager.default.currentDirectoryPath
let configPath = currentDirectory + "/config.json"
var allProblems = [String]()

if
    let jsonData = try? Data(contentsOf: URL(fileURLWithPath: configPath), options: Data.ReadingOptions.mappedIfSafe),
    let json = try? JSONSerialization.jsonObject(with: jsonData, options: []),
    let jsonDict = json as? [String: Any],
    let exercisesDict = jsonDict["exercises"] as? [[String: Any]],
    let exercises = exercisesDict.map({ $0["slug"] }) as? [String] {
    allProblems += exercises
} else {
    print("Could not parse config.json at \(configPath)")
}
let allProblemsPascalCase = allProblems.map { $0.pascalCased }

#if os(Linux)
// Create ./Tests/LinuxMain.swift
let allTestCases = allProblemsPascalCase.map { "testCase(\($0)Tests.allTests)," }

let linuxMainText =
"""
import XCTest
@testable import nestTestsTests

XCTMain([
\(allTestCases.joined(separator: "\n"))
    ])
"""

let linuxMainFilePath = currentDirectory + "/LinuxMain.swift"

do {
    if FileManager.default.fileExists(atPath: linuxMainFilePath) {
        try FileManager.default.removeItem(atPath: linuxMainFilePath)
    }
    try linuxMainText.write(to: URL(fileURLWithPath: linuxMainFilePath), atomically: false, encoding: .utf8)
} catch let fileError {
    print("Could not write file. \(fileError)")
}
#endif

//print("Doin' things…")

let packageDependencies: [Package.Dependency] = allProblems.map { .package(path: "./exercises/\($0)/") }
//print("Package Dependencies:")
//for dep in packageDependencies { print(dep.name, dep.requirement, dep.url) }

let targetDependencies: [Target.Dependency] = allProblemsPascalCase.map { .byName(name:"\($0)") }
//print("Target Dependencies:")
//for target in targetDependencies { print(target) }

//print("Doin' more things…")

let sources  = allProblems.map { "./\($0)/Sources" }
//print("Sources:")
//for source in sources { print(source) }

let testSources  = allProblems.map { "./\($0)/Tests" }
//print("Test sources:")
//for test in testSources { print(test) }

let package = Package(
    name: "nestTests",
    products: [
        .library(
            name: "nestTests",
            targets: ["nestTests"]
            )
    ],
    dependencies: packageDependencies,
    targets: [
        .target(
            name: "nestTests",
            dependencies: targetDependencies,
            path: "./exercises",
            sources: sources
            ),
        .testTarget(
            name: "nestTestsTests",
            dependencies: ["nestTests"],
            path: "./exercises",
            sources: testSources
            ),
        ]
    )

print("Package info:")
print(package)
