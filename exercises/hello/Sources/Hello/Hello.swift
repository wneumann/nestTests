struct Hello {
  var text = "Hello, World!"
  func hello(name: String = "Bubba") -> String {
    "Hello, \(name)!"
  }
}
