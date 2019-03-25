#!/usr/bin/env bash

cmake . -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_COLOR_MAKEFILE=on \
        -DLIBRARY_OUTPUT_PATH=" ../../../../target/classes/win64" \
        -DCMAKE_TOOLCHAIN_FILE=mingw-toolchain.cmake
        
echo "<<<<<<<<<<"        
cd ../../../../target/classes/win64
ls -l
echo "<<<<<<<<<<"

make
r1=$?

cp physicsfs/win64/bin/libphysfs.dll ../../../../target/classes/win64/libphysfs.dll
cp ogre3d/win64/bin/OgreMain.dll ../../../../target/classes/win64/OgreMain.dll
cp ogre3d/win64/bin/OgreOverlay.dll ../../../../target/classes/win64/OgreOverlay.dll
cp ogre3d/win64/bin/Plugin_ParticleFX.dll ../../../../target/classes/win64/Plugin_ParticleFX.dll
cp ogre3d/win64/bin/RenderSystem_GL.dll ../../../../target/classes/win64/RenderSystem_GL.dll

exit $r1


