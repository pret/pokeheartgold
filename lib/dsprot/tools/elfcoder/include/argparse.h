#ifndef ARGPARSE_H
#define ARGPARSE_H

#include "encoder.h"

int ArgParse_CreateTask(EncodingTask* task, char** argv);
void ArgParse_DestroyTask(EncodingTask* task);

#endif
