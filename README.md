# README

### ~~ Fermy ~~

  This application is in development by Brian Christensen and Ben Nesbit.

  It is a "Brewer's Log" application for any and all things fermented that will allow the user to log and access
  information about the brewing process including:

    * type of ingredients used
    * amount of ingredients used
    * weather conditions
    * additional notes

  There will also be a section for each brew that the
  user can fill out, after the brew is complete, for additional comments.

### Getting Started

This is a Ruby on Rails app with an RSpec test suite. In order to do anything,
the following dependencies must be addressed:

First, install **Ruby**

  #### Linux (Recommended):
  Here is the documentation for installing ruby and getting it up and running
  https://rubyinstaller.org/
  In the Linux command line, type:
  sudo apt-get install ruby-full

  #### Mac OS (Recommended that you use Linux, but):
  Here is a helpful site for installing ruby not on Linux
  https://rubyinstaller.org/

  #### Windows (Seriously, just use Linux):
  If you don't want to dual-boot or switch over to Linux, you easily run a
  Linux subsystem on your computer, such as Ubuntu:
  https://www.maketecheasier.com/install-linux-subsystem-for-windows10/

  I guess if you really, REALLY don't want to use Linux or a Linux subsystem,
  you can follow the instructions here:
  https://rubyinstaller.org/

Second, install **Rails**

  gem install rails

Third, **verify versions**

  This project uses:
    Ruby version 2.6.0
    Rails version 5.2.3
    RSpec version 3.8.2

### A note on conventions:

  This project uses the Ruby Style Guide enforced by `rubocop`

### Run the app:

  From the command line, in the project directory, execute:
    `$ rails server`
  Once the server is running locally, use a browser to navigate to
    `localhost:3000`

### Run the RSpec test suite:

  From the command line, in the repo directory, execute `rspec`
