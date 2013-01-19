//
//  IPAddress.h
//  idenfier
//
//  Created by liangliang on 12-10-29.
//  Copyright (c) 2012年 LL. All rights reserved.
//

#ifndef idenfier_IPAddress_h
#define idenfier_IPAddress_h

#define MAXADDRS	32

extern char *if_names[MAXADDRS];
extern char *ip_names[MAXADDRS];
extern char *hw_addrs[MAXADDRS];
extern unsigned long ip_addrs[MAXADDRS];

// Function prototypes

void InitAddresses();
void FreeAddresses();
void GetIPAddresses();
void GetHWAddresses();


#endif
