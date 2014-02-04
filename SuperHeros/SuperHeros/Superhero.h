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
  NSString *name_;
  NSString *power_;
  NSString *secret_;
}

//public
//name getter, capitalized attribute
-(NSString*) Name;
//name setter, set prefixed the attributre name
//parameter is lower case attribute name
-(void) SetName:(NSString*) name;




@end
