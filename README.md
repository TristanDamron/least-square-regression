# Regress
Haskell modules and binaries for developing regression models. Regress can perform fast regressions on large amounts of number data.

Current version: 1.0

## What's new in version 1.0?
* Source Haskell modules for use in your Haskell projects
* Binary executable for regressing csv data
* Linear, Logarithmic, and Quadratic regression support (more to come in future versions!)

# Getting Started
If this is your first time using Regress, getting started is easy. Simply download this repository as a .zip or by cloning it with `git clone https://github.com/TristanDamron/regress.git`

If you are interested in using the Haskell modules in your own Haskell program, simply copy the contents of the `src` folder to the main directory of your project. If you are interested in using the Regress command line tool, read the instructions below for your operating system:
### Windows Users 
After downloading the repository to your hard drive, you'll need to add the location of the `bin` folder to your system's %PATH% variable. 

### Unix Users
Coming Soon!

# Using the Regress Command Line Tool
Once you're set up with the command line interface for Regress, you're ready to start analyzing your data! The Regress command follows the following syntax:

`regress.exe "dir/to/x data.csv" "dir/to/y data.csv" lin|log|quad`

The result of this will be a series of numbers determining the value of the variablesfor your model. Linear regressions (y = mx + b) with return two numbers in the order of **m, b.** Logarithmic regressions (y = a + b ln x) will return two numbers in the order of **a, b.** Quadratic regressions (y = ax^2 + bx + c) will return three numbers in the order of **a, b, c.**

# Using the Haskell Modules
This software package comes with three Haskell modules for calculating linear, logarithmic, and quadratic regression models respectively. Once you've downloaded the modules to your project, using them is as easy as...

`import Quadratic as Quad`
`import Linear as Lin`
`import Logarithmic as Log`

`Quad.regress x y`
`Lin.regress x y`
`Log.regress x y`

The pattern for the each of the regress functions is:
`[Double] -> [Double] -> Double`

# License
This software is licensed as free software under the conditions of the GNU GPL v2.0