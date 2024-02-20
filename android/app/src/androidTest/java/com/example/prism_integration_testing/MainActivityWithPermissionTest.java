package com.example.prism_integration_testing;

import android.Manifest.permission;
import androidx.test.rule.ActivityTestRule;
import androidx.test.rule.GrantPermissionRule;
import dev.flutter.plugins.integration_test.FlutterTestRunner;
import org.junit.Rule;
import org.junit.runner.RunWith;

/**
 * Demonstrates how an integration test on Android can be run with permissions already granted. This
 * is helpful if developers want to test native App behavior that depends on certain system service
 * results which are guarded with permissions.
 */
@RunWith(FlutterTestRunner.class)
public class MainActivityWithPermissionTest {

  @Rule
  public GrantPermissionRule permissionRule =
      GrantPermissionRule.grant(permission.ACCESS_COARSE_LOCATION);

  @Rule
  public ActivityTestRule<MainActivity> rule =
      new ActivityTestRule<>(MainActivity.class, true, false);
}
