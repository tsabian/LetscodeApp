#!/bin/sh

#  Start.sh
#  Letscode
#
#  Created by Tiago Oliveira on 19/01/23.
#  Copyright © 2023 Tiago A. de Oliveira. All rights reserved.

if [ ! -f "./.git/hooks.pre-commit" ]; then
    echo '#!/bin/bash
if which swiftformat >/dev/null; then
  swiftformat ./Letscode && swiftformat ./LeetCodePlayground.playground
else
  echo "warning: SwiftFormat not installed, download from https://github.com/nicklockwood/SwiftFormat"
  exit 1
fi
' > ./.git/hooks/pre-commit
chmod +x .git/hooks/pre-commit
fi
