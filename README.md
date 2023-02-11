A simple application that can shutdown a Raspberry PI when a pushbutton is pressed.


Building
========
Requires GCC, cmake, make and libgpiod:

    sudo apt install gcc g++ make cmake libgpiod-dev

I connected a pushbutton between GPIO 21 and GND. If you use a different GPIO pin then update the following like in main.cpp:

    #define BUTTON 21

From the folder containing the checked out code do:

    mkdir build
    cd build
    cmake ..
    make

Running
=======
The application must be run as root otherwise the shutdown command will not succeed.

Running as boot
---------------
The application is most useful when run at boot. To achieve this edit the file `gpioshutdown.service` to update the `ExecStart` line to point to your built executable. Then:

    sudo cp gpioshutdown.service /etc/systemd/system
    sudo systemctl enable gpioshutdown.service