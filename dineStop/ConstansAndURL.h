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

#define kFSClientID @"AZTZD0X3P5GSVYVMMDPMC2J4R4O4XHE0GHBDRNAQQYDJLRGI"
#define kFSClientSecret @"BJG5HNYHADT4MTNSDUCONJQT4EMYVG5BMJMQRIHOSATGYZRN"

#define kFSApiURL @"https://api.foursquare.com/v2/"
#define kFSVenuesURL (kFSApiURL @"venues/search")

typedef enum {
    kTableViewForNearByDines = 100,
    kTableViewForFavouriteHits
} kTableViewType;

#endif
