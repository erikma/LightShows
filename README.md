# RelayLights
A project for controlling LED light strips, using:

* A Raspberry Pi 3B.
* SPI interface.

# Using This Repo

## Getting started - First Time Setup

1. Install Git [for Windows](https://git-scm.com/download/win), or [for other operating systems](https://git-scm.com/download).
1. Install [Node.js](https://nodejs.org) (click the Current button to get the latest).
1. Install [Visual Studio Code](https://www.visualstudio.com/products/code-vs), plus the plugins 'C#' (from Microsoft), 'NuGet Package Manager', 'TSLint'
1. Open a Windows console: Windows+R (to open the Run box), then type `cmd` and press Enter.
1. Create a new folder: `mkdir c:\LightShows`
1. Move to that folder: `cd c:\LightShows`
1. Clone the Git repo to your new folder: `git clone https://github.com/erikma/LightShows.git .`

## Running the code on your Raspberry Pi
The src/ folder contains a BiblioPixel project 'src' including its configuration file. Various .py files are custom animations that are configured in the yml file as a shuffled slideshow-like series. Run `bp src.yml` to run the animation.

Run `bp -s src.yml` to run a SimPixel browser-based simulation instead of the Raspberry Pi SPI hardware drivers configured by default.
