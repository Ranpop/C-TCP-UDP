# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

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

# The program to use to edit the cache.
CMAKE_EDIT_COMMAND = /usr/bin/ccmake

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /usr1/code/socket

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /usr1/code/socket

# Include any dependencies generated for this target.
include CMakeFiles/udp_client.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/udp_client.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/udp_client.dir/flags.make

CMakeFiles/udp_client.dir/udp_client.c.o: CMakeFiles/udp_client.dir/flags.make
CMakeFiles/udp_client.dir/udp_client.c.o: udp_client.c
	$(CMAKE_COMMAND) -E cmake_progress_report /usr1/code/socket/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object CMakeFiles/udp_client.dir/udp_client.c.o"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/udp_client.dir/udp_client.c.o   -c /usr1/code/socket/udp_client.c

CMakeFiles/udp_client.dir/udp_client.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/udp_client.dir/udp_client.c.i"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /usr1/code/socket/udp_client.c > CMakeFiles/udp_client.dir/udp_client.c.i

CMakeFiles/udp_client.dir/udp_client.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/udp_client.dir/udp_client.c.s"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /usr1/code/socket/udp_client.c -o CMakeFiles/udp_client.dir/udp_client.c.s

CMakeFiles/udp_client.dir/udp_client.c.o.requires:
.PHONY : CMakeFiles/udp_client.dir/udp_client.c.o.requires

CMakeFiles/udp_client.dir/udp_client.c.o.provides: CMakeFiles/udp_client.dir/udp_client.c.o.requires
	$(MAKE) -f CMakeFiles/udp_client.dir/build.make CMakeFiles/udp_client.dir/udp_client.c.o.provides.build
.PHONY : CMakeFiles/udp_client.dir/udp_client.c.o.provides

CMakeFiles/udp_client.dir/udp_client.c.o.provides.build: CMakeFiles/udp_client.dir/udp_client.c.o

# Object files for target udp_client
udp_client_OBJECTS = \
"CMakeFiles/udp_client.dir/udp_client.c.o"

# External object files for target udp_client
udp_client_EXTERNAL_OBJECTS =

udp_client: CMakeFiles/udp_client.dir/udp_client.c.o
udp_client: CMakeFiles/udp_client.dir/build.make
udp_client: /usr/local/lib/libopencv_videostab.so.2.4.9
udp_client: /usr/local/lib/libopencv_video.so.2.4.9
udp_client: /usr/local/lib/libopencv_ts.a
udp_client: /usr/local/lib/libopencv_superres.so.2.4.9
udp_client: /usr/local/lib/libopencv_stitching.so.2.4.9
udp_client: /usr/local/lib/libopencv_photo.so.2.4.9
udp_client: /usr/local/lib/libopencv_ocl.so.2.4.9
udp_client: /usr/local/lib/libopencv_objdetect.so.2.4.9
udp_client: /usr/local/lib/libopencv_nonfree.so.2.4.9
udp_client: /usr/local/lib/libopencv_ml.so.2.4.9
udp_client: /usr/local/lib/libopencv_legacy.so.2.4.9
udp_client: /usr/local/lib/libopencv_imgproc.so.2.4.9
udp_client: /usr/local/lib/libopencv_highgui.so.2.4.9
udp_client: /usr/local/lib/libopencv_gpu.so.2.4.9
udp_client: /usr/local/lib/libopencv_flann.so.2.4.9
udp_client: /usr/local/lib/libopencv_features2d.so.2.4.9
udp_client: /usr/local/lib/libopencv_core.so.2.4.9
udp_client: /usr/local/lib/libopencv_contrib.so.2.4.9
udp_client: /usr/local/lib/libopencv_calib3d.so.2.4.9
udp_client: /usr/local/lib/libopencv_nonfree.so.2.4.9
udp_client: /usr/local/lib/libopencv_ocl.so.2.4.9
udp_client: /usr/local/lib/libopencv_gpu.so.2.4.9
udp_client: /usr/local/lib/libopencv_photo.so.2.4.9
udp_client: /usr/local/lib/libopencv_objdetect.so.2.4.9
udp_client: /usr/local/lib/libopencv_legacy.so.2.4.9
udp_client: /usr/local/lib/libopencv_video.so.2.4.9
udp_client: /usr/local/lib/libopencv_ml.so.2.4.9
udp_client: /usr/local/lib/libopencv_calib3d.so.2.4.9
udp_client: /usr/local/lib/libopencv_features2d.so.2.4.9
udp_client: /usr/local/lib/libopencv_highgui.so.2.4.9
udp_client: /usr/local/lib/libopencv_imgproc.so.2.4.9
udp_client: /usr/local/lib/libopencv_flann.so.2.4.9
udp_client: /usr/local/lib/libopencv_core.so.2.4.9
udp_client: CMakeFiles/udp_client.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable udp_client"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/udp_client.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/udp_client.dir/build: udp_client
.PHONY : CMakeFiles/udp_client.dir/build

CMakeFiles/udp_client.dir/requires: CMakeFiles/udp_client.dir/udp_client.c.o.requires
.PHONY : CMakeFiles/udp_client.dir/requires

CMakeFiles/udp_client.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/udp_client.dir/cmake_clean.cmake
.PHONY : CMakeFiles/udp_client.dir/clean

CMakeFiles/udp_client.dir/depend:
	cd /usr1/code/socket && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /usr1/code/socket /usr1/code/socket /usr1/code/socket /usr1/code/socket /usr1/code/socket/CMakeFiles/udp_client.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/udp_client.dir/depend

