/**
 *
 * Ti Airprint
 *
 * Created by Dawson Toth, updated by Daniel Ethier
 * Copyright (c) 2010-2013 by Appcelerator, Inc.
 *
 */

#import "TiAirprintModule.h"
#import "TiBase.h"
#import "TiHost.h"
#import "TiUtils.h"

@implementation TiAirprintModule

#pragma mark Internal

// This is generated for your module, please do not change it

- (id)moduleGUID {
  	
  	return @"a17b1264-ad2d-4331-85ac-5acb2bf7ca5b";

	}

// This is generated for your module, please do not change it

- (NSString *)moduleId {
  
  	return @"ti.airprint";

	}


#pragma mark Lifecycle

// this method is called when the module is first loaded
// you *must* call the superclass

-(void)startup {

	[super startup];
	NSLog(@"[INFO] %@ loaded", self);

	}

// you *must* call the superclass

-(void)shutdown:(id)sender {

	[super shutdown:sender];

	}


#pragma mark Cleanup 

-(void)dealloc {
	
	[[NSNotificationCenter defaultCenter] removeObserver:self];

	}


#pragma mark Internal Memory Management

// optionally release any resources that can be dynamically
// reloaded once memory is available - such as caches

-(void)didReceiveMemoryWarning:(NSNotification*)notification {

	[super didReceiveMemoryWarning:notification];

	}


#pragma Public APIs

- (BOOL)canPrint:(id)args {

	return [UIPrintInteractionController isPrintingAvailable];

	}

- (void)print:(id)args {

	ENSURE_UI_THREAD(print,args);
	ENSURE_SINGLE_ARG(args,NSDictionary);

    NSURL*    url   = [TiUtils toURL:[args objectForKey:@"url"] proxy:self];
    NSString* html  = [args objectForKey:@"html" ];
 
    UIPrintInteractionController *controller = [UIPrintInteractionController sharedPrintController];

    if (!controller) {
    
        NSLog(@"[ERROR] Unable to create a print interaction controller.");
        return;
    
    	}

   if (url == nil && html == nil) {
   
        NSLog(@"[ERROR] Print called without passing in a url or html property!");
        return;
    
    	}
    	
    controller.printingItem = url;

    if (html != nil) {
    
        controller.printingItem = nil;
        UIViewPrintFormatter *formatter = [[UIMarkupTextPrintFormatter alloc] initWithMarkupText:html];
        
		formatter.perPageContentInsets = UIEdgeInsetsMake(72, 72, 72, 72); // 1 inch margins
		formatter.maximumContentWidth  = 450;
		formatter.maximumContentHeight = 650;
		
        controller.printFormatter = formatter;
    
    	}

    UIPrintInteractionCompletionHandler completionHandler =
    	^(UIPrintInteractionController *printController, BOOL completed, NSError *error) {
    	
			if(!completed && error){
				NSLog(@"[ERROR] Printing failed due to error in domain %@ with error code %u", error.domain, error.code);
				
			}
   
   		};
    
	[controller presentAnimated:YES completionHandler:completionHandler];

	}

@end
