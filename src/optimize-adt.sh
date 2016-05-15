#!/bin/bash

major_version=24.2.0
minor_version=YYYYMMDD # replace it with the current minor version
working_directory=bundles-${major_version}-${minor_version}

unzip bundles-${major_version}-SNAPSHOT.zip -d ${working_directory}
cd ${working_directory}
zip ../ADT-${major_version}-${minor_version}.zip `find . | egrep "${minor_version}"` *.jar
cd ..
rm -rf ${working_directory}

echo "Done!"

