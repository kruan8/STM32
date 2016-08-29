/*
 * types.h
 *
 *  Created on: 21. 9. 2015
 *      Author: priesolv
 */

#ifndef TYPES_H_
#define TYPES_H_

#include "stdbool.h"
#include <stddef.h>
#include <assert.h>

typedef void(*VOID_FUNC)(void);

#define MAX(a,b) ((a) > (b) ? a : b)
#define MIN(a,b) ((a) < (b) ? a : b)

typedef const char* CP_STRING;
typedef char *P_STRING;

#endif /* TYPES_H_ */
