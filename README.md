# Home Assistant Open Doñita add-on

The [Open Doñita server](https://gitlab.com/rastersoft/opendonita) add-on for Home Assistant.

## Compatibility

OpenDoñita is a server designed to work with the Conga 1390/1490/1590 robotic vacuum cleaners
distributed by Cecotec in Spain. Since it is really a robot manufactured by the chinese company
robot bona, it is very probable that it would work with other robots.

## Installation

[![Open your Home Assistant instance and show the dashboard of an app.](https://my.home-assistant.io/badges/supervisor_app.svg)](https://my.home-assistant.io/redirect/supervisor_app/?app=fe7d3f1a_opendonita&repository_url=https%3A%2F%2Fgithub.com%2Fale87jan%2Fopendonita-fork)

After having done this, you can jump to **Conecting the robot to the new server**

### Connecting the robot to the new server

Now there are three ways of connecting the robot to the server:

- Turn off the WiFi router and turn on again (or stop *hostapd*, wait some seconds, and start it
  again if you are using an isolated WiFi network)
- Or turn off the robot for some seconds and turn on it again. This requires removing it from the
  charging base and turning it off with the lateral switch.
- Or pair it manually as specified in the next section.

### Pairing the robot manually

To pair the robot you need a computer with a WiFi adapter. First, put your robot in *pairing mode*
by pressing the power button until it sends a beep. The Wifi light will blink.

Now, in your computer, search for a WiFi network called *CongaGyro_XXXXXX* (if you are using a robot
from another distributor, the Wifi SSID can change) and connect to it (it has no password).

After connecting, run in your computer the program **pairconga.py**. It is a python program that should work in Windows,
Linux and Macintosh (if you have installed python3, of course). It will show a window like this one:

![The pairing app](pair_app.png)

Type in the first field the SSID of your WiFi, in the second field the password, and in the third field put the IP of
the device with the OpenDoñita server, and do click in **Pair robot** button. Wait the answer (which should be
"Pairing OK"), and now your robot should be paired with the WiFi and connected to your local server.

## Using OpenDoñita dashboard

In the main screen you have four buttons:

The *home* button: when it is filled of color, it means that the robot is not in the base. Clicking
on it will send it to the charger.

The *play* button: this triangle starts a new clean cycle, and will change to a square (or *stop*)
button, which will stop the clean cycle.

The *map/manual control* button: it alternates between MAP mode and MANUAL CONTROL mode.

The *settings* button: this button will open a popup where it is possible to choose the fan power,
the water flux, the clean mode and the sound mode:

![The settings popup](capture2.png)

This configuration will be remembered even if the robot is turned off and on again.

During cleaning, the app will generate the map in real time:

![Map example](capture3.png)

Doing a displacement with the finger over the screen (or with the mouse) will rotate the map 90
degrees in the specified direction.

## Authors

- [Sergio Costas](http://www.rastersoft.com): Author of the OpenDoñita server
  - [OpenDoñita repository](https://gitlab.com/rastersoft/opendonita)
- [Juan Manuel Servera](https://github.com/jmserver): Author of the Home Assistant add-on.
  - [Home Assistant add-on repository](https://github.com/jmservera/jm-hassio-addons)
  - [Home Assistant OpenDoñita add-on repository](https://github.com/jmservera/opendonita-fork)
