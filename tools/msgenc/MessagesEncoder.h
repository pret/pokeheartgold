#ifndef GUARD_MESSAGESENCODER_H
#define GUARD_MESSAGESENCODER_H


#include "MessagesConverter.h"

class MessagesEncoder : public MessagesConverter
{
    map <string, uint16_t> cmdmap;
    map <string, uint16_t> charmap;

    void ReadMessagesFromText(string& filename);
    void ReadMessagesFromGMM(string& filename);
    void WriteMessagesToBin(string& filename);
    u16string EncodeMessage(const string& message, int & i);
    void CharmapRegisterCharacter(string& code, uint16_t value) override;
    void CmdmapRegisterCommand(string& command, uint16_t value) override;
public:
    MessagesEncoder(Options &options) : MessagesConverter(options) {
        textfilename = options.posargs[0];
        binfilename = options.posargs[1];
    }
    void ReadInput() override;
    void Convert() override;
    void WriteOutput() override;
    ~MessagesEncoder() override = default;
};


#endif //GUARD_MESSAGESENCODER_H
