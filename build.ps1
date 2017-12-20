﻿. .\build-helpers

$authors = "Patrick Lioi"
$copyright = copyright 2017 $authors
$configuration = 'Release'

function License {
    mit-license $copyright
}

function Clean {
    exec { dotnet clean src -c $configuration /nologo }
}

function Restore {
    exec { dotnet restore src }
}

function Build {
    exec { dotnet build src -c $configuration --no-restore /nologo }
}

function Test {
    $test = { dotnet fixie --configuration $configuration --no-build }

    run-tests src/DefaultConvention.Tests $test 2
    run-tests src/CustomConvention.Tests $test 0
    run-tests src/x64.Tests $test 0
    run-tests src/x86.Tests $test 0
}

run-build {
    step { License }
    step { Clean }
    step { Restore }
    step { Build }
    step { Test }
}