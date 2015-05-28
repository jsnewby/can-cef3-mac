// Copyright (c) 2011 The Chromium Embedded Framework Authors. All rights
// reserved. Use of this source code is governed by a BSD-style license that
// can be found in the LICENSE file.

#import <Cocoa/Cocoa.h>

#include "cefclient/client_handler.h"
#include "include/cef_browser.h"
#include "include/cef_frame.h"
#include "cefclient/cefclient.h"
#include "cefclient/resource_util.h"

void ClientHandler::OnAddressChange(CefRefPtr<CefBrowser> browser,
                                    CefRefPtr<CefFrame> frame,
                                    const CefString& url) {
  /*CEF_REQUIRE_UI_THREAD();

  if (GetBrowserId() == browser->GetIdentifier() && frame->IsMain()) {
    // Set the edit window text
    NSTextField* textField = (NSTextField*)edit_handle_;
    std::string urlStr(url);
    NSString* str = [NSString stringWithUTF8String:urlStr.c_str()];
    [textField setStringValue:str];
  }*/
    
    
}

void ClientHandler::OnTitleChange(CefRefPtr<CefBrowser> browser,
                                  const CefString& title) {
  CEF_REQUIRE_UI_THREAD();
/*
  // Set the frame window title bar
  NSView* view = (NSView*)browser->GetHost()->GetWindowHandle();
  NSWindow* window = [view window];*/
  std::string titleStr(title);
  NSString* str = [NSString stringWithUTF8String:titleStr.c_str()];
 //[window setTitle:str];
    
    //begin devika
    NSDictionary *userInfo = @{@"tabTitle":str};
    [[NSNotificationCenter defaultCenter] postNotificationName:@"BrowserTitleChangedNotification" object:nil userInfo:userInfo];
   //end devika
}

void ClientHandler::SendNotification(NotificationType type) {
  SEL sel = nil;
  switch(type) {
    case NOTIFY_CONSOLE_MESSAGE:
      sel = @selector(notifyConsoleMessage:);
      break;
    case NOTIFY_DOWNLOAD_COMPLETE:
      sel = @selector(notifyDownloadComplete:);
      break;
    case NOTIFY_DOWNLOAD_ERROR:
      sel = @selector(notifyDownloadError:);
      break;
  }

  if (sel == nil)
    return;

  NSWindow* window = [AppGetMainWindowHandle() window];
  NSObject* delegate = [window delegate];
  [delegate performSelectorOnMainThread:sel withObject:nil waitUntilDone:NO];
}

void ClientHandler::SetLoading(bool isLoading) {
  // TODO(port): Change button status.
}

void ClientHandler::SetNavState(bool canGoBack, bool canGoForward) {
  // TODO(port): Change button status.
}

std::string ClientHandler::GetDownloadPath(const std::string& file_name) {
  return std::string();
}



bool ClientHandler::ErrorPageText(std::string& out, ErrorPage errorPage) {
    const char* page = "error-application.html";
    switch (errorPage) {
        case ErrorPageApplication:
            break;
        case ErrorPageConnection:
            page = "error-connection.html";
            break;
        default:
            return false;
    }
    return LoadBinaryResource(page, out);
}



void ClientHandler::LaunchTab(CefString& url) {
    // devika needs to be modified to open in a new tab
    
    //option with notifications
   /* CEF_REQUIRE_UI_THREAD();
    std::string us = url.ToString();
    NSString *launch_url = [NSString stringWithUTF8String:us.c_str()];
    NSDictionary *userInfo = @{@"launchURL":launch_url};
    [[NSNotificationCenter defaultCenter] postNotificationName:@"LaunchNewTabNotification" object:nil userInfo:userInfo];*/
    
    
   /* std::string us = url.ToString();
    NSString *launch_url = [NSString stringWithUTF8String:us.c_str()];
    NSDictionary *userInfo = @{@"launchURL":launch_url};
    NSNotification *myNotification = [NSNotification notificationWithName:@"LaunchNewTabNotification" object:nil userInfo:userInfo];
    [[NSNotificationQueue defaultQueue] enqueueNotification:myNotification postingStyle:NSPostWhenIdle  coalesceMask:NSNotificationCoalescingOnName forModes:nil];*/
    
    // old method that launches a new browser
    /*std::string us = url.ToString();
    CFURLRef url_ref = CFURLCreateWithBytes(NULL,reinterpret_cast<const UInt8*>(us.c_str()), url.length(), kCFStringEncodingUTF8, NULL);
    LSOpenCFURLRef(url_ref, NULL);
    CFRelease(url_ref);*/
    
    //notifying the window...
    
    
    //std::string us = url.ToString();
    //NSString *launch_url = [NSString stringWithUTF8String:us.c_str()];
    
    //CEF_REQUIRE_UI_THREAD();
    
   // g_handler->GetBrowser()->GetMainFrame()
    if (GetBrowserId() == browser_->GetIdentifier() && browser_->GetMainFrame()) {
        // Set the edit window text
        NSTextField* textField = (NSTextField*)edit_handle_;
        //std::string urlStr(url);
        //NSString* str = [NSString stringWithUTF8String:urlStr.c_str()];
        std::string us = url.ToString();
        NSString *launch_url = [NSString stringWithUTF8String:us.c_str()];
        
        [textField setStringValue:launch_url];
        //[textField commitEditing];
    }
    
    
    NSWindow* window = [AppGetMainWindowHandle() window];
    NSObject* delegate = [window delegate];
    
    SEL sel = nil;
    sel = @selector(takeURLStringValueFrom:);
    [delegate performSelectorOnMainThread:sel withObject:nil waitUntilDone:NO];
    
}
