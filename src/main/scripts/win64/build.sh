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
echo "            VALUE \"FileDescription\", \"Yildiz-Engine Graphic engine with Ogre3D implementation\"" >> version.rc
echo "            VALUE \"FileVersion\", \"$VERSION,0\"" | tr . , >> version.rc
echo "            VALUE \"InternalName\", \"libyildizogre.dll\"" >> version.rc
echo "            VALUE \"LegalCopyright\", \"Copyright (c) 2019 Gregory Van den Borre\"" >> version.rc
echo "            VALUE \"OriginalFilename\", \"libyildizogre.dll\"" >> version.rc
echo "            VALUE \"CompanyName\", \"Yildiz-Games\"" >> version.rc
echo "            VALUE \"ProductName\", \"Yildiz-Engine Graphic Ogre3D module\"" >> version.rc
echo "            VALUE \"ProductVersion\", \"$VERSION,0\"" | tr . , >> version.rc
echo "        END" >> version.rc
echo "    END" >> version.rc
echo "    BLOCK \"VarFileInfo\"" >> version.rc
echo "    BEGIN" >> version.rc
echo "        VALUE \"Translation\", 0x409, 1200" >> version.rc
echo "    END" >> version.rc
echo "END" >> version.rc

target=../../../../target/classes/win64

cmake . -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_COLOR_MAKEFILE=on \
        -DLIBRARY_OUTPUT_PATH="$target/" \
        -DPHYSFS_INCLUDE_DIR="physicsfs/win64/include" \
        -DCMAKE_TOOLCHAIN_FILE=mingw-toolchain.cmake

make
r1=$?

files=(
    physicsfs/win64/libyildizphysfs.dll
    ogre3d/win64/bin/OgreMain.dll
    ogre3d/win64/bin/OgreOverlay.dll
    ogre3d/win64/bin/Plugin_ParticleFX.dll
    ogre3d/win64/bin/RenderSystem_GL.dll
    libstdc++-6.dll
    libgcc_s_seh-1.dll)

targets=(
    ${target}/libyildizphysfs.dll
    ${target}/OgreMain.dll
    ${target}/OgreOverlay.dll
    ${target}/Plugin_ParticleFX.dll
    ${target}/RenderSystem_GL.dll
    ${target}/libstdc++-6.dll
    ${target}/libgcc_s_seh-1.dll)


cp physicsfs/win64/libyildizphysfs.dll      ${target}/libyildizphysfs.dll
cp ogre3d/win64/bin/OgreMain.dll            ${target}/OgreMain.dll
cp ogre3d/win64/bin/OgreOverlay.dll         ${target}/OgreOverlay.dll
cp ogre3d/win64/bin/Plugin_ParticleFX.dll   ${target}/Plugin_ParticleFX.dll
cp ogre3d/win64/bin/RenderSystem_GL.dll     ${target}/RenderSystem_GL.dll
cp libstdc++-6.dll                          ${target}/libstdc++-6.dll
cp libgcc_s_seh-1.dll                       ${target}/libgcc_s_seh-1.dll

#Add yildizogre to be checked for existence.
targets=(${targets[@]} ${target}/libyildizogre.dll)

#for target in ${!targets[*]}
#do
#    if ! [[ -f ${target} ]]
#    then
#        echo "$target not exists"
#        ${r1}=-1
#    fi
#done

rm -r ../../c++
rm -r ../../includes

exit ${r1}
