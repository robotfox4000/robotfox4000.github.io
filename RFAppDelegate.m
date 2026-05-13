#import "RFAppDelegate.h"
#import "RFRootViewController.h"

@implementation RFAppDelegate

- (void)applicationDidFinishLaunching:(UIApplication *)application {
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    
    RFRootViewController *rootVC = [[[RFRootViewController alloc] init] autorelease];
    
    self.viewController = [[[UINavigationController alloc] initWithRootViewController:rootVC] autorelease];
    
    [self.window setRootViewController:self.viewController];
    [self.window makeKeyAndVisible];
}

- (void)dealloc {
    [_window release];
    [_viewController release];
    [super dealloc];
}
@end
