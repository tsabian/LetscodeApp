#!/bin/sh

#  Start.sh
#  Letscode
#
#  Created by Tiago Oliveira on 19/01/23.
#  Copyright © 2023 Tiago A. de Oliveira. All rights reserved.
#!/bin/bash
# Install

echo "environment and dependences install"
echo -n "Run this script with user: "
echo $USER

osversion=(sw_vers -productVersion)

echo -n "MAC OS version: "
$osversion

if ! command -v xcodebuild &> /dev/null; then
    xcode-select —install
    echo "You need to install xcode"
    exit 1
else
    echo -n "xcode installed version: "
    xcodebuild -version
fi

if ! command -v brew &> /dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo -n "Brew installed version: "
    brew --version
fi

if ! command -v pod &> /dev/null; then
    sudo gem install cocoapods
else
    echo -n "Cocoapods installed version: "
    pod --version
fi

if !command -v swiftlint &> /dev/null; then
    brew install swiftlint
else
    echo -n "swiftlint installed version: "
    swiftlint --version
fi

if !command -v swiftformat &> /dev/null; then
    brew install swiftformat
else
    echo -n "swiftformat installed version: "
    swiftformat --version
fi
            DEAD_CODE_STRIPPING
if [ ! -f "./.git/hooks/pre-commit" ]; then
    echo "Generate git pre-commit hook"
    echo '#!/bin/bash
if which swiftformat >/dev/null; then
  swiftformat .

else
  echo "warning: SwiftFormat not installed, download from https://github.com/nicklockwood/SwiftFormat"
  exit 1

fi
' > ./.git/hooks/pre-commit
chmod +x .git/hooks/pre-commit
fi

xcodebuild -workspace ./Letscode.xcworkspace -scheme Letscode -configuration Release build

exit 0
