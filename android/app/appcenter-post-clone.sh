#!/usr/bin/env bash
cd ..
set -e
set -x
cd ..
git clone -b beta https://github.com/flutter/flutter.git
export PATH=`pwd`/flutter/bin:$PATH
flutter channel stable
flutter doctor
echo "Installed flutter to `pwd`/flutter"
flutter pub cache repair
flutter clean
# flutter pub get
# flutter build aab
# mkdir -p android/app/build/outputs/aab/; mv build/app/outputs/aab/release/app.aab $_
flutter pub get 
flutter build appbundle
