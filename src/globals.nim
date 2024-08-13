import std/[os, strutils]

import std/[
    logging
]
export
    logging

const
    database*: string = block: ## Database name
        when defined(release): "todo.db"
        else: "testing.db"


let
    pathConfigProject*: string = getConfigDir() / "nirokay" / "todo"
    pathConfigDatabase*: string = pathConfigProject / database

    terminalColumnsDefault: int = 80 ## Default terminal width


var
    logger*: ConsoleLogger = newConsoleLogger() ## Logger
    terminalColumns*: int = terminalColumnsDefault ## Current terminal width


proc updateTerminalColumns*() =
    ## Updates `terminalColumns` variable
    let rawWidth: string = getEnv("COLUMNS", $terminalColumnsDefault)
    try:
        terminalColumns = rawWidth.parseInt()
    except ValueError:
        logger.log(lvlWarn, "Could not find env variable by name 'COLUMNS', using default width")
        terminalColumns = terminalColumnsDefault

proc initConfigDirectory*() =
    ## Creates tbe project config directory, if not exists
    if not pathConfigProject.dirExists():
        pathConfigProject.createDir()
proc initConfigDatabase*() =
    ## Creates the database file in the project config directory, if not exists
    if not pathConfigDatabase.fileExists():
        pathConfigDatabase.writeFile("")
