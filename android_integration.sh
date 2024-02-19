pushd android
# flutter build generates files in android/ for building the app
flutter build apk
./gradlew app:assembleAndroidTest
./gradlew app:assembleDebug -Ptarget=integration_test/app_test.dart
popd

gcloud auth activate-service-account --key-file=prism-dev-030122-75e34e02152f.json
gcloud --quiet config set project prism-dev-030122

gcloud firebase test android run --type instrumentation \
  --app build/app/outputs/apk/debug/app-debug.apk \
  --test build/app/outputs/apk/androidTest/debug/app-debug-androidTest.apk\
  --use-orchestrator \
  # --device model=panther \
  --timeout 5m \
  --results-bucket=gs://prism-dev-030122.appspot.com

## > gcloud firebase test android models list
# gcloud firebase test android run --type instrumentation \
#   --app build/app/outputs/apk/debug/app-debug.apk \
#   --test build/app/outputs/apk/androidTest/debug/app-debug-androidTest.apk \
#   --device-ids=blueline,OnePlus5T,x1q,redfin,flame \
#   --os-version-ids=25,26,27,28,29,30 \
#   --locales=en_GB,es \
#   --orientations=portrait,landscape \
#   --use-orchestrator \
#   --timeout 40m \
#   --results-bucket=gs://integration_results_mjcoffee \
#   --results-dir=tests/firebase  