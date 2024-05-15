## Visionary_S_AP_1Mpx_Color_Image
Sample to show how obtain the 1Mpx color image from the Visionary-S AP device.

### Description
Setup and starts the camera to receive the RGGB bayer pattern. This is done by selecting ColorImagerMode = 'RGGB', which means the data layout in the memory will then looks like this:  
```
R   G1  R   G1 ..  
G2  B   G2  B  ..  
..  
```
React to the `OnNewImage` event of `gCamera` and do the demosaicing. Then present the full resolution color image (1280x1024) in a 2d viewer.

### Compatibility

| Device | Compatible |
| ------ | ------ |
| Visionary-T AP | ❌ |
| Visionary-S AP<br>*version >= 3.0.0* | ✔ |
| Visionary-B Two | ❌ |

### How to run
Start by running the app (F5) or debugging (F7+F10).
Set a breakpoint on the first row inside the main function to debug step-by-step.
See the results in the viewer on the DevicePage.

### Topics
view, visionary, stereo, sample, sick-appspace
