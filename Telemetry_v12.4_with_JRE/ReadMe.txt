#################################################
# Telemetry app for:
#         Assetto Corsa
#         Assetto Corsa Competizione
#         Automobilista 2
#         DiRT Rally 2.0  
#         F1 2012 to F1 22
#         Grid 2
#         KartKraft
#         Project Cars 2
#         Rfactor 2
#         RaceRoom Racing Experience
#
#################################################
# Author: Iko Rein
#################################################
#
# YouTube channel for the tool is at
#
#       https://www.youtube.com/@racinggametelemetry
# 
#################################################
#
# If you like this tool and/or want to support the 
# development, please buy a license via Paypal at 
#
#       https://paypal.me/IkoMRein
#
# With Version 10 I moved to similar model as
# SimHub uses, i.e. you can buy a license, but 
# are not required to do so.
#
#################################################
#
# Version 12.4
#
#################################################
========================================

---------------------------------
# How to UPDATE
---------------------------------
* Update from older major versions (pre 12.0)
If you are updating from earlier 9.x, 10.x, or 11.x version, unzip the contents of the whole .zip to the place, where you had previous installation. There is new JRE in the bin directory, which must be copied too. And all relays have new version.

* Update from earlier 12.3 or older versions
If you are updating from earlier 12.x version, unzip the Telemetry.jar. Also unzip the 'bin' directory, as all relays have new version.

* Clean install/update
Alternatively you could unzip the contents of the .zip to new location. On the first run the tool will ask for the location of the data files.

* AC users
There is now the Telemetry Tool plugin, which needs to be installed in order to receive multi-car data. You can either unzip the Telemetry_Tool_plugin.zip to the <AC base install> directory in your AC installation or use the Content Manager for that. 
The tool will automatically detect the datasources, when you start driving and will adjust operation based on the sources.
There is also new AC_SharedMemory_Relay_x64.exe relay in the 'bin\ac_relay' directory.

* ACC users
There is new ACC_SharedMemory_Relay_x64.exe relay in the 'bin\ac_relay' directory.
The new Valencia trackmap is in the tracks\acc directory

* AMS2 users
There is new ACC_SharedMemory_Relay_x64.exe relay in the 'bin\ac_relay' directory.
There are also new trackmaps in the tracks\ams2 directory

* rFactor2 users
There is new TelemetryToolPlugin.dll. Replace the old in the <RFACTOR2 directory>\bin64\Plugins
The new plugin is needed to be used with Telemetry Tool version 12.4 or greater.
The plugin might also need to be enabled in the game in rFactor 2 plugin page.
There are also new trackmaps in https://telemetrytool.com/addons

* R3E users
There is new version of the shared memory relay for R3E, which will (should) run automatically, when you start the Tool via the launcher. (runWin.bat (windows), runLinux.sh (linux) or runMac.sh (mac))

* Database fixes
It might be advisible to run the "Tools --> Manage DB --> Fix database" to fix issues regarding new/changed indexing of tracks and cars, especially with ACC and AMS2.	

* Extra Trackmaps for: PC2 and R3E
You can get additional trackmaps for these games from https://telemetrytool.com/addons

---------------------------------
# OpenJDK binaries included - 
---------------------------------
I have included custom JRE 17 with this package.

The binaries for windows are already unzipped. The binaries for Linux (x64) and mac (x64) are zipped in bin directory and should be unzippped to linux or mac directory respectively. See below for the platform specific install instructions.

If for some reason the tool is not working properly or there is Java related issue, you can download the JRE for your platform from https://www.azul.com/downloads/zulu-community/?version=java-17-ltd&package=jre-fx
and then unzip the package to the bin directory and adjust the .bat and .sh files accordingly. If you install this package, then also the double-click on the Telemetry.jar should work. 

---------------------------------
# What is new in 12.4
---------------------
Workspace
	- added 'Save Workspace' and 'Load Workspace' buttons to make it easier to save and load different workspaces

AC
	- Fixed the directory structure of the TelemetryToolPlugin.zip to make the install work better with the Content Manager
	- New version of the Plugin, no big changes, removed some non-needed things, cleaned the code and made the plugin to send version info.
		- You can update to new version or keep using the old version.
	- Modified the AC_SharedMemory_Relay so that if you put the relay_settings.ini in the same directory as the relay (i.e. <Tool base>\bin\ac_relay), the Relay will be using that for settings. If that file exists, the Tool will use that for the settings dialog.
	- Added some new data to the UDP forward F12020 output, i.e. the number of cars is not correct, also if DRS is being use etc.

ACC
	- ACC related performance optimizations. Tool should work even better on longer races (tested with 2 hour race)
	- 1.9 addtions + DLC cars + Valencia track map added
	- Added to TelemetryStatsGraph for ACC option to save the per tyre wear. If entered, this data will be used to calculate estimated tyre wear + per lap tyre wear. You can get the accurate tyre wear data from the 'Race Strategy' settings in ACC. Enter the 2 digit decimal number into the fieds, save data and then you will see tyre wear data on the graphs.
		- The tyre wear is given as IMO values. The Tool will calculcate an average from those to present the "tyre wear" value.
		- As there is two values, start value and the value when you check the tyre wear, the values shown are linear. But if you test e.g. the effect of full fuel load on tire wear on specific lap, the Tool now can give an idea about your tire wear on different fuel loads.
		- Sadly the game does not give these values automatically, so you need to enter them by hand. (You can do in-session save and look at the data from the save file to get a more accurate data)
	- Added to 'Settings' checkbox to save the opponent laps in Practice. This can create plenty of opponent laps, but might be usefull in Practice to see faster cars as you prepare for the race.	
	- Updated ACC_SharedMemory_Relay to make it more portable:
		- Can you relay_settings.ini from the same directory as the Relay
		- You can give to it as commandline agruments <IP> <PORT> for the UDP target address
	- In Driving pane there is now option to show multiple broadcast messages for game + player.
	- Lap Comparison: Changed the engine temp range to be more usefull.

R3E
	- Added new cars' data to the tool
	- updated Relay 
		- Starting the relay, you can put into the command line IP + PORT, if needed
		- Made it send out the relay version
		
RF2
	- Updated the plugin
		- New data from latest version added
		- Added version data sending to the plugin
	- Added new data to Racetiming, Opponent stats, Driving and Race Info.
	- Map now shows if DRS is enabled
	- Added some new data to the UDP forward F12020 output (i.e. the SF1000 workaround), now e.g. the number of cars is not correct, also if DRS is being in use etc.
	- Added proper RF2 tyre info to RaceInfo for the leader, front and behind
	
F1 22
	- Added data for Alfa Romeo 2023 

BLUE LAP
	- Added 'previous lap' as option for the BLUE LINE. With this option the BLUE LINE Is always the last player's lap.
	
Workspace
	- Made it easier to change position and move the traces to correct spot with the left and right arrow keys.

Pitstop data
	- Fixed situation, where pitstop would not be detected, i.e. when the pit entry and exit are on the same side of start-finish line.
	
X-Y Plotter
	- Fixed error, where the 'show forces reversed' was not working

General
	- Added some data to the 'UDP Forward F1 2020 format'.
	- Fixed issue, where in printing the telemetry the page range would show 1 .... 9999, now it is forced to 1 ... 1
	- Many little optimizations
	- Small tweaks/fixes here and there


# Installation and running the app
##################################################
NOTE ON INSTALLATION
- On first run, anew install will ask location for the 'DataDir'. So in the folder choose an existing folder or create a new directory. 

1) Unzip the package to the directory, where you want to install the application. 
	E.g. C:\Program Files\RacingTelemetry or C:\Bin\RacingTelemetry might a good places    
	
    By default the tool will use/create directories under the location, where the Telemetry.jar is located. The tool asks however for the data location directory on the first run. On Windows it will not allow data to reside under the 'Program files' or 'Program files (x86)' directory.   
	
	UPDATE: If you update from 9.x, 10.x or 11.x version, copy the Telemetry.jar + .bat files + the tracks + the lib directory + the bin directories into your installation directory.
	
2a) Windows users: 
---------------------		
	Double click on the RunWin.bat file in the directory where you have Telemetry.jar. It will open up the app launcher. You can create a shortcut to the .bat file to your desktop/start menu. Also added two other .bat files for running with limited memory. There are also game specific .bat files, and I recommend you use them.


2b) Linux users
--------------------
	Untar the contents of the linux.gz (Linux JRE binaries) file to the bin directory. (The java executable shoud then reside in bin/linux/bin directory).
	
	If you are using the aarch64 linx, download the customer JRE for it from https://telemetrytool.com/addons and unzip the contents to the bin directory and rename the unzipped directory to linux.
	
	Run 'bash runLinux.sh' from the install directory (i.e. where you unzipped to .zip packet). If you want to create a launcher, you can see what to put into the launcher from the runLinux.sh.
	
	If you have issues on opening the .gz files, you can download the Java binaries for your platform from https://www.azul.com/downloads/?version=java-17-lts&package=jre-fx#download-openjdk  Just take the JRE 15 with JavaFX. The development of the tool after 10.5 was done on Java 17.
	
2c) Mac users
--------------------		
	Unzip the contents of the .zip to your system. You can unzip them e.g. to Applications, but you can also stored them to a directory in your home directory.
	
	If you are using the Intel based mac, unzip the contents of the mac.zip inside the bin directory to that directory. The java executable shoud then reside in bin/mac/bin directory.
	
	If you are using the M1 mac, download the customer JRE for Mac M1 from https://telemetrytool.com/addons and unzip the mac_m1.zip to the bin directory in the install directory and rename the directory from mac_m1 to mac.
	
	Run 'bash runMac.sh' from the install directory (i.e. where you unzipped to .zip packet). If you want to create a launcher, you can see what to put into the launcher from the runMac.sh.	
	
	If you have issues with the provided custom JRe, you can download the Java binaries for your platform from https://www.azul.com/downloads/?version=java-17-lts&package=jre-fx#download-openjdk  Just take the JRE 15 with JavaFX. The development of the tool for 12.0 and later was done on Java 17.
	
3)  Right data feed
--------------------
	The tool defaults to F1 2021 data feed or to the saved default game settings, if no command line option for the game is set.

	
# Getting Data from the games
========================================
See the in-tool help (press F1 or H key for up-to-date help info).

And you can als see the YouTube video for install: https://youtu.be/DFNOw7xz0i4

There are install videos for each supported game. For AMS2 help, check the PC2 video.


# Help
========================================
In the application you can press key 'H' for small help screen.

You can also check out the YouTube videos at
https://www.youtube.com/@racinggametelemetry

Or you can send your questions/suggestions/feedback 
by email to telemetry@telemetrytool.com


# Old data
========================================
You can read old lap data files from older versions with the tool. 


# CPU Usage & Memory usage
========================================
For tips on managing CPU and memory usage, check the in-tool help.


# Testing connectivity
========================================
For testing connectivity, check the in-tool help on networking.


# Un-install
========================================
Just delete the files installed. 

This program only creates files/directories where the baseSettings.xml file points. This program doesn't make any changes to registry.

If you used the ACC, AC or AMS2/PC2 relay, then relay_settings.ini file will be at your %APPDATA%\AC_SharedMemory_Relay, %APPDATA%\ACC_SharedMemory_Relay and %APPDATA%\PC2_SharedMemory_Relay directories, which you can remove, when uninstalling.

On Windows, the launcher stores its settings and the Tool saves baseSettings.xml at %APPDATA%\TelemetryTool directory. You can delete those files, when you uninstall the Tool.


# License/Donations
========================================
If you like my application and would like to provide support it,
please purchase a license. You can do so via my Paypal account at 
https://paypal.me/IkoMRein 

========================================
# Old version history
========================================

# What is new in 12.3
---------------------
NEW Statistics Table graphs
- Shows the data in the statistics table in graph format
- This is very handy, if you run longer stints are are working on tire wear/optimal temps/pressures for a endurance race type settings
- You can save several different settings, e.g. for different cars for different tracks
- Statistics available new are: Tyre temps, tyre pressures, IMO temps, tyre wear, brake temps
- You can show the following data for the collected statistics: Min/Max/Avg
- As you drive many sessions, you can select, from which sessions the data is shown by selecting each set in the checkbox at the bottom. This way if you drive a session with P, Q and R, you can turn of the display of P & Q data.

AC
- Added multiplayer/multicar data to the tool. RaceTiming, Race history, opponent laps etc. all work now with AC
	- This requires you to add the 'Telemetry Tool Plugin' to AC. You can either just unzip to the apps directory the 'Telemetry_Tool_plugin.zip' from the bin\ac directory. Or you can use the 'Mod Manager' to install the package.  The plugin just reads the data and forwards them via UDP to localhost:10101, which the Telemetry Tool will also now listen.
- The Tool now also saves laptimes + race history properly
- Added setting to change opponent lap saving options
- Made the tool to automatically detect, which data sources are available and adjust the operation
- Added tab change options: ABS+, ABS-, BrakeBias+, BrakeBias-, TC+, TC- , . This changes the "tab" in main window
- Modified quite many views to accomodate the multiplayer data
- There are some simple additional trackmaps at https://telemetrytool.com/addons

RaceRoom Racing Experience (R3E)
- Added first version to support this game
- Requires the use of the r3e_relay.exe to send the Shared Memory data to UDP. 
	- The relay uses port 10101 and can at this point send the data only to localhost (127.0.0.1)
	- Relay should start automatically, if you start the Tool via the launcher
- Added support for the workaround for the Thrustmaster SF1000 wheel for this game
- Made the tool to also show (estimated) laptimes for invalid laps in solo events
- Added 'Oil Pressure', 'Water pressure' and 'Fuel pressure' to the Driving tab view
- There are some simple additional trackmaps at https://telemetrytool.com/addons
	- I plan to do more detailed trackmaps as I play the game more
- Added PTP data to the MAP view, when viewing the 'name and speed' option

AMS2/PC2
- Added 'Oil Pressure', 'Water pressure' and 'Fuel pressure' to the Driving tab view
- Added Bathurst 1983 track. Also includes the trackmaps for the earlier 1.4.5 version
- Added new car classes data

F1 22
- Added to the GameSpecific view the served penalties data
- Fixed pretty random situation, where some cars were not shown on map
- Fixed issue, where tyre history would not show correct tyre colors
- Made some changes to the Ghost data "massaging", it seems to be working better now, i.e. after the first full lap the Ghost data should be available.

F1 2021, F1 2020
- Fixed pretty random situation, where some cars were not shown on map
- Fixed issue, where tyre history would not show correct tyre colors

Grid 2
- Fixed first lap odd lap distance data
- Fixed max sector data for tracks, for which there is no track map
- Fixed traction circle 
- Modified bit the track list and names of tracks there
- Modified bit the car list and names of cars there

ACC
- Fixed error, when sometimes in multidriver situation the driver name wasn't correct in the views.
- Adjusted typical fast race laps based on the collected data. This has effect on "laps left" calculations etc.
- Added flag status to the cars for the track map + opponent data page. 
- Added 'PIT Opens in' and 'Pit Closes in' data to the header for race

RF2
- Updated the TelemetryToolPlugin.dll and optimized bit the data sending
	- Replace the old TelemetryToolPlugin.dll in the rF2 plugings directory with the one in bin directory
	- Tool still works with the old plugin, but new one should behave better.
- Added Grip level to the Driving pane
- Added GEAR info to the Map tabs 'Name + speed' view
- Added tyre into to the Map tabs 'Name + Car' view
- Fixed track map adding so that new track encountered is immediately available for use, i.e. there is no need to restart the tool, if you encounter/have new track.
- Created few simple trackmaps for RF2: Download them from https://telemetrytool.com/addons
- Fixed negative wheel speeds saved to the lap data files
- Fixed issue, when multiple similar rows would be saved to lap data files. This will reduce the size of the lapdata files significantly.
- Also the game sometimes sends driver name as vehicle name. If I can find a solution to this, I will fix it,but I doubt there will be fix. In those cases the car name is the vehicle class.
- Fixed the text on the top of the window to be correct for each event
- Initial work to get proper laptime data stored. There are some small inconsistencies on laptimes. This will be fixed on a later release, as I plan to simplify the laptimes stuff on the Tool

Map
- Added new option: Show opponent pitstop window. 
	- The way this works, is that you select the opponent (by clicking on dot or data in the Map). Then the tool will show where that player will land after a pitstop. You can set the "opponent" pitstop length separatately with a slider. This data only works, when there is valid session fastest lap for you stored, i.e. typically on a race, after the second lap has been completed. If you don't select a car, then it will be "forward looking" pitwindow, i.e. for which cars in front, you are in their 'pit window'.
- Added new line to show how many pitstops the car has made in the "name + race data" option.
- Added 'Edit map settings' button, which shows the same settings, as the menu item 'Map and UI colors'

Race Field spread
- Rewrote this, as it was sometimes freezing the Tool for several seconds, when viewing it the first time in a longer race.

Autorotation for "tabs"
- Added to Settings an option to keep the Tabs changing every 5 seconds. Handy if for some reason the tab change buttons don't work on some car. Also nice for games, where there is no way to make the Tool to change tabs.

X-Y Plotter
- Fixed some issues with the coloring and also made the colors work better for all graphs

DriverDNA
- Fixed situation, when it would not load laps
- Added new graphs to the DNA. It now uses same graphs as the other views

RaceInfo
- Added option to show the laptimes in reverse order (i.e. latest on top).
- Fixed/modified the fuel use info. Now it should work correctly on first lap and also provide more accurate data, as there were some old bugs, which caused the fuel use calculations to not be correct all times.

Racetiming
- Added dropdown with active drivers. Selecting item in the dropdown opens new window with laptimes for the selected driver. In this new window you can see the drivers laptime + sector times (max 3 sectors) for all laps in the race.

TimeTrial info
- Added option to show the laptimes in reverse order (i.e. latest on top)
- Made the divider line in laptimes list visible also in dark mode

Comparison panel
- Added sliders to change the track width and the trace width. The track width works only, if there is only single line trackmap (centerline or fastestlap line)
- If there is only the center_line track line, then the Comparison panel will use that.
- Changed the trace data to be from same traces, as in Workspaces, Plotter & Histogram. 

General
- I think I fixed the odd performance spikes/unresponsiveness in long endurance sessions, where these issues might happen in 1+ hour into driving.
- Also fixed opponent lap data caused memory use spikes, when running with a lot of opponents.
- Fixed issue on automatic TLA generation, where the second name was short ...
- Little optimizations & tweaks here and there

# What is new in 12.2
---------------------
F1 22
- Added to the OpponentStats: damage data + headers
- In Driving pane only fastest speedtrap messages are shown, when the "show multiple messages" is selected
- Fixed spectator stuff, which wasn't working properly. 
- Added opponent tyre surface and inner temps to the Opponent Stats view. If in online race the other players have not enabled public telemetry, then no data is shown here
- Fixed 2022 F2 team info, so that the colors etc. are show correctly.
- Fixed sectortime and laptime display to be inline what the game shows. The game still sometimes shows laptime, which is not S1+S2+S3.
- Put Shanghai back to the track list, so that the data can be saved/analysed

F1 22/F1 2021
- In Opponent Stats, removed some unused columns
- Made the tool to save race history also when spectating

AMS2
- Updated Relay to 'AMS2 Shared Memory 13' version. This brings the FCY data to the tool
- Added new tracks and cars added in 1.4.0.0, 1.4.1.0, 1.4.2 and 1.4.3
- Fixed event names, which were sometimes not showing properly
- Removed non-used events from the Lap Data view
- Added FCY data to the tool, e.g. FCY will be shown at top like SC would be shown

PC2
- Removed the PC2 trackmaps from the install. You can still download the trackmaps from https://telemetrytool.com/addons

ACC
- Added option to the Settings.xml to enable OpponentLap saving also in Practice. I might add this to the 'ACC Settings' dialog later, if many people use it.

rFactor 2
- Fixed the issue with data from online races not showing correctly.
- Fixed the issue where Thrustmaster SF1000 wasn't getting data during online races
- Added some new data from the game to the Tool, e.g. TyreWear, Engine temperatures, Yaw etc
- Added FCY data to the tool, e.g. FCY will be shown at top like SC would be shown
- Added some telemetry data from other cars to the RaceTiming tab
- Added temps to the Race Info
- Fixed issue, where the user added car list would not work correctly. The thing should sort itself out as you keep playing. If you want to sort this earlier, you can edit the rf2_cars_added.csv (in tracks\rf2) and make the id (first item on each line) to be ascending from the lowest number (something 1070+).
- Fixed the data not resetting correctly when going from P->Q->R
- The game still occasionally does not send the data for all cars. I will keep checking this.

Grid 2
- Added first version of GRID 2 support, thanks to Justysuwu@racedepartment for digging the data out
- There is no trackmaps, but after you have driven a first proper lap, next time when you change to that track, there will be simple trackmap
- You can start the Tool in GRID 2 mode with the runWinGrid2.bat

KartKraft
- Fixed a random crash, when the Tool starts in KK mode
- Added trackmaps for 'The Hangar', 'AMSP C' and 'Whilton Mill Kart Circuit'

Settings
- Added 'Show forces reversed' to settings panel. 
	- If enabled, this makes in the tool the forces towards right show on left and backward up. 
	- If disabled, the forces toward right will show on right and backwards down.
	- This changes e.g. in the Driving pane's GForce indicators direction.

Workspace
- Added graph for Angular velocity to the graph list. This only works with active laps of the session, as the data is not (yet) saved to the LapData files.
- Added graphs for Suspension position diffs
- Added 'Negate' to revert the graph.
- Added Workspace to 'New Window' menu

Statistics table
- Added average temperatures/pressures columns

Histogram
- Made histogram to use the same graphs/traces as WorkSpace, so there is bit more traces available.

Multihistogram
- Now the saved settings work for each of the histogram, so you can e.g. have same histograms for blue and red lap mixed, if that is what you want to do.

X-Y Plotter
- Made histogram to use the same graphs/traces as WorkSpace, so there is bit more traces available.

Multiplotter
- Multiplotter now saves the settings per each corner, so you can use the same views between sessions

Opponent Stats panel
- Changed the tyre wear data to show tyre wear per stint per tyre. If there is "mix and match" tyre set, the front left tyre type will be still reported as the tyre type

Lap Data View
- Added checkbox to enable/disable the display of list of cars, you have not yet done laptime with that game/track/event combo

Launcher
- "Reset UI" should now reset also all window positions

General
- Little tweaks here and there

# What is new in 12.1
---------------------
F1 22
- Fixed issue, where Abu Dhabi laps would not be saved
- Added Miami track map to the install package
- Fixed some driver and other ids, which had been changed, but not communicated from EA. Now all data seems to be in good shape.
- Fixed issue, when extra laps added to race history at the end of the race

ACC
- Hopefully fixed issue of car ID not detected correctly in some rare moments
- Updated typical fast lap data for the tracks based on the global data collected. This should make fuel estimates etc. work better on longer races

AMS2
- Added the Buenos Aires No 6T trackmap 
- Renamed the Buenos Aires No 6 to Buenos Aires No 6S

Launcher
- Added option to run the FeedTester from the Launcher

Global Database
- Another run to clean the Globa DB data. You can now access the aggregate data from http://racinggametelemetry.com/laptimes.php
- Changed the 'Show laptimes from global DB' to show race laptimes instead of global best

General
- Some little tweaks here and there


# What is new in 12.0
---------------------
Updated Java to Java 17 
- There are new custom JREs in the bin directory. I will keep this a base for the next few years, as the support for this Java version will go to 2026. I also added Mac M1/M2 binaries and hope to add Linux ARCH binaries in the near term.

F1 22
- Full support for EA F1 22 + updated trackmaps

ACC
- Full support of new "Land of the Free" trackmaps
- Fixed issue with CUP category not showing correct for some classes

AMS2
- Added new tracks from 1.3.8.x versions

Laptime list
- Added new table to show data of missing cars. This makes it easier to see, which cars you haven't driven on certain track. There might be some non-noticed bias in car selection for some tracks ...

Settings
- Added options for enabling/disabling and tresholds for 'Steering on Full Brake' warning. This warning changes top bar's background to red, when it happens. The triggering settings are 'BRAKE > value and STEER > value'. As typically there is a slight steering angle, the default for steering input is 5% and for braking the default is 95%. So at default settings, if you are braking more than 95% and the steering input is higher than 5%, then the top bar's background will turn red. If find this handy in practicing to keep tires in better shape, i.e. not turning wheels, when on full brakes. This is a per-game setting.
- Moved things bit around

Launcher
- Added F1 22 to the options
- Moved things bit around

General
- Cleaned online database data
- Many little tweaks here and there

# What is new in 11.4
---------------------
rFactor 2 support	
	- Added first version of rFactor 2 support. 
	- Enable this by copying the TelemetryToolPlugin.dll to the bin64 plugins directory in your rFactor2 installation. The plugin sends out the data to UDP port 10001, so the Tool needs to be listening on that port. Note that this plugin only works with the 64 bit version of rFactor 2
	- Added some trackmaps. If there is no trackmap, then a rough map it will be created, when first valid lap has been completed. I expect to add some trackmaps later, if time allows.
	- Most things should work. If there are issues, let me know.
		- Known issue is the last lap of the race data might be off and thus not saved. I might need to do some special fix for this, but looking for an easy way out at the moment ...

AMS2
	- New tracks and cars added
	- Fixed issue with Cascais GP track name reported from the game. (This was changed with 1.3.3)
	- New AMS2 relay, now the AMS2 relay must be started with it's own .bat file, or it will be started automatically, if you start the tool with the Launcher.
	- The relay settings are now saved for AMS2 too, earlier it used same settings with PC2.
	- Added the new Clutch data (temp, wear, overheated, slipping) to the Driving view
	
ACC
	- Added data for the cars in the new DLC

F1 2021
	- Hopefully fixed issue with the TLAs in online races ...
	
Launcher
	- Fixed issue, where the Relays were not started, when so selected in the Launcher.
	- Adder rF2 to the launcher
	
- Statistics Table
	- Fixed the 'Columns shown' max button. It will now correctly remove the 'Max' columns.
	
- Gamespecific: 
	- On licensed version added way to save the race events into a file for later review.
	
- KartKraft
	- Added new track data to the Tool
	
- General
	- Fixed setup date errors in save game for those games, which provide the data
	- fixed some little typos and formatting errors
	- A lot of little fixes and tweaks here and there
	

# What is new in 11.3
---------------------
Workspace panel	
	- Added new way to view traces. You can save your current traces settings and load other set of traces. This makes is easier e.g. to have one workspace for setup work, another one for driving inputs etc. You can have any number of workspaces. You save the current workspace with CTRL-SHIFT-S and load a workspect with CTRL-SHIFT-L. You can compare the BLUE-RED lap or use the laps from the multilap.
	- At this point workspace does not get constantly updated for live lap, I expect to fix that in the later releases.
	- The workspace system allows more flexibility to the way, how the trace is shown, there is smoothing, derivative, %-change and diff (data vs. blue lap data).
	- Added many new traces, like oversteer and coasting to the traces, which can be shown on the workspace panel.
	- By default the workspace uses the Telemetry Tab's traces + their settings. If you save a workspace with name 'default.workspace', then that workspace will be used at start.

Field spread panel
	- Added new panel, which you can use to see, how the race field has spread, which drivers are holding whom etc. This can be viewed with distance or time delta to the leader (actual or normalized).
	
F1 2021
	- Added Imola and Jeddah trackmaps	
	- Added F2 2021 drivers + teams data

ACC
	- Fixed situation in race, where the lap is invalid, but it was not flagged as not valid
	- In statistics page changed tyre temp to tyre pressure. So now the statistics page will show the temps like this: "FL 27.3->27.6 : avg 27.4 | 95C" which means, the pressures ranged from 27.3 to 27.6, with average at 27.4, the average temperature was 95C. This makes it easier to decide what to do with the tyre pressures for the setup.
	- New Relay + added new fields in 1.8 shared memory to the tool	

AMS2
	- Fixed Monza 10k trackmaps
	- Added new Racing USA trackmaps
	- Added v1.3 new car + car class data to the tool
	- Added full Nordschleiffe 24h track map to the tool.
	
Launcher
	- Added "reset UI" to the launcher. This will reset the main window position of the Tool. So if for some reason the window positions get corrupted, this can be used to reset those settings. This applies only to the selected game, when you press the 'LAUNCH' button.
	
General
	- Tried to fix a very random occurrence, where the fastest lap would be replaced with slower lap
	- Made the shortcuts, like CTRL-O work even if menu is not visible
	- Color saving now also saves the opacity
	- Many little tweaks


# What is new in 11.2
---------------------
F1 2021
	- Added Portimao trackmap
	- Raw data: Fixed the bug, where the data was always shown for the player and could not be changed
	- Potentially fixed issue, where data for new tracks would not be saved, i.e. make the current version work e.g. with Imola without the need for a new version of the Tool
	
AMS2
	- Added Monza release trackmaps
	- Added new cars data to the system
	
KartKraft
	- Added trackmap for Genk
	
Statistics table
	- Added wing setup data for games, which provide that data
	
Racenumber-name map
	- Fixed issue, where the TLA would just show race number, and not the TLA from the file
	
HTTP Server output
	- Fixed deltaToLeader in the json/aidata
	- Made JSON/tracks to output track list for the current game
	

# What is new in 11.1
---------------------
AMS2/PC2 Relay
	- Made the relay to also read relay_settings from the same directory, wehre the relay resides.
		- Rules for settings file is this
		1) Read it from the .exe's directory
		2) If not there, check the %appdata% directory
		
AMS2
	- Added new Tracks + car from 1.2.2 release
		
F1 Games
	- Fixed occasionally appearing data storing bug on some tracks, where the Tool would save partial laps, this happend especialy in practice or quali, when the lap was half finished and the player transported the car to the pits without driving and the pit box was after start-finish line	

UDP Forward
	- Fixed a very nasty, very hard to find random bug, which caused the data occasionally get out of order, when receiving high frequency data from the games. At the same time made the UDP Redirect to work more efficiently. This also applied to the UPD forward, also for sending data in F1 2020 format (e.g. for Thrustmaster SF1000). All data forward should now also be more robust and stable due to the additional fixes.

Map
	- Added option to 'New Window' option 'Map Window (transparent)'. This will open new window, where you have button "Transparent". Clicking that will remove sidebar and make the window transparent and 'always on top'. You can later close it by clicking secondary mouse button on the trackmap. To show the map on Windows, you have to run the game in 'Windowed full screen mode'. This does not work on Linux (yet).
	
Driving
	- Added core + surface temperature colors + moved things bit around
	- F1 2021: Added tyre wear digits slider + option to show race events list instead of the latest race event.
	- AMS2/PC2 added some more per corner data.

RaceHistory
	- Fixed some issues with different screensizes. The drawing should now be more dynamic and work better both small and large screens.
	- Mouse scroll + CTRL will now also make the 'Track Position' and 'Tyre History' taller or smaller.
	- Fixed issue, where the grid would not be visible on loaded Race History.
	
F1 2021
	- Added start practice window. This will show first 15 seconds of the race in special screen, so you can practice starts. You can also set the "blue start sequence" for comparison uses. The tool will also save players start sequence as file, where the naming is like "raceStart_monza_aston martin_784_2021-07-29_0054.csv", where number after team name is the distance at 10 seconds from 'lights out' point followed by date + time. This is first implementation and if it is useful, I will add few more things to it.
	- Fixed some situations, where the Ghost would not be saved
	- Also fixed error, where occasionally the first lap of the race would not be shown e.g. in RaceInfo.
	
UDP Forward format F1 2020
	- If pitlimiter is ON, then rev lights are blinking (once per 1/2 second).
	
UI
	- Added 'Press ALT to show menu' notification to the top bar, if menu is not visible. This to proactively answer the question, which is often asked.
	- Made the top bar to be red, if you are full braking + turning at the same time. So if brake  is > 95% and steer > 5.0%
			
General
	- Fixed issue with runMac.sh and runLinux.sh, when they were run from other directory than where they resided, which caused the tool not to start.
	- Many tweaks, little fixes and performance fixes.

# What is new in 11.0
---------------------
Blue lap
	- Added option : "Fastest opponent lap" for F1 games + ACC
		This shows the session fastest opponent lap as the blue lap ...
		
Launcher
	- Made the launcher to start the x64 .exe relays for AC, ACC, AMS2 and PC2.
	- Launcher will only work with 64bit system
	- Launcher will also remember the last game mode started from the launcher

F1 2021
	- Support for first release version
	- Opponent stats: added new damage fields
	- Made the tool detect track also when spectating
	
F1 2021/F1 2020
	- Added tyres laps to the Map for the Name & RaceInfo data
	
AC
	- Fixed situation, when first lap of race not being saved
	- Added fractions to the driving for tyre temps. Also added fractions to tire wear, though this value still seems odd with some cars.
	
PC2
	- Fixed Point-2-Point lap (like California highway etc.) data not saving 
	
PC2/AMS2 Shared memory relay
	- Added option for the relay to also listen for the UDP data and forward it to the same address as the shared memory data. This is very handy, if you run the Telemetry Tool and AMS2/PC2 on separate computer, as you only need to run the relay on the computer, where you run AMS2/PC2 and direct the data to the computer, where you run the Telemetry Tool. See the help files for more details.

Driving pane
	- Little UI tweaks
	
General
	- Made default mode to be now F1 2021 (from F1 2020)
	- Many little ui, stability and performance tweaks.


# What is new in 10.6
---------------------
Moved to JRE 15 (from JRE 8)
	- The custom JRE is now available for x64 platforms (Win, mac, Linux) and included in the package.
	- For Linux users, unzip the linux.tar.gz to the linux directory.
	- For Mac users, unzip the macos.tar.gz to the mac directory
	- The Tool seems to be behave much nicer with memory on the new JRE	

Launcher
	- Added launcher, from which you can start the tool in any game mode. I have updated the runMe_win.bat to start the launcher. In the launcher you select which game mode you want to start the tool in + if you want to start the relay for that mode too. And then you press the "launch" button to start the Tool. If find this easier than to use the many .bat files.

UDP Forward
	- Added way to send the data out in F1 2020 format from any game modes (for use e.g. with Thrustmaster SF1000 or other dash tools).
	- Made the UDP forward to behave better and not block the main tool, if the recipient for some reason is not accepting UDP packets

Added Statistics table view
	- Added big table, which shows most of the statistics on per lap basis
	- You can choose, which data is visible
	- Licensed users can save the data in .csv format, so you can do extra analysis on LibreOffice/Excel/Google sheet, if you so desire.	

Trackmaps
	- Fixed bug which could cause the track map not work correctly on Linux/MacOS

Racetiming
	- added visual indication to the S1,S2, and lastlap + best lap to indicate
		* green for personal fastest	
		* magenta/violet for session fastest 
		* color in positions lost/gained column
		* tyre color (F1 2018 - F1 2020)
	- Added background color to the driver line to make it easier to detect your data
	- Also for F1 games the team mate has different background color
	
F12021
	- Works with F1 2021 Beta 1. Some things might not work, but the tool seems to be in quite good state for that game. Full support will be there, when the game is released.
	
ACC
	- Fixed the "non-realtimeness" of the ACC track position data. Now the tool 
	should show that data as it is in the track, no just update at sector change. This most likely fixed the sometimes odd delta values in race info
	- Fixed issue, where player lap number might be wrong
	- Fixed issue, where laptimes for first lap would be odd in race and causing
	  the "History vs. Me" to be erroneus.
	- The tool should now keep receiving/showing data even if you change driver in endurance racing.
	- Fixed issue, where the first lap would show 0 laptime.
	- Added new system, which will show the Delta also on the last laps after the session time has run out. Also works on timemultiplier races.
	- Fixed random/odd situation, when in some tracks (like Oulton Park), the lap data might not get written.
	
ACC - Driver swap - WIP
	- Made the Tool to work in driver swap situations. This feature has been tested, but not extensively. In order to use it:	
		1) The "race engineer" or "central Telemetry tool" must set in the ACC settings the tool to listen for data from all drivers. You do this by settings distinct port for each driver. Also driver 2 listed in game as driver 2 must be send data to the driver 2 port and same applies for drivers 3 to 5.
		2) Each driver must send data with UDF forward the to the corresponding port and the data format needs to be 'acc swap driver'.
		3) It is good idea to also disable the automatic track detection to avoid issues of 'zero data' coming from the game from the driver
	- If done properly, the Tool should update all race history etc for the multi driver race.
	
AC
	- Fixed slowness when starting first time after adding new modded track/car
	- Added some new trackmaps of the tracksmods, I use
	- Made small changes how added tracks/cars data is handled. There is now the "original track + cars lists" and the files for the added tracks and cars. Makes easier to handle new versions. The migration will done automatically by the tool, when you start the tool for the first time. You might also want to run the 'Tools' -> 'Manage DB data' --> 'Fix database' as some indices have been changed. 

AMS2
	- New tracks + cars + classes from the 1.2 version added
	
AMS2/PC2
	- Fixed Yaw, Roll & Pitch graphs. They were actually totally wrong, but now they show the correct data.
	- Fixed issues (tool not starting etc), when running the game in   different language than English
	
UI
	- Added to the Map/UI color dialog way to alter the color of the clock on the top bar.
	
Driving pane
	- Added little dot to the friction circle to indicate oversteer/understeer. If the dot is further than the steering indicator, the car is most likely oversteering and if if the indicator has moved less, then that indicates understeer. This is still also in testing phase, but is quite handy on getting feel on new car or new setups "oversteeriness".
	
Race History
	- Some fixes to how the data is displayed 
	- Also fixed some situations, where the data was erroneously shown.
	
TimeTrial Info
	- Little fixes to the colorings
	
Settings dialogs
	- Moved things bit around. This is in preparation for a larger overhaul of the settings system.
	- Added baseSettings editor. This allows you to set the data directory to a new place, enable debug feed and extra reporting. This is in 'Settings' --> 'Base Settings'

F12020 and F12019
	- Fixed situation, where occasionally the saved opponent lap files lapdistances contained systematic error.
	
Map
	- Fixed the leader/infront/behind colors for ACC
	- Added Delta option, this shows the 'time to front | time to leader' in the info box for the car
	
Multiplotter
	- Setting the "lap for all plotters" to RED lap will work on restart, meaning the graphs will also be updated with live lap automatically, i.e. no need to manually set it each time.

Race History
	- Some fixes to make it behave better + to take bit less resources, when looking at the 'Diff to leader'.

DriverDNA
	- Fixed situation, when the DNA would not load/draw
	
Global DB
	- Tweaks on the data + and how it is stored
	- Tweaks on the queries sent to global db from the Tool
		=> These should make it better e.g. for AC lap times
	
Memory usage
	- Fixed an odd memory leak at the end of race for ACC
	- Other little memory use fixes

General
	- Plenty of little fixes and tweaks, e.g. in the UI and on stability/memory use




# What is new in 10.5
---------------------
Online laptime leaderboard
	- This "leaderboard" will only contain the laptimes, but no names or other information
	  about the driver. This is meant to just give the users and idea 
	    1) which is fastest car for the track
		2) when there is enough data, to show where e.g. your race pace is compared to the others
	- No Personal Identifying Information is collected, the system only sends to each user a 
	  TOKEN, which will be used to identify your own laps/laps driven by that user. There is no 
	  connection between the Token and the user data, so if you re-install the tool, you will receive new
	  token ...
	- Added menu items to bulk-load all old laps data to the local database and then sync them to the
	  global database
	- New view to see the fastest laps per track and per car directly from the tool. This is under
	  the "View -> Show fastest laptimes from Global DB"

New trackfile format
	- More compact new trackfile format, should save 60% of storage space and speed up the loading of new tracks.
	- Filenames should now work among different OS platforms
	
SHMEM-to-UDP Relays
	- Created 64 bit versions of the relays (for PC2/AMS2, AC & ACC). The .bat files have been updated to use these. If you are still on 32bit system, you can use the old relays. The new relays are in the bin\<game>_relay directories with _x64 text added to the end of the filename
	
Map
	- Added distintive border color to the leader's info box (magenta)
	- Also added distinctive border color to car in front (green) and car behind (red)
	
Multihistogram
	- View to show 4 histograms at the same time, they can be made to update real-time (i.e. either red or blue lap)
	- Settings per each histogram are saved

Multi (XY) plotter
	- View to show 4 XY plotters in one screen. This is kind of proof of concept. Let me know, if you like it. Works on both red and blue laps
	
Driving
	- Changed the tyre box to contain the tyre temp color, outer boundary shows tyre type (if available)
	
Key zoom
	- Added pgUp and pgDown for zooming, if you are on system,where the mouse scroll doesn't work.

RaceInfo
	- Fixed situation, when the delta to car behind wasn't shown
	- Fixed some ui position issues, e.g. with AMS2 the delta wasn't shown properly
	
Modern F1 (F12017 - F12020) 
	- Fixed situation, when on short quali the real quali lap was overwritten with the cooldown lap data. Now quali laps ending in pits will not be saved + added a little safeguard, that before a file will be overwritten, the file name will be added _1,_2,_3,_4,_5 or _6 at the end before the .csv

Math Channels
	- Added some new channels as options for showing data
	- Hopefully fixed all remaining issues with the math channels
	- If you use some very special formula, and it is too slow via the math channels
	  send me the formula and I will add it directly to the tool.
	  
ACC
	- Added Gear info to the track map for all cars, visible if you choose "speed" as the data option
	- Added more data to the setup info for saved lapdata files.
	- Fixed issue, where the TLA for many players in online races would be "PLY"	
	- CarID issue introduced with latest versions, need to run 'Fix local database' from Tools.
	- Opponen lap saving, fixed issue where opponent laptime would be 0.000 or near zero in save file names
	- Fuel at start values fixed for save files/first laps. Still if you cancel current lap and "fly to pits", then the fuel data will not be correct
	- Proper ACC tyre compound data added to save files + local db

AC
	- Fixed occasional bad lapdistances and times written to the lapdata files
	- Fixed fastest lap saving, which occasioanlly failed due to the bad data
	
AMS2
	- New track maps: Old SPA + Historic Jacarepagua
	- Fixed detection of car names + data sent from the game

KartKraft
	- Added way to detect, which kart is being driven.

Save files
	- Added Tyre pressure to save file (AC,ACC, AMS2, PC2, F1 2020, ...)
	
Opponent laps
	- Added option: Faster than blue lap, so only opponent laps, which are faster 
	  than the active blue lap, get saved. (saves bit space ...)
	
General
	- many little tweaks and fixes



# What is new in 10.4
---------------------	
Math Channels - initial release
	- Users can now defined their own Math Channels (using the Telemetry data). There can be any number of Math Channels and you can call earlier defined Math Channels from new Channels.
	- There are now 8 user defined traces in Telemetry, to which math channels can be assigned.
	--> This all is handled via 'Tools' --> 'Manage Math Channels' dialog
	- Check the help for more details + full list of all available functions	
	
ACC
	- New British GT DLC tracks
	- Small updates to some other tracks
	- Added support for the latest 1.7 shared memory data
	- ACC_SharedMemory_Relay updated to 1.07 to accomodate the changes in structure in ACC 1.7
	- Added yellow flag sector to the race map
	- Changed temperature to pressure in RaceInfo top right box
	- Tyre names saved to the laptime DB use the new tyre names from 1.7. This will allow later laptime analysis
	  on per tyre model.
	- Fixed UDP redirect so it now also sends the broadcasting data
	- Fixed clutch data handling
	- Fixed free roll statistics		
	
AC
	- Fixed console UDP feed handling, now console data should come through and be visible
		- When using only UDP feed, you have to select the track manually		
	- Fixed clutch data handling
	- Fixed free roll statistics	
	
AMS2
	- New 1.1.1.0 cars' data added	
	- udp_redirect now sends all data, from UDP & SharedMemory.

KartKraft
	- Preliminary support for KartKraft added, many things still waiting for next version of Telemetry data from KartKraft, e.g. to enable automatic track detection
	- Start the tool in KartKraft mode with runWin_KK.bat	

Graph color sync for corners
	- Added option to the graph coloring dialog, so that each car corner's color can be kept in sync. This means, if you enable it and change the color e.g. for Wheel Speed FL (front left), then all front left corner graphs' color will change to that color.
	
Savefiles
	- Added torque and handbrake data to the save files (Torque is however available only from AMS2 & PC2, for other games it is 0.0)
	
Opponent data files
	- Added same header row to the file as is in normal lapdata file
	- Adjusted the file name to contain lap number
	
Map
	- Added option to 'Settings --> Map and UI Colors', that you can use the same map coloring options in all modes. The choice is to have the per game coloring or same coloring for all modes.
	  
X-Y Plotter
	- Has torque and horsepower as graphs now
	- Added circles as additional options for showing the points

Histogram
	- Histograms work now also with RED laps, i.e. will be updated as you drive, if you select RED lap for source for the Histogram.
	
Racetiming
	- Changed total distance to kilometers
	- Changed laptimes shown to laptime format (mm.ss:ttt) instead of the old seconds view. This applies to
	  laptime, best laptime and last laptime.

Driving pane
	- Adjusted that the slip/spin bars don't show if speed is < 5 km/h.
	- Adjusted the positions of the wheels, if screen is pretty small
	
General
	- Fixed some locale related bugs, which prevented the tool to start e.g. in DR2 mode
	- Updates to the help files
	- MPH should now show correctly in all places, where speed is displayed. And if you choose MPH,
	  distances will be also in Miles.
	- Many little tweaks and optimizations ...

# What is new in 10.3
---------------------
AMS2/PC2
	- Created Shmem-to-UDP relay to get the data from shared memory to the Telemetry tool.
		- Reasons to use the relay
			- More accurate data about controls, temperatures, speed and distance.
		    - Also provides data for laps over 126 and gear data is correct.
			- Enables/makes possible to save Ghost data 
	- GHOST data: With the Shmem-to-UDP relay the tool can now save and show GHOST data from other cars
      (in Time Attack) and save opponent laps in other modes. In Time Attack the fastest GHOST will become
	  the BLUE lap, if you have selected GHOST for the BLUE line.
	- Driving pane
		- Added Rim/Layer/Tread temp displays
		- Added tyre deg fraction slider
		- replaced "Turbo" with "Torque" bar.	
	- Added game specific networking settings for both PC2 and AMS2. These are under Settings in the menu. 	

ACC
	- Added way to calculate how long it takes to make the fixes to the car. This can be added to the "pistop window"
		
AMS2
	- New trackmaps, Nurburgring sprint short, Spa 2020
	- Some additions/fixes to trackmaps
	- Adjusted laptimes + pitstop times data for many tracks	

F1 2020 + F1 2019
	- Ghost lap saving is now better and more accurate for lapDistance
	- Fixed apexlist files for most tracks
	
PC2
	- Redid some trackmaps
		
RaceInfo
	- For ACC/AMS2/PC2 added extra field showing how many pitstops are needed and how much fuel
	  you need to put per each pitstop. This data is based on the current race. Handy for those 
	  longer runs (like Indy 500), where the race situation changes.
	  
Racetiming
	- Added extra field showing how many pitstops each driver has done.
	- Unified PIT stop status texts among all supported games
	
HTTP-server
	- Fixed the JSON outputs
	- Added map.html to the html files. This shows real-time trackmap on browser, so you can
	  e.g. have it on an iPad. This is first version.	
	- Added some new JSON outputs, check the user_defined.html and help for more details.
	
Shmem UDP Relay settings (AC, ACC, AMS2 & PC2)
	- The tool will now also automatically adjust the relay settings, if you adjust the settings via 
	  the game specific settings dialog.
	
Statistics
	- Added some extra info to the fuel usage
	- Added average Revs to the report page
	- Added distance driving to the report page
	- In F1 games, laps under safety car don't count into the "proper laps" data.
	
UI
	- In Map coloring options you can now change the pit window box color
	- Also added new preset coloring: "Black hole".
	- Fixed game mode + network settins saving to work, if you use general RunMe_win.bat instead of the per game specific .bat files
	
General	
	- The "change event key" E now works. Handy if you are looking data for e.g. Race, you can change the event
	  to Race so filters use that, when looking for the files.
	- Map color + settings are now saved on per game basis
	- Tweaks and preparations around installing in proper way in Windows. You can already now in Windows have 
	  the "binaries" reside in Program Files and data e.g. under your users directory. This is in preparation
	  of creating an installer at a later stage.
	- Fixced: If you use runMe_Win.bat, then the system did now change the game mode, when you save the tool
	- Editing AC/ACC/AMS2/PC2 settings, will also save the Relay settings data.
	- Little tweaks and fixes	


# What is new in 10.2
---------------------
AC (Assetto Corsa)
	- Added basic support for PC and Console versions of Assetto Corsa
	- AC Telemetry data is "single driver data", so there is no info about other drivers
	- The UDP data for consoles is pretty limited for the console versions, but sufficient to provide basic telemetry. You need to change the track in the tool by yourself, when you change track. There is no way to do reliable automatic detection of tracks for console versions.
	- Like with ACC, PC version of AC requires the AC_SharedMemory_Relay.exe to be run, so the 
	  tool can access the data from the game.
	- Added basic track maps for vanilla tracks and DLC + some mods
	- If you need to add track maps for other mod tracks, check the help file for more details.
	- See help for more AC related info
	
ACC (Assetto Corsa Competizione)
	- Fixed racehistory situation, when occasionally there would be bad/odd laps stored into the racehistory
	- Added to Driving more info about the car, e.g. brake pressures and estimate for needed repairs

AMS2 (Automobilista 2)
	- Renamed once more all track files and build the system so, future track name changes in the game will have less effect
	- Added trackmap for Hockenheim 1988 short, Buskerud x 2, SpeedLand x 4, Nurburgring x 4 & Nordschleiffe x 2
	- Fixed Granja Viana Kart track maps
	- Added new cars data from the update v1.4 & V 1.5
	- Small AMS2 related fixes here and there
	- Added tool to fix possible different index for tracks, if they were added by the tool to the list prior this update. You can fix the database data by running on Windows version the
		'bin\win\bin\java -classpath Telemetry.jar apps.FixAMS2Data'

F1 2020
	- The tool now uses the final classification data from the game to provide full position data in the saved race history files.
	
F1 2020, F1 2019
	- In online races, the TLA now uses the race number instead of the car index from game

PC2
	- Redid quite many trackmaps to work better with new map system.
	- Small PC2 related fixes here and there

Dirt Rally 2.0
	- Added Ford MK II R5 data 
	
Save files
	- Added tyre pressure to the save files (pressure is always in PSI, for PC2/AMS2 the tool shows however bar, as that is what these games are using)
	- Added tyre carcass temperature to the save files.
		
Blue lap setting per event
	- There is now setting to set the the default BLUE lap per event. 
	  There are 4 blue line options: Race, Quali Practice & Hotlap/TimeTrial. These are set 
	  in the Settings page. This way you can have e.g. for Race the session fastest lap as Blue line
	  and for Hotlap/Time Trial the fastest lap
	  
Map	
	- Option to add text to the turn numbers by editing the apexlist files. This is a preliminary test of the idea, how it would work. You can enable/disable this from the map color settings.
	- You can edit the texts in the <trackname>_apexlist.track
	- For ACC, added option to add "repair time" to the pit window position
	
Telemetry view
	- Added tyre surface temp channels. These were already in the X-Y Plotter and Histogram, so added
	  these to the Telemetry view too.
	- Added tyre pressure channels
	  
Laptimes history
	- Added fuel use average to the per car data. Handy e.g. in ACC, when you need to know, how much 
	  fuel you typically burn per lap on race on ceratain car, when you need to calculate the fuel needed.
	  Also using the average laptimes and fastest lap help to get an idea, how many laps you will drive
	  e.g. during 45 minutes.
	- Also now when track changes, the system automatically shows timing for the active track.
	- Added option to select, which tires the data is from
	
Statistics
	- Added session statistics column too to the data

RaceInfo
	- Fixed fastest lap driver data (visible on the graph's right side)
	- F1 2020/F1 2019: Fixed wheel visual color in bottom delta box
	- Added text showing leader/driver in front/driver behind penalties in diff box
	- Added back the "average data lap for all laps"
	- Added penalty time info for the F1 games to the "delta to front/back" info
	
PaneComparison
	- Added 'save track position' button to save the track's rotation/zoom/position
	- Also added 'reset trackä button too to reset the track position to the default one.

FeedTester
	- New updated FxFeed. See the Networking help for more details.
	
Rawdata & Driving F1 2020, F1 2019, F1 2018
	- Added back the pulldown to see data from other drivers (if available)

RaceHistory
	- Fixed tyre history tyre colors (namely F1 2020, F1 2019)
	- Set the "vs. me" graph to be closer to the center by default.

General
	- Little fixes and tweaks in some places
	- Plenty of edits to the help files


# What is new in 10.1
---------------------
ACC: 
	- Added new cars in GT4 DLC
	- Updated the ACC_Relay to retrieve new data added in 1.15 of ACC. You must use the new relay with the 10.1.

F1 2020
	- Now Shumacher edition cars are also detected by the tool
	- Fixed issues on some small issues with other game data
	- Fixed: Wheelspeed was saved as m/s instead of km/h to the lapdata
	
GHOST updates (F1 2020 & F1 2019)
	- With Ghost, do NOT restart/flashback the lap during the first two laps with new ghost. If you do, the data gets messed up.
	- F1 2019: in F1 2019 mode, the Ghost trace works and date is saved correctly
	- F1 2020: Both F1 2020 feed and F1 2019 feed, the Ghost trace works and date is saved correctly

Map	
	- Fixed bad clipping in the map on some situations 
	- Fixes on some areas for the customizable colors
	- Fixed multilap traces position when zooming/dragging the map
	- Fixed multlap line widths to adjust when changing the racing line width in settings
	- Adjusted how the map is positioned on the windows, if user presses reset map.
	
MultiLap
	- Fixed the content of help text shown at startup
	
Comparison view
	- Fixed other bad clipping of the track map.
	
XY Plotter
	- Added (optional) scale to the graphs and made it better in showing some of the data
	
UI /Map colors settings
	- Added trace line width slider for Telemetry and Multilap trace lines.

General
	- Added option to settings to show the speed in MPH in areas of UI, where it is feasible.
	

Little fixes and tweaks in some places

# What is new in 10.0
---------------------
* NEW: Full support for Automobilista 2. 
	- All trackmaps for V1.0 are included. Big thanks to Wayne Whitmore on helping with the track mapping.
	- Works in all game modes
	- Features, which were available for Project Cars 2, are available also for AMS2
	
* NEW: Full support for F1 2020
	- All track maps have been redone to make them work better with the new map.
	
* NEW GHOST as blue lap (F1 2020 & F1 2019) 
	- For F1 2020 and F1 2019 BLUE lap has new option: "GHOST". This automatically changes the BLUE lap, when new Ghost data has been received. You need to let the Ghost drive at leat one full lap, before the Ghost data is saved. This means, when you get new Ghost, on the first lap the data is just partial, so if you beat the Ghost on the first lap, then the Ghost data will not be saved. If you lose twice on the Ghost, then the Ghost data is available as saved file and as automatic BLUE lap.
		
* NEW: MultiLap Telemetry (real-time & offline). 
	- A new view to the telemetry, which can be used to view Telemetry from multiple laps at the same time.
	- As you drive, laps are automatically added to the view + the track map

* NEW: Historgram
	- Histogram is now more usefull, you can choose the data + how many steps the tools shows. 
	- Histogram works only with BLUE laps.
	
* NEW: Help
	- Added help files to help for most common areas ... press key H of F1 to see the help.

* Telemetry
	- Total rewrite. 
	- Telemetry has now a scale on the side (customizable per trace)
	- Each trace/Channel can also show min/max values per graph
	- You can now set the graph drawing quality. Lower quality means faster performance and less resources needed
	- Added as BLUE lap option 'GHOST' for F1 games (F1 2020, F1 2019). This changes the blue lap to the   Ghost lap. You still need to let the Ghost drive at least one full lap to get the data ...
	- CTRL-B creates an image of the Telemetry graphs, which you can save for later reference
	- If you press primary mouse button and then later secondary mouse button, the tool will zoom to area between those clicks. This works also on the multilap view. Can be disabled with the "autozoom" checkbox.

* Map
	- Total rewrite, much more powerful and easier to expand
	- Pitstop length is now saved to track data
	- Colors in map are customisable.
	- Redid many trackmaps with new data
	
* Multiview sync
	- Made all Telemetry/Map/Comparison/DNA views to work together. So if you move the cursor in Comparison, it will move in other views too. Makes it pretty powerful for offline analysis.

* Settings per game
	- Settings and window positions are now saved per game. Colors are still tool-wide

* Delta accuracy: 
	- Allowed to the "distance between measuring points" to be from 1m to 500m, so that in very long running endurance races the memory used by the distance doesn't get too large.
	
* PC2
	- If spectating, the active car's (not viewed, but at index 0) telemetry will be saved as opponent lap
	- Many new trackmaps for the most often used tracks

* ACC
	- Updated the Relay to make it behave in a way, which gets it to not be flagged by Antivirus tools. This means the relay_settings.ini will now also be saved to %APPDATA%\ACC_SharedMemory_Relay.
	- Updated all track maps to make them better work with the new Map.

* F1 Games
	- Fixed Ghost lap issue of randomly random data in the files
	- Added F1 2016 support back to the tool
	- Added F1 2015 support back to the tool
	- Added F1 2014 support back to the tool
	- Added F1 2013 support back to the tool

* General
	- Tool correctly saves window positions even on 3 + 1 screen setup, where the 1 screen is on top of other screens.
	- Fixed a lot of little things + rewrote some code from pre 2018.
	- Many optimizations to make the tool run smoother on less powerful laptops/computers.


# What is new in 9.3
---------------------
Added way to start the tool for specific game with commandline option: --game=<GAME NAME>. I have provided new .bat files for each game for Windows users. The Linux/Mac users can modify their own .sh files accordingly.

DriverDNA
- Brought back the DriverDNA from 6.x version. This is a tool to visualize many laps in a way, which lets you see, how consistent you are on your driving. You can sort the laps by creation time (latest at top) or laptime (fastest at top) or combine (e.g. 20 latest laps, fastest at the top). 
- Mouse click will move the cursor in other views.
- Mouse scroll zooms in, drag moves the image.

Laptime history/Local DB data browser
- Added tool to get the laptime statistics from the local db added in version 9.2.
- Added way to load all your old telemetry laps into the local db. So if you have used the tool earlier with F1 2017 or newer games, PC2, DR2 and/or ACC, you can now load all the laps from lapdata directories into the database and then use the tool to view average laptimes/fastest laptimes per track/per car. You only need to do this once. ...

ACC
- Added saving of opponent laps from ACC data. These files have speed, laptime, lapdistance and gear from the game. I did bit of extra work and the tool calculates/extrapolates braking data based on the speed change. This is not perfect (yet), but gives an idea, when the opponent car's speed started slowing significantly (i.e. a sign of braking). You can load the opponent laps into the Telemetry tool to use as reference lap or as a loaded lap for analysis. You need to enable the saving of opponent laps from the general settings.
- Out_1 and Out_2 now work fully for ACC data. This makes it easier to setup and run the Telemetry tool on separate computer than where ACC is running
- Single .bat start for ACC, now you only need to run the runWin_ACC.bat, if you are running ACC and Telemetry on the same computer. This starts the relay and also the Telemetry tool itself.
- Updated the SHMEM-Relay to the 1.3 version of Shared memory data. E.g. valid lap detection works now and there is brake disk/pad data available.
- Added option to change the tabs by changing the primary display (up or down) and secondary display change. (These can be conveniently mapped to a button on wheel).

DR2
- Added the new "Colin McRae DLC" tracks and cars to the data.
- Some modifications to avoid the issue, if stage/track data has slightly changed between versions.
- Some newly done trackmaps + "background", also RX tracks show now the joker separately.

PC2
- Fixes to many track maps and to track detection (to avoid issued on non-PC platforms)
- Fixes to multiplayer data handling. 
- Many little fixes/tweaks based on PC2 data

F12017
- Added the F1 2017 data back 
- Enable F1 2017 in the options
- Small fixes to data feed handling to keep the tool still working with this legacy feed.

F12018
- Small fixes to the data, so it is correct based on F1 2018

Statistics window
- Added simple window to show realtime statistics for the red lap and statistics for the blue lap. 

MAP
- Added one more data option: NAME AND_ RACE DATA, which just shows Track position and Lap alongside the name. During my racing I found this to be the most useful info, the others are just nice data to have. On PC2, this also shows, if a player has drive through penalty.

RaceHistory
- Racehistory will keep the last selected graph active between sessions, if automatic settings save is on. Otherweise if you save settings, also the Racehistory active graph gets saved.
- Racehistory will by default now show the RaceHistory instead of TrackPosition history.
- Added extra option: 'Race History against player'. This is same as Race History, but player's laptimes are used as the comparison data. I have been using this lately for racing and I think it is nicer better graph for the player.
- Also when looking at the loaded race history, the lines should have correct colors.
- Fixed wrong player index stored to the racehistory. This created visual issues, when the player car was not shown with correct colors/lines. Old race history files will have the issue.

X-Y Plotter
- Added filter option to only show certain data, like 'gear > 5' etc.

Driving
- Some modifications to the friction circle size based on game 
- Other little per game tweaks.
- Added friction cirle image, which shows the distribution of the points over the session. This image can also be saved.

RaceInfo
- Mouse scroll on the graph area adjusts the 'laptime diff' treshold (Ctrl-scroll will adjust the tyre wear target).
- Added laptimes to the left of the graph for
- Added pitter list to the right side of the graphs
- For ACC, added ECU mode data to the fuel usage area and brake disk/pad wear data

RaceNumberNameMap
- Added option to add also TLA to the raceNumberNameMap file. This is used by F1 players, as the F1 2019 does not send out online player names, so in league racing this helps to keep track of the racers within the tool, provided they use same and distinct race numbers.

General
- Added real life clock next to the view selection dropdown. Sometimes I just forget to stop driving during the night. This will make it easier to note the time, as time really flies, when racing. ;-)
- Tool will now remember the last active tab/view used.
- Plenty of performance work and optimizations
- Many little fixes/tweaks


# What is new in 9.2
--------------------
Assetto Corsa Competizione (ACC)
- Added support for ACC  with the Intercontinental GT DLC. 
- Most of the stuff works, opponent laps not yet, but I think I can make the partially work in the future.
- Added SharedMemory/UDP relay to send the data from ACC over UDP. Running the Telemetry tool with ACC requires, you first run the acc_relay.bat, then start Telmetry tool and then run ACC.
- There is a ACC specific setting page under the 'Tools/Settings'.
- NOTE: The ACC Telemetry files are much larger than the files from other games, as there is more packets per second available from the game.

RaceNum map to driver name (F1 games, should also work on ACC, but is not needed there)
- As the F1 2019 does not provide player names in the feed, I added way to map the driver RaceNumber to the driver name. In the 'Tools/Settings' is new option 'Create RaceNum-Name map file', which creates a file to the settings directory, which you can edit to set the RaceNumber/Name mapping. This take precedence of other possible mappings, i.e. the driverids.csv and the global filter.

Racehistory (F1 games, PC2, ACC)
- Saving and loading lap history now available. In 'File' there is new entry 'Open Race History file', which will let you open a saved race history file and view the results in the race history window. You have to also enable to 'Save detailed race history' from the Settings to save the race history.

RaceInfo/TT Info (All games)
- Added standard deviation to the visible statistics. The average and deviation use only proper laps, i.e. second or higher laps and laps, which did not end or start from the pits.
- Also added average laptime data for pit laps
- Also added notification, when other cars are pitting (F1, PC2, ACC)

MapPane (All games)
- Added more info about cars to the boxes, speed, position, lap, car name etc.
- Also the driver name now has the car's race number visible too (if available from the game), in ACC also which driver is currently driving the car (the 'driverId/drivers' indicator after name)

Histogram (All games)
- Added a simple histogram for gear data. That gets updated, if you keep it open. I will need to see, how this could be used/incorporated to the usage. Available in 'View' -> 'New Historgram Window gears'

Plotters (All games)
- Made Plotter work nicely, if you run them on live laps

Local database (All games)
- Added a SQLite database to save locally, how long (in meters, in seconds) per each car per each track you have driven. I will later add tools to look at this data, if it is of interest. The database resides in the lapdata directory. If you know how to read data from a SQLite database you can play around the info now.
- With this information you can e.g. see how much your typical pitstops add to laptimes.)
- If the data is of interest, I will add to next version way to load all saved laps to the statistics database.

Other
- Many small fixes in race info etc
- Small adjustments to pit stop times
- Some F1 2019 data related additions
- Dirt Rally, all new tracks and cars added
- Project Cars 2, some track fixes + added few missing tracks

# What is new in 9.1
---------------------------------
* Track Selection system
Tracks for the currently selected feed/game can be found from the track dropdown. The tool does not anymore show current track on the top bar, as it will be visible in the dropdown menu.

* General:
- Links in the about box and splash screen should now work
- Fuel usage data + math fixes. Small things, but had impact on PC2, when doing races with refuelling.

* Telemetry
- Added suspension graphs (position, velocity, acceleration) to the Telemetry graphs.

XY Plotter
- Added zero line and min peak line for an easy detection of car bottoming out, if suspension is too soft
- Some feed related tweaks to make the data look nicer.

Project Cars 2 
- Timed sessions have now fuel left for X laps and excess fuel info
- Many track tweaks and additions
- A lot of little tweaks based on driving in career
- For timed session, laptime average only for real laps (not first, not refuelling laps)

Dirt Rally 2.0
- Added Wales maps
- Added all trackmaps as racing line
- Added new cars
- Some fixes to ensure the tool works correctly, even if there is no data for the active stage.


# What is new in 9.0
---------------------------------
* F1 2019 
- Added support for the new F1 2019 data feed and the changes to the team names etc.
- As the F1 2019 doesn't anymore send player names, added some ways to visually distinct the different players

* General
- If you have "wrong" feed in settings, the tool should now automatically detect the feed and change mode between codemasters games. 
- Added to Tools/Settings a menu item to show IP address for easy way to find the IP address and port used
- All game date is now in related directories, also graph settings, so you can have separate settings for different games
- Fixed opponent lap saving for classic cars or cars with two or more parts in their name

* F1 201x games
- Moved F1 track data to tracks/f1 directory to save bit space

* Dirt Rally
- All tracks/stages have now basic track files.

# What is new in 8.6
========================================
* OpenJDK binaries included
With this package, I have included ZuluFX 64 bit Java binaries from Azul Systems (https://www.azul.com/downloads/zulu/zulufx/), as getting Java 8 via Oracle is not anymore possible
For Windows I have unzipped the package, Linux and Mac users need to untar the tar.gz. 

If you still have java 8 in your system, you can use it, or you can start using Telemetry tool with the included javaw.exe. For new users, it is easier to start using the included binaries. 
	- See below for more details on install/update.   
	- If you are Mac/Linux user, get the JRE from the link above	

* General
- Spectator mode: Made the tool to display some data on a pure spectator mode (F1 2018 & F1 2019), i.e. track map, driving data for the viewed participant, race history and race timing. I will check what changes there are for F1 2019 release and will make this behave bit better with V9.
- Big memory optimizations, the tool should be able to run well on 1GB in memory limited mode (and even at 512m with f1 2018 & 2019, but on longer stages in DR2 and PC2 it might get sluggish).
- Added Print Telemetry graphs option. This is preliminary test to see, how the printed graphs work, accessible from 'File' menu or via ctrl-p.
- Fixed sidebar position saving. Now should work correctly.
- Feed/game related settings are now saved to the Settings/<feed> directory. 
- Many fixes and tweaks here and there

* Names: driver_ids.csv and global name filter.
- Moved driver_ids.csv to be in Settings directory. Now the tool creates it automatically from 'Tools/Settings menu' and you can then edit the file. This file can be used to replace the standard names from the game to something else.
- Created Global name filter. You can set a global name filter, e.g to remove "PS4" from all names received from the game. --> You can enable this via 'Tools/Settings' --> 'Create global name filter file'. Then go to the settings directory and edit the 'global_player_name_filter' file. After that restart the tool, and the filter is active. You can always remove the file (or rename it) to disable the name filter feature

* Telemetry, 
- Graph colors. Added option to have the Telemetry graphs in color. You can modify the colors and save the settings. There is an option to have color for RED Lap or the 'old' way, i.e.  only red and blue.
- Fixed some graph settings, which were not saved
- New graphs, g_vert, slip (ratio fastest rear vs front) & 'revs to speed'
- First version of secondary cursor, click alternative mouse button, when you have active red lap and it will show the timediff between those points for RED lap.
- Sector lines added for PC2 tracks

* Map
- Added "Reset map" button to the MapPane, as sometimes one might accidentally move the map to wrong place (zoom out too much, then move it around and lose it). This will return it back to visible state in the middle
- PC2 fixed player car color

* RaceInfo
- bit more "prettying of the ui side" and fixed time data for race

* Minisectors (or Marshall sectors in F1 2018 & 2019), 
- First version to gain some understanding of this. You can create minisector file of the track from the settings menu (Save this tracks minisectors to file). This will be in the tracks directory. There is a sample for PC2 for Monza GP. The sectors are used to show the flags waved in that section (works for F1 2018 & F1 2019 and PC2). Later I might add some more detailed time analysis per minisectors. By default the Telemetry graph display will now use the minisectors (i.e. Marshall zones in F1 games) for the lines. You can change this behaviour in the settings to the "distance lines", i.e. to as it was before

* XY Plotter
Added XY-plotter for showing a combination of two different values in a graph with color option for 3rd dimension. Blue lap works well, red lap on live laps works well too on short tracks, longer tracks slows the tool. I will do more optimizations, when I know how it can be used.

* Ghost/opponent data
- Ghost and opponent laps will have team name at the end. Makes is easier to find the team mate or other cars from the set of data

* DiRT Rally 2.0 
- changed track names from length to name, easier to find the reference lap etc and can withstand the minor track length changes, which seem to happen between versions.
- Added latest DLC data

* Project Cars 2
- Added all tracks
- Fixed a crash in multiplayer + now the tool should work properly in all game modes
- Fixed race history for online races. 
- Many improvements on the PC2 data handling. If you find any strange things, let me know.


# What is new in 8.5
========================================
Added support for Project Cars 2
- Works with most screens, no opponent statistics though
- Some track maps are not there yet, will be in next release

Added support for DiRT Rally 2.0
- Works with Telemetry, Time Trial info, Map, Driving, Raw Data & Comparison

Saved lapdata files now contain car/team name in the end (all games)

Added Time Trial Info screen
- A screen with only lap time info, geared more towards time trial, where you are only looking at times and delta
- Mouse scroll increases/decreases font size on the left panel

# Automatic racing line/track map creation
- For DiRT Rally (and also PC2), if there is no track map, drive normally and the system will save your racing line as the track map. Next time you drive on the same track, the generated track map will be used, if there was no pre-made trackmap.

# Driver_ids.csv can have driver names (handy for league racers). This replaces the driver names from the game.

# Added Opponent statistics screen (F1 2018 only). 
  This screen can be used to detect, if someone you are racing against is using some kind of the cheat, which adds extra ERS, reduce fuel usage, tyre wear or increases grip. 
- Max speed for all opponents
- Acceleration/forces statistics (if too much grip, acceleration and forces are higher than for others)
- Fuel usage statistics per fuel mix for all opponents
- ERS usage statistics for all opponents
- Tyre use/degradation data 

# Telemetry
- Different color for Left and right side wheel speed graphs for easier detection, which wheel is slipping/spinning
- Added to statistics, how many seconds on the brake/throttle next to %, press key I in the Telemetry to see this

# Race Info
- Removed sector time, replaced the "graphs" section with laptime graph of driver in front/behind + delta times and tyre use data for leader, driver in front and driver behind.
- Made some numbers biggers
- Small re-organisation of data

# Comparison
- Added Coasting to graph
- Added 'Brake and' graph, now to Brake and Steer, Brake and Throttle
- Added steering indicator
- Added visual delta time indicator
- Added slider to the bottom, which can be used to move the cursor around. Also updates Telemetry (and vice versa)

# Race History
- Mouse + ctrl scroll for race time history and laptimes to "zoom"/move the graphs
- Fixed Track Position history to show correct values
- Added Lap lines (i.e. Grid) to most graphs in the race history
- Race History settings are also saved

# ERROR FIXED
Fixed flying lap error in TT/Practice/Quali/. When doing a flying out lap several times, the first sector of the first lap was cut.
Reason is that the game gives erroneous data after flying lap exit, the sector
data and the lap number don't change and even lapDistance remains at track lentght and
these then change at arbitrary point or when crossing from S1 to S2. Had to do a quite
nasty workaround to fix it. Hopefully with F1 2019beta testing I can ask them to fix these and some other anomalies in the feed.

# Other 
- Updated the self-signed java certificate to be valid next 4 years
- Changes on old lap loading, if you have isssues on loading pre F1 2016 laps, let me know.
- Moved things around, ui.Feed is now apps.Feed
- Lots of big and small tweaks and fixes here and there



# What is new in 8.4
========================================
8.4 contains mainly memory use fixes and tweaks.

General
- Option to show temperatures in Fahrenheits (in Settings)
- Small fixes here and there

# What is new in 8.3
========================================
Map/Race Timing
- Key X shows extra data
	- In Map in Name + Speed shows, if the driver has TC or ABS on
	- In Race Timing shows extra columns in the data

Map
- Fixed flag display on track map on the last sector on some tracks.

Race Info
- Made the diff bars bigger to make it easier to see the diffs on smaller values
	
General
- Fixed fastest laps not clearing in graphs, when changing track
- Top bar: Track/Event text turns red, if lap is invalid, this had been disabled by accident, so I put it back.
- Some other small fixes here and there

# What is new in 8.2
========================================
GHOST Laps
- You can save the Ghost laps of the opponents in Time Trial. The data does not contain Throttle, but other controls like Braking and Steering are saved. You have to enable this in Settings, set the opponent lap saving to ALL or to Ghost

Settings dialog
- Made the settings dialog look bit nicer on dark mode

General
- Many color fixes/tweaks
- Many little fixes in the backend

# What is new in 8.1
========================================
Added Comparison tab
- Compare visually two laps (braking, ERS/Fuel use etc)

Telemetry
- Added Roll, Pitch & Yaw to the graphs
- Added ERS related graphs + Fuel Mix graph
- Mouse Drag moves the graphs left and right
- Zoom with key Z centers the zoomed area to the cursor/selection

Map
- All settings are now saved
- Updated pit window times for some tracks
- If you are playing with PS4 or XBox and there is no player names, the game now shows them as "Ferrari <playerid>", so you can easily identify the drivers
- In the 'None' driver id, made dots bigger and non-transparent +  updated the colors of the teams to be same as in game
- Added 'Driven Line', so you can see many laps lines in the map

Race Info
- Deltas in P&Q are based on best laptimes
- In Fuel left, added fuel use average on the active Fuel Mix
- Nicer time left view

Race Timing
- Added different color to team mate, so you can easier find their data
- Added last lap sort order

Driving
- Total re-organization of the data.
- Made the friction circle tail dots smaller

General
- Many small fixes and tweaks
- Added few more fields to the saved laps

Laptime stats
- Saves also tyre used on the lap.
- Tooltips to all controls, so it is easier to know what they do

# What is 8.0 and what is new.
========================================
New UI using JavaFX. This will make it easier to develop the system further. 

The 8.0 is the default version and uses the 2018 data feed from the game.

Key new features
NEW UI
- No more tabs, but you can open the different "tabs" as separate windows. And you can also switch the views from your game controller (button can be set in Settings).
- You can remove the side bar, if you never use it
- You can also hide menus, if you don't need them
- You can run the tool in full-screen mode

Game data
- Saving opponent telemetry data + comparing it to your own data (or others)
- More accurate DELTA calculations
- All comparisons are now between RED and BLUE lap. You can select them from the top.

Telemetry
- Difflines for Brake/Throttle/Steer separate items

Map
- Map contains the flags per zones 
- option to show "pit window", i.e. where you will most likely land after pitstop.
The window depends on the track. Big thanks goes to Michelive from Racedepartment for his historical data on how much pit stop takes in every track.
- Full opponent names

Race Info
- Modify, how large time diff is visible on the graphs
- ERS + session related data added
- Tyre life left estimate


Race timing/Driving
- Race data shows opponent telemetry
- In raw data you can see the raw data from any opponent

Race history
- new graph: Time difference to leader for the whole race

Raw Data
- View data for all drivers

Some of the old Tabs will be put back in the future.


# Version history of 7.1 and earlier is in the help
====================================================
