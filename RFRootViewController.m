#import "RFRootViewController.h"

@implementation RFRootViewController {
    UIWebView *_webView;
}

- (void)loadView {
    [super loadView];
    
    UIButton *aboutButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [aboutButton setTitle:@"About" forState:UIControlStateNormal];
    
    aboutButton.frame = CGRectMake(0, 0, 80, 30);
    [aboutButton addTarget:self action:@selector(showAbout) forControlEvents:UIControlEventTouchUpInside];

    self.navigationItem.titleView = aboutButton;

    self.view.backgroundColor = [UIColor whiteColor];

    _webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    _webView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    _webView.scalesPageToFit = YES;
    _webView.delegate = self;
    [self.view addSubview:_webView];

    UIBarButtonItem *back = [[UIBarButtonItem alloc] initWithTitle:@"<" style:UIBarButtonItemStyleBordered target:_webView action:@selector(goBack)];
    UIBarButtonItem *fwd = [[UIBarButtonItem alloc] initWithTitle:@">" style:UIBarButtonItemStyleBordered target:_webView action:@selector(goForward)];
    self.navigationItem.leftBarButtonItems = @[back, fwd];

    UIBarButtonItem *home = [[UIBarButtonItem alloc] initWithTitle:@"Home" style:UIBarButtonItemStyleBordered target:self action:@selector(goHome)];
    UIBarButtonItem *refresh = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:_webView action:@selector(reload)];
    self.navigationItem.rightBarButtonItems = @[refresh, home];

    [back release]; [fwd release]; [home release]; [refresh release];

    [self goHome];
}

- (void)goHome {
    NSURL *url = [NSURL URLWithString:@"http://iphoneosobscura.litten.ca"];
    [_webView loadRequest:[NSURLRequest requestWithURL:url]];
}

- (void)showAbout {
    NSString *message = @"RFoxObscura v1.1.0\n"
                        "Developed by Robotfox4000\n\n"
                        "--- Changelog ---\n"
                        "- Removed app name on top bar\n"
                        "- Moved about to top bar \n"
                        "- Moved nav buttons to top bar \n\n"
                         "Credits: iPhoneOS Obscura / Litten";

    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"About & Changelog" 
                                                    message:message 
                                                   delegate:nil 
                                          cancelButtonTitle:@"Dismiss" 
                                          otherButtonTitles:nil];
    [alert show];
    [alert release];
}

- (void)dealloc {
    [_webView stopLoading];
    _webView.delegate = nil;
    [_webView release];
    [super dealloc];
}
@end
