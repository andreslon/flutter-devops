# #!/usr/bin/env bash
# cd ..
# set -e
# set -x
# cd ..
# git clone -b beta https://github.com/flutter/flutter.git
# export PATH=`pwd`/flutter/bin:$PATH
# flutter channel stable
# flutter doctor
# echo "Installed flutter to `pwd`/flutter"
# flutter pub cache repair
# flutter clean
# # flutter pub get
# # flutter build aab
# # mkdir -p android/app/build/outputs/aab/; mv build/app/outputs/aab/release/app.aab $_
# flutter pub get 
# flutter build appbundle



#!/usr/bin/env bash



#Place this script in project/android/app/

cd ..

# fail if any command fails
set -e
# debug log
set -x

cd ..
git clone -b beta https://github.com/flutter/flutter.git
export PATH=`pwd`/flutter/bin:$PATH

flutter channel stable
flutter doctor

echo "Installed flutter to `pwd`/flutter"

# sudo arch -x86_64 gem install ffi
# arch -x86_64 pod install

flutter pub cache repair
flutter clean
flutter pub get

# build APK
# if you get "Execution failed for task ':app:lintVitalRelease'." error, uncomment next two lines
# flutter build apk --debug
# flutter build apk --profile
flutter build apk --release

# if you need build bundle (AAB) in addition to your APK, uncomment line below and last line of this script.
#flutter build appbundle --release --build-number $APPCENTER_BUILD_ID

# copy the APK where AppCenter will find it
mkdir -p android/app/build/outputs/apk/; mv build/app/outputs/apk/release/app-release.apk $_

# copy the AAB where AppCenter will find it
#mkdir -p android/app/build/outputs/bundle/; mv build/app/outputs/bundle/release/app-release.aab $_