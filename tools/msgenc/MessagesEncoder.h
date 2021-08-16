#ifndef GUARD_MESSAGESENCODER_H
#define GUARD_MESSAGESENCODER_H


#include "MessagesConverter.h"

class MessagesEncoder : public MessagesConverter
{
    void ReadKeyFile(string& keyfname);
    void ReadMessagesFromText(string& filename);
    void WriteMessagesToBin(string& filename);
    u16string EncodeMessage(const string& message, int & i);
public:
    MessagesEncoder(string &_textfilename, string &_keyfilename, string &_charmapfilename, string &_binfilename) : MessagesConverter(_textfilename, _keyfilename, _charmapfilename, _binfilename) {}
    void ReadInput();
    void Convert();
    void WriteOutput();
    ~MessagesEncoder() {}
};


#endif //GUARD_MESSAGESENCODER_H
