//
//  Mp3Encoder.hpp
//  LearnAVone
//
//  Created by chenguang on 2020/4/20.
//  Copyright © 2020 chenguang. All rights reserved.
//

#ifndef Mp3Encoder_hpp
#define Mp3Encoder_hpp

#include <stdio.h>
#import "lame.h"
class Mp3Encoder {
private:
    FILE* pcmFile;
    FILE* mp3File;
    lame_t lameClient;
public:
    Mp3Encoder();
    ~Mp3Encoder();
    int Init(const char* pcmFilePath, const char *mp3FilePath, int sampleRate, int channels, int bitRate);
    void encoder();
    void destory();
};

#endif /* Mp3Encoder_hpp */
