name: "CiCdTestFlight"
platforms: {
    iOS: "14.0"
}
products: [
    {
        name: "CiCdTestFlight",
        type: .application,
        targets: ["CiCdTestFlight"]
    }
]
dependencies: [
    // Add any dependencies your project requires here
]
targets: [
    {
        name: "CiCdTestFlight",
        dependencies: [],
        path: "src"
    }
]