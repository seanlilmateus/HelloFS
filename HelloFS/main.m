//
//  main.m
//  HelloFS
//
//  Created by Mateus Armando on 17.04.12.
//  Copyright (c) 2012 Sean Coorp. INC. All rights reserved.
//

#import <Cocoa/Cocoa.h>

#import <MacRuby/MacRuby.h>

int main(int argc, char *argv[])
{
    return macruby_main("rb_main.rb", argc, argv);
}