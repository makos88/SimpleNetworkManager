//
//  Constants.h
//  SimpleNetworkManager
//
//  Created by Kamil Makowski on 20/04/16.
//  Copyright © 2016 Kamil Makowski. All rights reserved.
//

#ifndef Constants_h
#define Constants_h

typedef enum {
    VCDataStateNew = 0,
    VCDataStateDownloading,
    VCDataStateSending,
    VCDataStateOK,
    VCDataStateConnectionError,
    VCDataStateDataError
} VCDataState;

typedef enum {
    NetCommunicationStateDownloading,
    NetCommunicationStateSending,
    NetCommunicationStateOK,
    NetCommunicationStateError
} NetCommunicationState;

typedef enum {
    VCTypeLogin = 1,
} VCType;

#endif /* Constants_h */
