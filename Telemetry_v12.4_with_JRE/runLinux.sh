#!/bin/sh
cd "$(dirname "${BASH_SOURCE[0]}")"
bin/linux/bin/java -Dsun.jnu.encoding=UTF-8 -Dfile.encoding=UTF-8 -classpath Telemetry.jar apps.Launcher &