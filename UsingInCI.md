# Using CuberitePluginChecker in a CI

The main aim of this project is to be used in CI for other Cuberite plugins. This has been tested on the following CI providers:
 - CircleCI
 - Travis

Typically, the plugins to be tested need to define scenario files (preferably in a subfolder so that they can use the .lua extension and Cuberite doesn't load them), and add a CI-specific configuration file. In the CI environment, it's necessary to install Lua, all the needed Lua libraries, download the Checker and any supporting code (such as InfoReg.lua) from Cuberite.

The CI providers vary in the amount of freedom they provide for project builds, and the "build" times. The total time of the "build" consists of machine setup (installing all dependencies, downloading libraries etc.) and the atual Checker run time, which is usually negligible. Travis is winning here, with setup times being under a minute, while CircleCI takes about two minutes for the machine setup.

The following sections provide an example of the config files for the CI providers:


## CircleCI
CircleCI provides a clean machine with sudo access. There are no problems getting everything to work. Typical times for a CricleCI check is 2 minutes machine setup and 3 seconds Checker run.

The circle.yml file should look something like this:
```
dependencies:
 pre:
  - sudo apt-get install lua5.1 luarocks libssl-dev
  - sudo luarocks install luafilesystem
  - sudo luarocks install lsqlite3
  - sudo luarocks install luasocket
  - sudo luarocks install luasec OPENSSL_LIBDIR=/usr/lib/x86_64-linux-gnu
  - git clone https://github.com/madmaxoft/CuberitePluginChecker ~/Checker
  - wget -O ~/InfoReg.lua https://raw.githubusercontent.com/cuberite/cuberite/master/Server/Plugins/InfoReg.lua
  - mkdir ~/AutoAPI
  - wget -O ~/AutoAPI.zip https://builds.cuberite.org/job/Cuberite%20Windows%20x64%20Master/lastSuccessfulBuild/artifact/AutoAPI.zip
  - unzip ~/AutoAPI.zip -d ~/AutoAPI
  - wget -O ~/ManualAPI.zip https://builds.cuberite.org/job/Cuberite%20Windows%20x64%20Master/lastSuccessfulBuild/artifact/ManualAPI.zip
  - unzip ~/ManualAPI.zip -d ~

test:
 override:
  - cd ~/Checker && lua CuberitePluginChecker.lua -p ~/$CIRCLE_PROJECT_REPONAME -a ~/AutoAPI -e ~/ManualAPI.lua -i APIImpl/All.lua -s ~/$CIRCLE_PROJECT_REPONAME/tests/FuzzCommands.lua -g
```

## Travis
Travis can either use sudo, or have (much) faster builds. We decided to try for the faster builds, not requiring sudo. That means that luarocks need to be installed locally. Additionally, luarocks on Travis seems to have trouble cloning the `luasec` rock from git, so as a workaround we build the rock manually.
Typical times for a Travis CI check is 45 seconds machine setup and 3 seconds Checker run.

The .travis.yml file should look something like this:
```
sudo: false

addons:
  apt:
    packages:
    - lua5.1
    - luarocks

install:
  - luarocks --local install luafilesystem
  - luarocks --local install lsqlite3
  - luarocks --local install luasocket
  - git clone --depth=1 --branch=luasec-0.6 git://github.com/brunoos/luasec.git
  - cd luasec && luarocks --local make OPENSSL_LIBDIR=/usr/lib/x86_64-linux-gnu/
  - wget -O $TRAVIS_BUILD_DIR/../InfoReg.lua https://raw.githubusercontent.com/cuberite/cuberite/master/Server/Plugins/InfoReg.lua
  - mkdir ~/AutoAPI
  - wget -O ~/AutoAPI.zip --no-check-certificate https://builds.cuberite.org/job/Cuberite%20Windows%20x64%20Master/lastSuccessfulBuild/artifact/AutoAPI.zip
  - unzip ~/AutoAPI.zip -d ~/AutoAPI
  - wget -O ~/ManualAPI.zip --no-check-certificate https://builds.cuberite.org/job/Cuberite%20Windows%20x64%20Master/lastSuccessfulBuild/artifact/ManualAPI.zip
  - unzip ~/ManualAPI.zip -d ~
  - git clone https://github.com/cuberite/CuberitePluginChecker ~/Checker

script:
  - eval `luarocks path --bin` && cd ~/Checker && lua CuberitePluginChecker.lua -p $TRAVIS_BUILD_DIR -a ~/AutoAPI -e ~/ManualAPI.lua -i APIImpl/All.lua -s $TRAVIS_BUILD_DIR/tests/FuzzCommands.lua -g
```
