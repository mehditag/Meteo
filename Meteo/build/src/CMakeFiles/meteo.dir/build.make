# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.12

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/mehdi/Downloads/git/Meteo/Meteo

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/mehdi/Downloads/git/Meteo/Meteo/build

# Include any dependencies generated for this target.
include src/CMakeFiles/meteo.dir/depend.make

# Include the progress variables for this target.
include src/CMakeFiles/meteo.dir/progress.make

# Include the compile flags for this target's objects.
include src/CMakeFiles/meteo.dir/flags.make

src/qrc_resources.cpp: ../src/qml/main.qml
src/qrc_resources.cpp: ../src/qml/Icones/Averses.svg
src/qrc_resources.cpp: ../src/qml/Icones/Brouillard.svg
src/qrc_resources.cpp: ../src/qml/Icones/Nuageux.svg
src/qrc_resources.cpp: ../src/qml/Icones/Soleil.svg
src/qrc_resources.cpp: ../src/qml/Icones/Orageux.svg
src/qrc_resources.cpp: ../src/qml/Icones/Pluvieux.svg
src/qrc_resources.cpp: ../src/qml/Icones/Soleil_nuageux.svg
src/qrc_resources.cpp: ../src/resources.qrc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/mehdi/Downloads/git/Meteo/Meteo/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Generating qrc_resources.cpp"
	cd /home/mehdi/Downloads/git/Meteo/Meteo/build/src && /usr/lib/qt5/bin/rcc --name resources --output /home/mehdi/Downloads/git/Meteo/Meteo/build/src/qrc_resources.cpp /home/mehdi/Downloads/git/Meteo/Meteo/src/resources.qrc

src/CMakeFiles/meteo.dir/Objets.cpp.o: src/CMakeFiles/meteo.dir/flags.make
src/CMakeFiles/meteo.dir/Objets.cpp.o: ../src/Objets.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/mehdi/Downloads/git/Meteo/Meteo/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object src/CMakeFiles/meteo.dir/Objets.cpp.o"
	cd /home/mehdi/Downloads/git/Meteo/Meteo/build/src && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/meteo.dir/Objets.cpp.o -c /home/mehdi/Downloads/git/Meteo/Meteo/src/Objets.cpp

src/CMakeFiles/meteo.dir/Objets.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/meteo.dir/Objets.cpp.i"
	cd /home/mehdi/Downloads/git/Meteo/Meteo/build/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/mehdi/Downloads/git/Meteo/Meteo/src/Objets.cpp > CMakeFiles/meteo.dir/Objets.cpp.i

src/CMakeFiles/meteo.dir/Objets.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/meteo.dir/Objets.cpp.s"
	cd /home/mehdi/Downloads/git/Meteo/Meteo/build/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/mehdi/Downloads/git/Meteo/Meteo/src/Objets.cpp -o CMakeFiles/meteo.dir/Objets.cpp.s

src/CMakeFiles/meteo.dir/main.cpp.o: src/CMakeFiles/meteo.dir/flags.make
src/CMakeFiles/meteo.dir/main.cpp.o: ../src/main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/mehdi/Downloads/git/Meteo/Meteo/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object src/CMakeFiles/meteo.dir/main.cpp.o"
	cd /home/mehdi/Downloads/git/Meteo/Meteo/build/src && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/meteo.dir/main.cpp.o -c /home/mehdi/Downloads/git/Meteo/Meteo/src/main.cpp

src/CMakeFiles/meteo.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/meteo.dir/main.cpp.i"
	cd /home/mehdi/Downloads/git/Meteo/Meteo/build/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/mehdi/Downloads/git/Meteo/Meteo/src/main.cpp > CMakeFiles/meteo.dir/main.cpp.i

src/CMakeFiles/meteo.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/meteo.dir/main.cpp.s"
	cd /home/mehdi/Downloads/git/Meteo/Meteo/build/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/mehdi/Downloads/git/Meteo/Meteo/src/main.cpp -o CMakeFiles/meteo.dir/main.cpp.s

src/CMakeFiles/meteo.dir/qrc_resources.cpp.o: src/CMakeFiles/meteo.dir/flags.make
src/CMakeFiles/meteo.dir/qrc_resources.cpp.o: src/qrc_resources.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/mehdi/Downloads/git/Meteo/Meteo/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object src/CMakeFiles/meteo.dir/qrc_resources.cpp.o"
	cd /home/mehdi/Downloads/git/Meteo/Meteo/build/src && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/meteo.dir/qrc_resources.cpp.o -c /home/mehdi/Downloads/git/Meteo/Meteo/build/src/qrc_resources.cpp

src/CMakeFiles/meteo.dir/qrc_resources.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/meteo.dir/qrc_resources.cpp.i"
	cd /home/mehdi/Downloads/git/Meteo/Meteo/build/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/mehdi/Downloads/git/Meteo/Meteo/build/src/qrc_resources.cpp > CMakeFiles/meteo.dir/qrc_resources.cpp.i

src/CMakeFiles/meteo.dir/qrc_resources.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/meteo.dir/qrc_resources.cpp.s"
	cd /home/mehdi/Downloads/git/Meteo/Meteo/build/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/mehdi/Downloads/git/Meteo/Meteo/build/src/qrc_resources.cpp -o CMakeFiles/meteo.dir/qrc_resources.cpp.s

src/CMakeFiles/meteo.dir/meteo_autogen/mocs_compilation.cpp.o: src/CMakeFiles/meteo.dir/flags.make
src/CMakeFiles/meteo.dir/meteo_autogen/mocs_compilation.cpp.o: src/meteo_autogen/mocs_compilation.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/mehdi/Downloads/git/Meteo/Meteo/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object src/CMakeFiles/meteo.dir/meteo_autogen/mocs_compilation.cpp.o"
	cd /home/mehdi/Downloads/git/Meteo/Meteo/build/src && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/meteo.dir/meteo_autogen/mocs_compilation.cpp.o -c /home/mehdi/Downloads/git/Meteo/Meteo/build/src/meteo_autogen/mocs_compilation.cpp

src/CMakeFiles/meteo.dir/meteo_autogen/mocs_compilation.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/meteo.dir/meteo_autogen/mocs_compilation.cpp.i"
	cd /home/mehdi/Downloads/git/Meteo/Meteo/build/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/mehdi/Downloads/git/Meteo/Meteo/build/src/meteo_autogen/mocs_compilation.cpp > CMakeFiles/meteo.dir/meteo_autogen/mocs_compilation.cpp.i

src/CMakeFiles/meteo.dir/meteo_autogen/mocs_compilation.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/meteo.dir/meteo_autogen/mocs_compilation.cpp.s"
	cd /home/mehdi/Downloads/git/Meteo/Meteo/build/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/mehdi/Downloads/git/Meteo/Meteo/build/src/meteo_autogen/mocs_compilation.cpp -o CMakeFiles/meteo.dir/meteo_autogen/mocs_compilation.cpp.s

# Object files for target meteo
meteo_OBJECTS = \
"CMakeFiles/meteo.dir/Objets.cpp.o" \
"CMakeFiles/meteo.dir/main.cpp.o" \
"CMakeFiles/meteo.dir/qrc_resources.cpp.o" \
"CMakeFiles/meteo.dir/meteo_autogen/mocs_compilation.cpp.o"

# External object files for target meteo
meteo_EXTERNAL_OBJECTS =

src/meteo: src/CMakeFiles/meteo.dir/Objets.cpp.o
src/meteo: src/CMakeFiles/meteo.dir/main.cpp.o
src/meteo: src/CMakeFiles/meteo.dir/qrc_resources.cpp.o
src/meteo: src/CMakeFiles/meteo.dir/meteo_autogen/mocs_compilation.cpp.o
src/meteo: src/CMakeFiles/meteo.dir/build.make
src/meteo: /usr/lib/x86_64-linux-gnu/libQt5Qml.so.5.11.1
src/meteo: /usr/lib/x86_64-linux-gnu/libQt5Gui.so.5.11.1
src/meteo: /usr/lib/x86_64-linux-gnu/libQt5Network.so.5.11.1
src/meteo: /usr/lib/x86_64-linux-gnu/libQt5Core.so.5.11.1
src/meteo: src/CMakeFiles/meteo.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/mehdi/Downloads/git/Meteo/Meteo/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Linking CXX executable meteo"
	cd /home/mehdi/Downloads/git/Meteo/Meteo/build/src && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/meteo.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/CMakeFiles/meteo.dir/build: src/meteo

.PHONY : src/CMakeFiles/meteo.dir/build

src/CMakeFiles/meteo.dir/clean:
	cd /home/mehdi/Downloads/git/Meteo/Meteo/build/src && $(CMAKE_COMMAND) -P CMakeFiles/meteo.dir/cmake_clean.cmake
.PHONY : src/CMakeFiles/meteo.dir/clean

src/CMakeFiles/meteo.dir/depend: src/qrc_resources.cpp
	cd /home/mehdi/Downloads/git/Meteo/Meteo/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/mehdi/Downloads/git/Meteo/Meteo /home/mehdi/Downloads/git/Meteo/Meteo/src /home/mehdi/Downloads/git/Meteo/Meteo/build /home/mehdi/Downloads/git/Meteo/Meteo/build/src /home/mehdi/Downloads/git/Meteo/Meteo/build/src/CMakeFiles/meteo.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/CMakeFiles/meteo.dir/depend

