#import "RFAppDelegate.h"
#import "RFRootViewController.h"

@implementation RFAppDelegate

- (void)applicationDidFinishLaunching:(UIApplication *)application {
    // Standard window initialization
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    
    RFRootViewController *rootVC = [[[RFRootViewController alloc] init] autorelease];
    
    // This creates the top blue bar
    self.viewController = [[[UINavigationController alloc] initWithRootViewController:rootVC] autorelease];
    
    // Set the nav controller as the root - no TabBar/Tray
    [self.window setRootViewController:self.viewController];
    [self.window makeKeyAndVisible];
}

- (void)dealloc {
    [_window release];
    [_viewController release];
    [super dealloc];
}
@end
