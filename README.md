# INGAME

INGAME is a motion emulator with virtual reality features for playing first person
shooting/adventure games. Virtual reality (VR) is a simulated experience that can be similar to
or completely different from the real world. INGAME has been designed to provide the user
with the feeling of being 'IN-the-GAME'. INGAME is modular in nature and consists of the
following modules.

1. HID module
1. Controller module
1. Pedometer module
1. VR headset

The first three modules listed above have been explained in detail later in the document. The
VR headset provides split stereo video to the user. The following image shows the functional
block diagram of the INGAME system 

![System block diagram](/documents/images/System-Block-Diagram.drawio.png)


## Salient features
* Modular to support addons
* Tangle free gaming since the entire system is wireless
* Adaptable to any first person shooting/adventure game
* Minimal lag during gaming due to high-speed data transfer
* Power saving mode to make the battery last longer
* Product certifications: CE certified and ROHS compliant 


## HID module 

### Functions 
- Act as a wireless gateway between the modules worn by the user and the computer
- Connect with the computer via USB as an HID device
- Receive data wirelessly and then map the data to controls of the selected game and send appropriate key strokes to the computer
- Switch the game controls mapping depending on the user selected game
- Display a menu showing information about the system

## Controller module

### Functions
- Connect with the HID module wirelessly
- Send data associated with a button when a button is pressed
- Read IMU data, compute equivalent mouse movement and send the data to the HID module
- Calibrate the IMU device when the calibration button is pressed
- Monitor battery level and sound a buzzer when the battery is low
- Switch to power saving mode upon user inactivity
- [Optional] Control a vibration motor to simulate gunfire which increases in intensity per trigger button press

## Pedometer module

### Functions
- Connect with the HID module wirelessly
- Read accelerometer data, detect steps and send the data to the HID module
- Calibrate the IMU device when the calibration button is pressed
- Monitor battery level and sound a buzzer when the battery is low
- Switch to power saving mode upon user inactivity

  
### Made with lots of ⏱️, 📚 and ☕ by InputBlackBoxOutput