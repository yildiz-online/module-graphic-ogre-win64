mkdir build
cd build

cmake ../ -DCMAKE_BUILD_TYPE=Release -DCMAKE_COLOR_MAKEFILE=on -DLIBRARY_OUTPUT_PATH="../../../../../target/classes/win64" -G "MinGW Makefiles"

SET r1=
mingw32-make

cd ..
copy physicsfs/win64/bin/libphysfs.dll ../../../../target/classes/win64
copy ogre3d/win64/bin/OgreMain.dll ../../../../target/classes/win64
copy ogre3d/win64/bin/OgreOverlay.dll ../../../../target/classes/win64
copy ogre3d/win64/bin/Plugin_ParticleFX.dll ../../../../target/classes/win64
copy ogre3d/win64/bin/RenderSystem_GL.dll ../../../../target/classes/win64
rmdir /s /q build
rmdir /s /q boost
rmdir /s /q physicsfs
rmdir /s /q ogre3d
rmdir /s /q java
del libgcc_s_seh-1.dll
del libstdc++-6.dll
del mingw-toolchain.cmake
cd ../..
rmdir includes
rmdir c++

EXIT /B $r1
