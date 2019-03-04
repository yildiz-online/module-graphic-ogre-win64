# Yildiz-Engine module-graphic-ogre-win64.

This is the official repository of the Ogre3D Module, part of the Yildiz-Engine project.
The ogre module is an implementation of the graphic-module, based on Ogre3D library.

## Features

* OpenGL rendering.
* Mesh with animation.
* Billboard.
* Animated textures.
* GLSL support.
* ...

## Requirements

To build this module, you will need a java 9 JDK, Mingw64, and Maven 3.

## Coding Style and other information

Project website:
https://engine.yildiz-games.be

Issue tracker:
https://yildiz.atlassian.net

Wiki:
https://yildiz.atlassian.net/wiki

Quality report:
https://sonarqube.com/overview?id=be.yildiz-games:module-graphic-ogre

## License

All source code files are licensed under the permissive MIT license
(http://opensource.org/licenses/MIT) unless marked differently in a particular folder/file.

## Build instructions

Go to your root directory, where you POM file is located.

Then invoke maven

	mvn clean install

This will compile the source code, then run the unit tests, and finally build a jar file and DLL/SO for the environment you chose.

## Usage

In your maven project, add the dependency

```xml
<dependency>
    <groupId>be.yildiz-games</groupId>
    <artifactId>module-graphic-ogre-win64</artifactId>
    <versionLATEST</version>
</dependency>
```
## Contact
Owner of this repository: Grégory Van den Borre
