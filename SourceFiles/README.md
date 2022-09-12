## Build your own firmware
If you are reading this, then you want to build your own build of this firmware. ⚙️

Glad to welcome you! 😉
#### And let's get started! 🎉

As always there are two ways 🔴 🔵  

    
##### Offline build:
1. Install PlatformIO into your favorite IDE (I am using VSCode)
2. Open the platformio.ini file as project.
3. Run the build using PlatformIO menu, by clicking 'Build' in preferred environment tab.

##### Online build:
1. Make fork of this project.
2. ``` git clone git@github.com:YOUR_USERNAME/Filament-Scale.git```
3. **Make and test** all changes offline.
4. Run from project dir ```chmod +x ./SourceFiles/Tools/push.sh``` than
  ```./SourceFiles/Tools/push.sh ``` and answer all questions 'y'.
5. In a few minutes you will get the new release, builds for all default environments.
