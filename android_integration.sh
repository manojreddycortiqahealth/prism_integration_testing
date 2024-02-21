flutter build apk --debug 

pushd android
    ./gradlew app:assembleDebugAndroidTest
    ./gradlew app:assembleDebug -Ptarget=`pwd`/../integration_test/app_test.dart
    #./gradlew app:connectedDebugAndroidTest -Ptarget=integration_test/tests/create_todo_test.dart   #- To Run Test On Local For Verification
popd

gcloud auth activate-service-account --key-file=<Path to your file>
gcloud --quiet config set project prism-dev-030122

gcloud firebase test android run --type instrumentation \
    --app build/app/outputs/flutter-apk/app-debug.apk \
    --test build/app/outputs/apk/androidTest/debug/app-debug-androidTest.apk \
    --timeout 5m