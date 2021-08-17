#ifndef GUARD_MESSAGESDECODER_H
#define GUARD_MESSAGESDECODER_H


#include "MessagesConverter.h"

enum StrConvMode {
    STR_CONV_MODE_LEFT_ALIGN = 0,
    STR_CONV_MODE_RIGHT_ALIGN,
    STR_CONV_MODE_LEADING_ZEROS
};

class MessagesDecoder : public MessagesConverter
{
    map <uint16_t, string> cmdmap;
    map <uint16_t, string> charmap;

    void ReadMessagesFromBin(string& filename);
    void WriteMessagesToText(string& filename);
    static void WriteBinaryFile(string& filename, void* data, streamsize size);
    static u16string DecodeTrainerNameMessage(u16string const &message);
    string DecodeMessage(u16string& message, int& i);
    void CharmapRegisterCharacter(string& code, uint16_t value) override;
    void CmdmapRegisterCommand(string& command, uint16_t value) override;
public:
    MessagesDecoder(string &_textfilename, string &_keyfilename, string &_charmapfilename, string &_binfilename) : MessagesConverter(CONV_DECODE, _textfilename, _keyfilename, _charmapfilename, _binfilename) {}
    void ReadInput() override;
    void Convert() override;
    void WriteOutput() override;
    ~MessagesDecoder() override = default;
};


#endif //GUARD_MESSAGESDECODER_H
