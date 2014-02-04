//
//  superhero.m
//  SuperHeros
//
//  Created by Ron Cavil on 2/3/14.
//  Copyright (c) 2014 Ron Cavil. All rights reserved.
//

#import "Superhero.h"

@implementation Superhero

/*
-(id) init
{
    self=[super init];
    //do initilization here
    index=0;
}
*/


-(id) initWithName: (NSString *) name withPower: (NSString*) power withSecret: (NSString*) secret

{
    self = [super init];
    _name=name;
    _power=power;
    _secret=secret;
    return self;
}


-(NSString*) Name
{
    return _name;
}


-(NSString*) Power
{
    return _power   ;
}



-(NSString*) Secret
{
    return _secret   ;
}


-(NSString*) description
{
    NSString *temp= [NSString stringWithFormat:@"Name:%@ Power:%@ Secret:%@", _name, _power, _secret];
    return temp;
}



-(void) SetName:(NSString*) name
{

    _name=name;
}



-(void) SetPower:(NSString *)power
{
    
    _power=power;
}

-(void) SetSecret:(NSString *)secret
{
    
    _secret=secret;
}


@end
