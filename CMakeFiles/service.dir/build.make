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
include CMakeFiles/service.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/service.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/service.dir/flags.make

CMakeFiles/service.dir/service.c.o: CMakeFiles/service.dir/flags.make
CMakeFiles/service.dir/service.c.o: service.c
	$(CMAKE_COMMAND) -E cmake_progress_report /usr1/code/socket/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object CMakeFiles/service.dir/service.c.o"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/service.dir/service.c.o   -c /usr1/code/socket/service.c

CMakeFiles/service.dir/service.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/service.dir/service.c.i"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /usr1/code/socket/service.c > CMakeFiles/service.dir/service.c.i

CMakeFiles/service.dir/service.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/service.dir/service.c.s"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /usr1/code/socket/service.c -o CMakeFiles/service.dir/service.c.s

CMakeFiles/service.dir/service.c.o.requires:
.PHONY : CMakeFiles/service.dir/service.c.o.requires

CMakeFiles/service.dir/service.c.o.provides: CMakeFiles/service.dir/service.c.o.requires
	$(MAKE) -f CMakeFiles/service.dir/build.make CMakeFiles/service.dir/service.c.o.provides.build
.PHONY : CMakeFiles/service.dir/service.c.o.provides

CMakeFiles/service.dir/service.c.o.provides.build: CMakeFiles/service.dir/service.c.o

# Object files for target service
service_OBJECTS = \
"CMakeFiles/service.dir/service.c.o"

# External object files for target service
service_EXTERNAL_OBJECTS =

service: CMakeFiles/service.dir/service.c.o
service: CMakeFiles/service.dir/build.make
service: /usr/local/lib/libopencv_videostab.so.2.4.9
service: /usr/local/lib/libopencv_video.so.2.4.9
service: /usr/local/lib/libopencv_ts.a
service: /usr/local/lib/libopencv_superres.so.2.4.9
service: /usr/local/lib/libopencv_stitching.so.2.4.9
service: /usr/local/lib/libopencv_photo.so.2.4.9
service: /usr/local/lib/libopencv_ocl.so.2.4.9
service: /usr/local/lib/libopencv_objdetect.so.2.4.9
service: /usr/local/lib/libopencv_nonfree.so.2.4.9
service: /usr/local/lib/libopencv_ml.so.2.4.9
service: /usr/local/lib/libopencv_legacy.so.2.4.9
service: /usr/local/lib/libopencv_imgproc.so.2.4.9
service: /usr/local/lib/libopencv_highgui.so.2.4.9
service: /usr/local/lib/libopencv_gpu.so.2.4.9
service: /usr/local/lib/libopencv_flann.so.2.4.9
service: /usr/local/lib/libopencv_features2d.so.2.4.9
service: /usr/local/lib/libopencv_core.so.2.4.9
service: /usr/local/lib/libopencv_contrib.so.2.4.9
service: /usr/local/lib/libopencv_calib3d.so.2.4.9
service: /usr/local/lib/libopencv_nonfree.so.2.4.9
service: /usr/local/lib/libopencv_ocl.so.2.4.9
service: /usr/local/lib/libopencv_gpu.so.2.4.9
service: /usr/local/lib/libopencv_photo.so.2.4.9
service: /usr/local/lib/libopencv_objdetect.so.2.4.9
service: /usr/local/lib/libopencv_legacy.so.2.4.9
service: /usr/local/lib/libopencv_video.so.2.4.9
service: /usr/local/lib/libopencv_ml.so.2.4.9
service: /usr/local/lib/libopencv_calib3d.so.2.4.9
service: /usr/local/lib/libopencv_features2d.so.2.4.9
service: /usr/local/lib/libopencv_highgui.so.2.4.9
service: /usr/local/lib/libopencv_imgproc.so.2.4.9
service: /usr/local/lib/libopencv_flann.so.2.4.9
service: /usr/local/lib/libopencv_core.so.2.4.9
service: CMakeFiles/service.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable service"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/service.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/service.dir/build: service
.PHONY : CMakeFiles/service.dir/build

CMakeFiles/service.dir/requires: CMakeFiles/service.dir/service.c.o.requires
.PHONY : CMakeFiles/service.dir/requires

CMakeFiles/service.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/service.dir/cmake_clean.cmake
.PHONY : CMakeFiles/service.dir/clean

CMakeFiles/service.dir/depend:
	cd /usr1/code/socket && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /usr1/code/socket /usr1/code/socket /usr1/code/socket /usr1/code/socket /usr1/code/socket/CMakeFiles/service.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/service.dir/depend

