//
//  ConstansAndURL.h
//  dineStop
//
//  Created by Krishna Das on 08/03/14.
//  Copyright (c) 2014 Krishna Das. All rights reserved.
//

#ifndef dineStop_ConstansAndURL_h
#define dineStop_ConstansAndURL_h

#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)

typedef enum {
    kTableViewForNearByDines = 100,
    kTableViewForFavouriteHits
} kTableViewType;

#endif
