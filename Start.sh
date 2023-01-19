#!/bin/sh

#  Start.sh
#  Letscode
#
#  Created by Tiago Oliveira on 19/01/23.
#  Copyright © 2023 Tiago A. de Oliveira. All rights reserved.

if [ ! -f "./.git/hooks.pre-commit" ]; then
    echo '#!/bin/bash

git-format-staged --formatter "swiftformat stdin --stdinpath '{}'" "*.swift"

' > ./.git/hooks/pre-commit
    
fi
