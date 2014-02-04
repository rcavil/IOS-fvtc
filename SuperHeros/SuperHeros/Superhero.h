//
//  superhero.h
//  SuperHeros
//
//  Created by Ron Cavil on 2/3/14.
//  Copyright (c) 2014 Ron Cavil. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Superhero : NSObject
{
  //private
  NSString *_name;
  NSString *_power;
  NSString *_secret;
}



-(id) initWithName: (NSString *) name withPower: (NSString*) power withSecret: (NSString*) secret;


//public

//name getter, capitalized attribute
-(NSString*) Name;
//name setter, set prefixed the attributre name
//parameter is lower case attribute name
-(void) SetName:(NSString*) name;

//name getter, capitalized attribute
-(NSString*) Power;
//name setter, set prefixed the attributre name
//parameter is lower case attribute name
-(void) SetPower:(NSString*) power;

//name getter, capitalized attribute
-(NSString*) Secret;
//name setter, set prefixed the attributre name
//parameter is lower case attribute name
-(void) SetSecret:(NSString*) secret;


@end
