# Package

version       = "0.1.0"
author        = "nirokay"
description   = "A basic todo application for your terminal."
license       = "GPL-3.0-only"
srcDir        = "src"
bin           = @["todo"]


# Dependencies

requires "nim >= 2.0.0"
requires "db_connector"
