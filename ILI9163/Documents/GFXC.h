#ifndef GFXC_H
#define GFXC_H

#include <ILI9163.h>

#define LetterSpace 0
#define STLen 32

typedef enum{
	StdFont,
	Font1,
} Fonts;

typedef enum{
	SemiU,
	SemiD,
} SemicircleTypes;

typedef struct{
	uint8_t Size;
	Fonts Font;
	uint8_t XPos;
	uint8_t YPos;
	int8_t Padding;
	uint8_t Precision;
	Colours8 TxtCol;
	Colours8 BkgCol;
} TextParamStruct;

typedef struct{
	FunctionalState Fill;
	Colours8 LineCol;
	Colours8 FillCol;
	uint8_t Thickness;
	uint8_t XSPos;
	uint8_t YSPos;
	uint8_t XEPos;
	uint8_t YEPos;
	uint8_t Radius;
	uint16_t Angle;
	SemicircleTypes SemiUD;
	FunctionalState Dashed;
} ShapeParamStruct;

uint16_t GenerateColour(uint8_t, uint8_t, uint8_t);

void TextParamInit(TextParamStruct*);
void ShapeParamInit(ShapeParamStruct*);

int8_t PChar(uint16_t, TextParamStruct*);
int8_t PStr(const char*, TextParamStruct*);
int8_t PNum(int32_t, TextParamStruct*);
int8_t PNumF(float, TextParamStruct*);

int8_t Circle(ShapeParamStruct);
int8_t Ellipse(ShapeParamStruct);
int8_t Semicircle(ShapeParamStruct);

int8_t Rect(ShapeParamStruct);
int8_t LineP(ShapeParamStruct);
int8_t LineC(ShapeParamStruct);

int8_t Row(uint8_t, ShapeParamStruct);
int8_t Column(uint8_t, ShapeParamStruct);


/*
int16_t PChar(uint16_t, uint8_t, uint8_t, uint8_t, Colours8, Colours8);
int16_t PStr(const char*, uint8_t, uint8_t, uint8_t, Colours8, Colours8);
int16_t PNum(int32_t, uint8_t, uint8_t, int8_t, uint8_t, Colours8, Colours8);
int16_t PNumF(float, uint8_t, uint8_t, uint8_t, uint8_t, Colours8, Colours8);

uint8_t Circle(int16_t, int16_t, int16_t, Colours8);
uint8_t Ellipse(uint8_t, uint8_t, uint8_t, uint8_t, Colours8);
uint8_t Semicircle(uint8_t, uint8_t, uint8_t, uint8_t, Colours8);

uint8_t Rect(uint8_t, uint8_t, uint8_t, uint8_t, Colours8);
uint8_t FillRec(uint8_t, uint8_t, uint8_t, uint8_t, uint8_t, Colours8);
uint8_t LineP(uint8_t, uint8_t, uint8_t, int16_t, Colours8);
uint8_t LineC(uint8_t, uint8_t, uint8_t, uint8_t, Colours8);

uint8_t Row(uint8_t, uint8_t, uint8_t, Colours8);
uint8_t Column(uint8_t, uint8_t, uint8_t, Colours8);
*/

uint32_t Abs(int32_t);
int16_t FSin(int16_t);
int16_t FCos(int16_t);

#endif
