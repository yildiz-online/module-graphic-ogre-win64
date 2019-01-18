#!/usr/bin/env bash

source ../../../../target/classes/project.txt

VERSION=${VERSION%"-SNAPSHOT"}

echo "1 VERSIONINFO" > version.rc
echo "FILEVERSION $VERSION,0" | tr . , >> version.rc
echo "PRODUCTVERSION $VERSION,0" | tr . , >> version.rc
echo "FILEFLAGSMASK 0x17L" >> version.rc
echo "FILEFLAGS 0x0L" >> version.rc
echo "FILEOS 0x4L" >> version.rc
echo "FILETYPE 0x1L" >> version.rc
echo "FILESUBTYPE 0x0L" >> version.rc
echo "BEGIN" >> version.rc
echo "    BLOCK \"StringFileInfo\"" >> version.rc
echo "    BEGIN" >> version.rc
echo "        BLOCK \"040904b0\"" >> version.rc
echo "        BEGIN" >> version.rc
echo "            VALUE \"FileDescription\", \"Yildiz-Engine Graphic engine with Ogre3D implementation.\"" >> version.rc
echo "            VALUE \"FileVersion\", \"$VERSION,0\"" | tr . , >> version.rc
echo "            VALUE \"InternalName\", \"libyildizogre.dll\\\0\"" >> version.rc
echo "            VALUE \"LegalCopyright\", \"Copyright (c) 2019 Gregory Van den Borre\\\0\"" >> version.rc
echo "            VALUE \"OriginalFilename\", \"libyildizogre.dll\\\0\"" >> version.rc
echo "            VALUE \"CompanyName\", \"Yildiz-Games\\\0\"" >> version.rc
echo "            VALUE \"ProductName\", \"Yildiz-Engine Graphic Ogre3D module.\\\0\"" >> version.rc
echo "            VALUE \"ProductVersion\", \"$VERSION,0\"" | tr . , >> version.rc
echo "        END" >> version.rc
echo "    END" >> version.rc
echo "    BLOCK \"VarFileInfo\"" >> version.rc
echo "    BEGIN" >> version.rc
echo "        VALUE \"Translation\", 0x409, 1200" >> version.rc
echo "    END" >> version.rc
echo "END" >> version.rc


cmake . -DCMAKE_BUILD_TYPE=Release -DCMAKE_COLOR_MAKEFILE=on -DLIBRARY_OUTPUT_PATH=" ../../../../target/classes/win64" -DCMAKE_TOOLCHAIN_FILE=mingw-toolchain.cmake

make
r1=$?

cp physicsfs/win64/bin/libphysfs.dll ../../../../target/classes/win64
cp ogre3d/win64/bin/OgreMain.dll ../../../../target/classes/win64
cp ogre3d/win64/bin/OgreOverlay.dll ../../../../target/classes/win64
cp ogre3d/win64/bin/Plugin_ParticleFX.dll ../../../../target/classes/win64
cp ogre3d/win64/bin/RenderSystem_GL.dll ../../../../target/classes/win64
rm -r build
rm -r boost
rm -r physicsfs
rm -r ogre3d
rm -r java
rm libgcc_s_seh-1.dll
rm libstdc++-6.dll
rm mingw-toolchain.cmake
rm -r ../../includes
rm -r ../../c++

exit $r1


