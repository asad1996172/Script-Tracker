# Script Tracker
  [![forthebadge made-with-python](http://ForTheBadge.com/images/badges/made-with-python.svg)](https://www.python.org/) <br>
 ![Open Source Love svg1](https://badges.frapsoft.com/os/v1/open-source.svg?v=103)
  ![Ask Me Anything !](https://img.shields.io/badge/Ask%20me-anything-1abc9c.svg)
![GitHub license](https://img.shields.io/github/license/Naereen/StrapDown.js.svg)
  <a href="https://patreon.com/denysdovhan">
    <img src="https://img.shields.io/badge/support-patreon-F96854.svg?style=flat-square"
      alt="Donate" />
  </a>


<!-- PROJECT LOGO -->
<br />
<p align="center">
    <img src="https://github.com/Zeeshanahmad4/Script-Tracker/blob/master/resources/circle-cropped.png" alt="Logo" width="160" height="156">  </a>
  <h2 align="center">Script Tracker</h2>
<p align="center">
    <img src="https://img.icons8.com/color/480/000000/google-play.png" alt="Logo" width="50" height="60">
       <img src="https://image.flaticon.com/icons/svg/831/831276.svg" alt="Logo" width="50" height="60">
  
Script Tacker provides an Android and Ios mobile application based dashboard to perform live tracking of your scripts. Currently this is only supporting python. Users can track the progress of their scripts from anywhere. Mobile applications are created using Flutter platform and server side is managed using Firebase.

# Demo
![Demo](https://github.com/Zeeshanahmad4/Script-Tracker/blob/master/Demo.gif)


## Table of Contents

* [Features](#Features)
* [Installation](#installation)
* [Usage](#usage)
  * [Prerequisites](#prerequisites)
* [Roadmap](#roadmap)
* [Contributing](#contributing)
* [License](#license)
* [Developed by](#Developed-By)


## Features

-   Real time report/status of your script on an android/ios app
-   Unlimited scripts
-   Numbers of **loops** Done/Crashed
-   Script Compelete/Crashed ** report** 
-   Elapsed time of the script

## Installation


To install Script-Tracker:
```sh
$ pip install script-tracker

```

Clone the repo
```sh
git clone https://github.com/asad1996172/Script-Tracker.git
```

## Usage

### Prerequisites

 1-    Download and install the app in your phone
 2-    Register an account 

### Import and initilize

In your script/bot/scraper/python code

```
from script_tracker import ScriptTracker

```

```
script_tracker = ScriptTracker()
script_tracker.initialize('registeraccount@gmail.com', 'Password', 'Script Name')

```

### Options in your script:
```
  --initialize()                 initialize the script                        [your_email, your_password, script_name]
  --set_status_to_completed()    flag for successfully completion of script   [Null]
  --set_status_to_crashed()      flag for crashing of script                  [Null]
  --send_data()                  sending data to your app's Dashboard         [total_done, total_crashed,unique_crash_logs]                                   
```

### Example:
Suppose I want to track my script while I am in the university taking lecturer or outside having fun with friends and script is either running in online server or at home in my local server.

```
from script_tracker import ScriptTracker. #importing tracker in my script
import time 

script_tracker = ScriptTracker() #creating an object
script_tracker.initialize('registeraccount@gmail.com', 'Password','Script Name')#initializing with my credentials and s-name

total_done = 0 #variable to sore success loops
total_crashed = 0 #variable for crashed loops
crash_flag = 0 
unique_crash_logs = []
for i in range(10):
    crash_flag += 1
    if crash_flag==4:  # collecing crashes
        total_crashed+=1
        crash_flag = 0
    else:
        total_done += 1 #collecting done 
    script_tracker.send_data(total_done, total_crashed, unique_crash_logs) #sending data to my app's Dashboard

script_tracker.set_status_to_completed() #if script successfully completed 
```

```
script_tracker.set_status_to_crashed() #if script crash for some use this
```
## To Do

-   [ ] Add Single variables tracking  (V_0.2)
-   [ ] Screenshot fucntionalities 
-   [x] Sample todo 


<!-- ROADMAP -->
## Roadmap
See the [open issues](https://github.com/asad1996172/Script-Tracker.git/issues) for a list of proposed features (and known issues).

<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to be learn, inspire, and create. Any contributions you make are **greatly appreciated**.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

<!-- LICENSE -->
## License
Distributed under the MIT License. See `LICENSE` for more information.


# Developed by

* Asad Mahmood
  * [asadmahmood.me](http://asadmahmood.me)- <asad007mahmood@gmail.com>
  
* Zeeshan Ahmad 
  * [zeeshanahmad.me](http://zeeshanahmad.me) - <ahmadzee26@gmail.com>


