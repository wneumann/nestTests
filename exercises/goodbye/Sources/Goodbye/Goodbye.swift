struct Goodbye {
  var text = "Goodbye, World!"
  func bye(name: String = "Bubba") -> String {
    "Goodbye, \(name)!"
  }
}
