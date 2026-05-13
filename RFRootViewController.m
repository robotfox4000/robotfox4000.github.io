#import "RFRootViewController.h"

@implementation RFRootViewController {
    UIWebView *_webView;
}

- (void)loadView {
    [super loadView];
    self.title = @"RFoxObscura";
    self.view.backgroundColor = [UIColor whiteColor];

    // Use full view bounds
    _webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    _webView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    _webView.scalesPageToFit = YES;
    _webView.delegate = self;
    [self.view addSubview:_webView];

    // Toolbar
    UIToolbar *toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height - 44, self.view.bounds.size.width, 44)];
    toolbar.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;

    UIBarButtonItem *back = [[UIBarButtonItem alloc] initWithTitle:@"<" style:UIBarButtonItemStyleBordered target:_webView action:@selector(goBack)];
    UIBarButtonItem *fwd = [[UIBarButtonItem alloc] initWithTitle:@">" style:UIBarButtonItemStyleBordered target:_webView action:@selector(goForward)];
    UIBarButtonItem *home = [[UIBarButtonItem alloc] initWithTitle:@"Home" style:UIBarButtonItemStyleBordered target:self action:@selector(goHome)];
    UIBarButtonItem *about = [[UIBarButtonItem alloc] initWithTitle:@"About" style:UIBarButtonItemStyleBordered target:self action:@selector(showAbout)];
    UIBarButtonItem *flex = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];

    [toolbar setItems:@[back, flex, fwd, flex, home, flex, about]];
    [self.view addSubview:toolbar];

    [back release]; [fwd release]; [home release]; [about release]; [flex release]; [toolbar release];

    [self goHome];
}

- (void)goHome {
    // Ensure we use HTTP as legacy iOS often struggles with modern HTTPS/SSL certificates
    NSURL *url = [NSURL URLWithString:@"http://iphoneosobscura.litten.ca"];
    [_webView loadRequest:[NSURLRequest requestWithURL:url]];
}

- (void)showAbout {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"About" 
                                                    message:@"RFoxObscura v1.0.0\nDeveloped by Robotfox4000\nCredits: iPhoneOS Obscura / Litten" 
                                                   delegate:nil 
                                          cancelButtonTitle:@"Dismiss" 
                                          otherButtonTitles:nil];
    [alert show];
    [alert release];
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    return YES; 
}

- (void)dealloc {
    [_webView stopLoading];
    _webView.delegate = nil;
    [_webView release];
    [super dealloc];
}
@end
