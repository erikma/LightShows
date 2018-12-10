# RelayLights
A project for controlling 12V LED light strips, using:

* A Raspberry Pi 3. A model 2B might work but not tested.
* Banks of relays, e.g. a [4-channel 5V relay](https://www.sainsmart.com/products/4-channel-5v-relay-module).
* TypeScript / Node.js controller software, using the Node.js version of PiGPIO.

# Using This Repo

## Getting started - First Time Setup

1. Install Git [for Windows](https://git-scm.com/download/win), or [for other operating systems](https://git-scm.com/download).
1. Install [Node.js](https://nodejs.org) (click the Current button to get the latest).
1. Install [Visual Studio Code](https://www.visualstudio.com/products/code-vs), plus the plugins 'C#' (from Microsoft), 'NuGet Package Manager', 'TSLint'
1. Open a Windows console: Windows+R (to open the Run box), then type `cmd` and press Enter.
1. Create a new folder: `mkdir c:\RelayLights`
1. Move to that folder: `cd c:\RelayLights`
1. Clone the Git repo to your new folder: `git clone https://github.com/erikma/RelayLights.git .`

## Building code
We use [Gulp](https://gulpjs.org/) as a build system to convert code files into final results.
We have integrated Gulp into Visual Studio Code to make life easier. To run a build, press `Ctrl+Shift+B` and ensure you have no errors showing in VSCode.

Building the code places the results into the out/ folder.

You can also run the build in the Windows console if you need to by running the command `gulp`.

## Running the code on your Raspberry Pi
The out/RelayLights directory contains the transpiled TypeScript code and an execution script, RunRelayLights.sh . Execute this script when running as the 'pi' user on your Raspberry Pi. The script will execute the RelayLights Node.js software under the root user using 'sudo', since the PiGPIO library requires running as root to access GPIO pins on the Raspberry Pi.
