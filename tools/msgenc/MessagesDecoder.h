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
    map <uint16_t, string> cmdmap_dec;
    map <uint16_t, string> charmap_dec;

    void ReadMessagesFromBin(string& filename);
    void WriteMessagesToText(string& filename);
    void WriteBinaryFile(string& filename, void* data, streamsize size);
    u16string DecodeTrainerNameMessage(u16string const &message);
    string DecodeMessage(u16string& message, int& i);
public:
    MessagesDecoder(string &_textfilename, string &_keyfilename, string &_charmapfilename, string &_binfilename) : MessagesConverter(_textfilename, _keyfilename, _charmapfilename, _binfilename) {
        CreateInverseMap(charmap, charmap_dec);
        CreateInverseMap(cmdmap, cmdmap_dec);
    }
    void ReadInput();
    void Convert();
    void WriteOutput();
    ~MessagesDecoder() {}
};


#endif //GUARD_MESSAGESDECODER_H
