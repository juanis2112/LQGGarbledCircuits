# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

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
CMAKE_SOURCE_DIR = /home/luisvm/Documents/lqg

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/luisvm/Documents/lqg

# Include any dependencies generated for this target.
include test/CMakeFiles/cloud.dir/depend.make

# Include the progress variables for this target.
include test/CMakeFiles/cloud.dir/progress.make

# Include the compile flags for this target's objects.
include test/CMakeFiles/cloud.dir/flags.make

test/CMakeFiles/cloud.dir/cloud.cpp.o: test/CMakeFiles/cloud.dir/flags.make
test/CMakeFiles/cloud.dir/cloud.cpp.o: test/cloud.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/luisvm/Documents/lqg/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object test/CMakeFiles/cloud.dir/cloud.cpp.o"
	cd /home/luisvm/Documents/lqg/test && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/cloud.dir/cloud.cpp.o -c /home/luisvm/Documents/lqg/test/cloud.cpp

test/CMakeFiles/cloud.dir/cloud.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/cloud.dir/cloud.cpp.i"
	cd /home/luisvm/Documents/lqg/test && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/luisvm/Documents/lqg/test/cloud.cpp > CMakeFiles/cloud.dir/cloud.cpp.i

test/CMakeFiles/cloud.dir/cloud.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/cloud.dir/cloud.cpp.s"
	cd /home/luisvm/Documents/lqg/test && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/luisvm/Documents/lqg/test/cloud.cpp -o CMakeFiles/cloud.dir/cloud.cpp.s

# Object files for target cloud
cloud_OBJECTS = \
"CMakeFiles/cloud.dir/cloud.cpp.o"

# External object files for target cloud
cloud_EXTERNAL_OBJECTS =

bin/cloud: test/CMakeFiles/cloud.dir/cloud.cpp.o
bin/cloud: test/CMakeFiles/cloud.dir/build.make
bin/cloud: /usr/local/lib/libemp-tool.so
bin/cloud: /usr/lib/x86_64-linux-gnu/libssl.so
bin/cloud: /usr/lib/x86_64-linux-gnu/libcrypto.so
bin/cloud: test/CMakeFiles/cloud.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/luisvm/Documents/lqg/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ../bin/cloud"
	cd /home/luisvm/Documents/lqg/test && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/cloud.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
test/CMakeFiles/cloud.dir/build: bin/cloud

.PHONY : test/CMakeFiles/cloud.dir/build

test/CMakeFiles/cloud.dir/clean:
	cd /home/luisvm/Documents/lqg/test && $(CMAKE_COMMAND) -P CMakeFiles/cloud.dir/cmake_clean.cmake
.PHONY : test/CMakeFiles/cloud.dir/clean

test/CMakeFiles/cloud.dir/depend:
	cd /home/luisvm/Documents/lqg && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/luisvm/Documents/lqg /home/luisvm/Documents/lqg/test /home/luisvm/Documents/lqg /home/luisvm/Documents/lqg/test /home/luisvm/Documents/lqg/test/CMakeFiles/cloud.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : test/CMakeFiles/cloud.dir/depend

