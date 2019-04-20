__device__ char getBits(long i, int idx) {
    return (i & (1 << idx)) != 0;
}

__global__ void gpu_boolean_matcher(char* result_ptr, int index){ 

char result = *result_ptr;
long element = (((long)blockIdx.x)*((long)blockDim.x) + ((long)threadIdx.x)); 
long maxCores = gridDim.x; 

switch(index){

//Expression #1, Amount of variables: 2
case 1:
    for (long i = element; i < (((long) 1) << 2); i += maxCores) {
        result = result && (getBits(i, 0)==getBits(i, 0)&&getBits(i, 1));
    }
    break;
// Expression #2, Amount of variables: 2
case 2:
    for (long i = element; i < (((long) 1) << 2); i += maxCores) {
        result = result && (getBits(i, 0)==!getBits(i, 0)||getBits(i, 1));
    }
    break;
// Expression #3, Amount of variables: 2
case 3:
    for (long i = element; i < (((long) 1) << 2); i += maxCores) {
        result = result && (getBits(i, 0)==!getBits(i, 1)&&!getBits(i, 0));
    }
    break;
// Expression #4, Amount of variables: 3
case 4:
    for (long i = element; i < (((long) 1) << 3); i += maxCores) {
        result = result && (getBits(i, 0)==(getBits(i, 1)&&!getBits(i, 0))&&getBits(i, 2));
    }
    break;
// Expression #5, Amount of variables: 4
case 5:
    for (long i = element; i < (((long) 1) << 4); i += maxCores) {
        result = result && (getBits(i, 0)==(!getBits(i, 1)||getBits(i, 0))&&(getBits(i, 2)||getBits(i, 3)));
    }
    break;
// Expression #6, Amount of variables: 5
case 6:
    for (long i = element; i < (((long) 1) << 5); i += maxCores) {
        result = result && (getBits(i, 0)==(getBits(i, 1)&&!getBits(i, 2))&&(getBits(i, 3)&&(getBits(i, 4)||!getBits(i, 0))));
    }
    break;
// Expression #7, Amount of variables: 20
case 7:
    for (long i = element; i < (((long) 1) << 20); i += maxCores) {
        result = result && (getBits(i, 0)==(getBits(i, 0)||!getBits(i, 1))&&(!getBits(i, 2)||getBits(i, 3))&&(((!getBits(i, 4)||!getBits(i, 5))||(!getBits(i, 6)||getBits(i, 7))))&&(!getBits(i, 8)||getBits(i, 9))&&(!getBits(i, 10)||!getBits(i, 11))&&(((!getBits(i, 12)||!getBits(i, 13))||getBits(i, 14))&&(getBits(i, 15)||getBits(i, 16))&&(getBits(i, 17)&&(!getBits(i, 18)&&!getBits(i, 19)))));
    }
    break;
// Expression #8, Amount of variables: 21
case 8:
    for (long i = element; i < (((long) 1) << 21); i += maxCores) {
        result = result && (getBits(i, 0)==((!(!getBits(i, 0)||(getBits(i, 1)||!getBits(i, 2))))&&((getBits(i, 3)&&!getBits(i, 4))&&(getBits(i, 5)||!getBits(i, 6))))||(((!getBits(i, 7)||!getBits(i, 8))||!getBits(i, 9))&&((getBits(i, 10)&&!getBits(i, 11))&&(getBits(i, 12)||!getBits(i, 13))))||((!(getBits(i, 14)||(getBits(i, 15)||getBits(i, 16))))&&((getBits(i, 17)||!getBits(i, 18))&&(getBits(i, 19)||getBits(i, 20)))));
    }
    break;
// Expression #9, Amount of variables: 25
case 9:
    for (long i = element; i < (((long) 1) << 25); i += maxCores) {
        result = result && (getBits(i, 0)==((getBits(i, 1)||getBits(i, 0))||(getBits(i, 2)&&(getBits(i, 3)&&getBits(i, 4))))||((getBits(i, 5)||getBits(i, 6))||((!getBits(i, 7)&&getBits(i, 8))&&!getBits(i, 9)))||((getBits(i, 10)&&!getBits(i, 11))||(!getBits(i, 12)&&(!getBits(i, 13)&&!getBits(i, 14))))||((getBits(i, 15)||(getBits(i, 16)||getBits(i, 17)))||(!getBits(i, 18)&&!getBits(i, 19)))||((!getBits(i, 20)||!getBits(i, 21))||((!getBits(i, 22)||!getBits(i, 23))||!getBits(i, 24))));
    }
    break;
// Expression #10, Amount of variables: 21
case 10:
    for (long i = element; i < (((long) 1) << 21); i += maxCores) {
        result = result && (getBits(i, 0)==(((!getBits(i, 1)&&getBits(i, 0))&&!getBits(i, 2))&&((getBits(i, 3)||!getBits(i, 4))&&(getBits(i, 5)||!getBits(i, 6))))||(((!getBits(i, 7)&&getBits(i, 8))||!getBits(i, 9))&&((getBits(i, 10)||!getBits(i, 11))&&(getBits(i, 12)&&!getBits(i, 13))))||(((getBits(i, 14)&&getBits(i, 15))||getBits(i, 16))&&((getBits(i, 17)||!getBits(i, 18))&&(!getBits(i, 19)&&getBits(i, 20)))));
    }
    break;
// Expression #11, Amount of variables: 30
case 11:
    for (long i = element; i < (((long) 1) << 30); i += maxCores) {
        result = result && (getBits(i, 0)==((!(getBits(i, 1)||getBits(i, 2)))||(!getBits(i, 3)&&(!getBits(i, 4)&&!getBits(i, 0))))||((!(getBits(i, 5)||getBits(i, 6)))||(getBits(i, 7)&&(getBits(i, 8)&&getBits(i, 9))))||((!(!getBits(i, 10)||getBits(i, 11)))||((getBits(i, 12)||getBits(i, 13))&&getBits(i, 14)))||((!(getBits(i, 15)||getBits(i, 16)))||((!getBits(i, 17)&&!getBits(i, 18))&&!getBits(i, 19)))||((!(getBits(i, 20)||getBits(i, 21)))||((getBits(i, 22)&&getBits(i, 23))&&getBits(i, 24)))||((!(!getBits(i, 25)||getBits(i, 26)))||((getBits(i, 27)||getBits(i, 28))&&getBits(i, 29))));
    }
    break;
// Expression #12, Amount of variables: 21
case 12:
    for (long i = element; i < (((long) 1) << 21); i += maxCores) {
        result = result && (getBits(i, 0)==((!getBits(i, 1)&&(getBits(i, 2)&&!getBits(i, 0)))||((getBits(i, 3)||!getBits(i, 4))&&(getBits(i, 5)||!getBits(i, 6))))&&(((!getBits(i, 7)&&getBits(i, 8))||!getBits(i, 9))&&((getBits(i, 10)||!getBits(i, 11))&&(getBits(i, 12)&&!getBits(i, 13))))||(((getBits(i, 14)||getBits(i, 15))&&getBits(i, 16))&&((getBits(i, 17)||!getBits(i, 18))&&!getBits(i, 19))&&getBits(i, 20)));
    }
    break;
// Expression #13, Amount of variables: 39
case 13:
    for (long i = element; i < (((long) 1) << 39); i += maxCores) {
        result = result && (getBits(i, 0)==((!getBits(i, 1)||getBits(i, 2))||(!getBits(i, 3)&&(!getBits(i, 4)||!getBits(i, 5))))||((!(getBits(i, 0)||getBits(i, 6)))||(getBits(i, 7)||(getBits(i, 8)&&getBits(i, 9))))||((!(!getBits(i, 10)||getBits(i, 11)))||((getBits(i, 12)||getBits(i, 13))&&getBits(i, 14)))||((!(getBits(i, 15)&&getBits(i, 16)))||((!getBits(i, 17)&&!getBits(i, 18))||!getBits(i, 19)))||((!(getBits(i, 20)||getBits(i, 21)))||((getBits(i, 22)||getBits(i, 23))&&getBits(i, 24)))||((!(!getBits(i, 25)||getBits(i, 26)))||((getBits(i, 27)||getBits(i, 28))&&getBits(i, 29)))&&((!(getBits(i, 30)||getBits(i, 21)))||((getBits(i, 31)||getBits(i, 32))&&getBits(i, 33)))||((!(!getBits(i, 34)||getBits(i, 35)))||((getBits(i, 36)||getBits(i, 37))&&getBits(i, 38))));
    }
    break;
// Expression #14, Amount of variables: 45
case 14:
    for (long i = element; i < (((long) 1) << 45); i += maxCores) {
        result = result && (getBits(i, 0)==((!(getBits(i, 1)||getBits(i, 0)))||(!getBits(i, 2)&&(!getBits(i, 3)&&(!getBits(i, 4)||getBits(i, 5)))))||((!(getBits(i, 6)||(getBits(i, 7)&&getBits(i, 8))))||(getBits(i, 9)||(getBits(i, 10)&&getBits(i, 11))))||((!(!getBits(i, 12)||getBits(i, 13)))||((getBits(i, 14)||getBits(i, 15))&&(getBits(i, 16)||getBits(i, 17))))||((!(getBits(i, 18)||getBits(i, 19)))||((!getBits(i, 20)&&!getBits(i, 21))||!getBits(i, 22)))||((!(getBits(i, 23)&&(getBits(i, 24)||getBits(i, 25))))||((getBits(i, 26)||getBits(i, 27))&&getBits(i, 28)))||((!(!getBits(i, 29)||getBits(i, 30)))||((getBits(i, 31)||getBits(i, 32))&&(getBits(i, 33)||getBits(i, 34))))||((!(getBits(i, 35)||getBits(i, 36)))||((getBits(i, 37)&&getBits(i, 38))&&getBits(i, 39)))&&((getBits(i, 40)||!getBits(i, 41))&&(!getBits(i, 42)||(getBits(i, 43)&&getBits(i, 44)))));
    }
    break;
// Expression #15, Amount of variables: 50
case 15:
    for (long i = element; i < (((long) 1) << 50); i += maxCores) {
        result = result && (getBits(i, 0)==((!(getBits(i, 1)||getBits(i, 0)))&&(!getBits(i, 2)&&(!getBits(i, 3)&&(!getBits(i, 4)||getBits(i, 5)))))||((!(getBits(i, 6)||(getBits(i, 7)&&getBits(i, 8))))||(getBits(i, 9)||(getBits(i, 10)&&getBits(i, 11))))||((!(!getBits(i, 12)||getBits(i, 13)))||((getBits(i, 14)||getBits(i, 15))&&(getBits(i, 16)||getBits(i, 17))))&&((!(getBits(i, 18)||getBits(i, 19)))||((!getBits(i, 20)&&!getBits(i, 21))||!getBits(i, 22)))||((!(getBits(i, 23)&&(getBits(i, 24)||getBits(i, 25))))||((getBits(i, 26)||getBits(i, 27))&&getBits(i, 28)))||((!(!getBits(i, 29)||getBits(i, 30)))||((getBits(i, 31)||getBits(i, 32))&&(getBits(i, 33)||getBits(i, 34))))||((!(getBits(i, 35)||getBits(i, 36)))||((getBits(i, 37)&&getBits(i, 38))&&getBits(i, 39)))&&((getBits(i, 40)||!getBits(i, 41))&&(!getBits(i, 42)||(getBits(i, 43)&&getBits(i, 44))))||(getBits(i, 45)&&(getBits(i, 46)||(!getBits(i, 47)&&(!getBits(i, 48)||getBits(i, 49))))));
    }
    break;
// Expression #16, Amount of variables: 60
case 16:
    for (long i = element; i < (((long) 1) << 60); i += maxCores) {
        result = result && (getBits(i, 0)==((getBits(i, 0)&&getBits(i, 1))||((!getBits(i, 2)||!getBits(i, 3))&&!getBits(i, 4)))&&((getBits(i, 5)&&getBits(i, 6))||((!getBits(i, 7)&&!getBits(i, 8))||!getBits(i, 9)))&&((getBits(i, 10)&&getBits(i, 11))||((!getBits(i, 12)||!getBits(i, 13))&&!getBits(i, 14)))&&((getBits(i, 15)&&getBits(i, 16))||(!getBits(i, 17)&&(!getBits(i, 18)||!getBits(i, 19))))&&((getBits(i, 20)&&getBits(i, 21))||(!getBits(i, 22)||(!getBits(i, 23)&&!getBits(i, 24))))&&((getBits(i, 25)&&getBits(i, 26))||(!getBits(i, 27)||(getBits(i, 28)&&getBits(i, 29))))&&((getBits(i, 30)&&getBits(i, 31))||((!getBits(i, 32)||getBits(i, 33))&&!getBits(i, 34)))&&((getBits(i, 35)&&getBits(i, 36))||(getBits(i, 37)&&(getBits(i, 38)||!getBits(i, 39))))&&((getBits(i, 40)&&getBits(i, 41))||(!getBits(i, 42)&&!getBits(i, 43)&&!getBits(i, 44)))&&((getBits(i, 45)&&getBits(i, 46))||((!getBits(i, 47)||getBits(i, 48))&&!getBits(i, 49)))&&((getBits(i, 50)&&getBits(i, 51))||(!getBits(i, 52)&&!getBits(i, 53)&&!getBits(i, 54)))&&((getBits(i, 55)&&getBits(i, 56))||(!getBits(i, 57)&&(!getBits(i, 58)||!getBits(i, 59)))));
    }
    break;
// Expression #17, Amount of variables: 61
case 17:
    for (long i = element; i < (((long) 1) << 61); i += maxCores) {
        result = result && (getBits(i, 0)==((!(getBits(i, 0)&&getBits(i, 1)))||((!getBits(i, 2)||!getBits(i, 3))&&!getBits(i, 4)))||((!getBits(i, 5)&&getBits(i, 6))||(!getBits(i, 7)&&(!getBits(i, 8)||!getBits(i, 9))))&&((getBits(i, 10)&&getBits(i, 11))||(!getBits(i, 12)&&!getBits(i, 13)&&!getBits(i, 14)))&&((getBits(i, 15)&&getBits(i, 16))&&((!(getBits(i, 17)&&!getBits(i, 18)))&&!getBits(i, 19)))||((getBits(i, 20)&&getBits(i, 21))||(!getBits(i, 22)||(!getBits(i, 23)&&!getBits(i, 24))))&&((getBits(i, 25)&&getBits(i, 26))||((!getBits(i, 27)||!getBits(i, 28))&&!getBits(i, 29)))&&((getBits(i, 30)&&getBits(i, 31))||(!getBits(i, 32)&&!getBits(i, 33)&&!getBits(i, 34)))||((getBits(i, 35)&&!getBits(i, 36))||(getBits(i, 37)&&(getBits(i, 38)||getBits(i, 39))))&&((getBits(i, 40)&&getBits(i, 41))||(getBits(i, 42)&&(getBits(i, 43)&&!getBits(i, 44))))&&((!(getBits(i, 45)&&getBits(i, 46)))||((getBits(i, 47)&&getBits(i, 48))||!getBits(i, 49)))||((getBits(i, 50)&&getBits(i, 51))||(!getBits(i, 52)&&(getBits(i, 53)||!getBits(i, 54))))&&((getBits(i, 55)&&getBits(i, 56))||((getBits(i, 57)&&getBits(i, 58))||(getBits(i, 59)&&!getBits(i, 60)))));
    }
    break;
// Expression #18, Amount of variables: 60
case 18:
    for (long i = element; i < (((long) 1) << 60); i += maxCores) {
        result = result && (getBits(i, 0)==((!(getBits(i, 1)&&getBits(i, 0)))||((!getBits(i, 2)||!getBits(i, 3))&&!getBits(i, 4)))||((!getBits(i, 5)&&getBits(i, 6))||(!getBits(i, 7)||(!getBits(i, 8)&&!getBits(i, 9))))&&((getBits(i, 10)&&getBits(i, 11))||(!getBits(i, 12)&&!getBits(i, 13)&&!getBits(i, 14)))&&((getBits(i, 15)||getBits(i, 16))&&((!(getBits(i, 17)&&!getBits(i, 18)))&&!getBits(i, 19)))||((getBits(i, 20)&&getBits(i, 21))||(!getBits(i, 22)||(!getBits(i, 23)&&!getBits(i, 24))))&&((getBits(i, 25)&&getBits(i, 26))||((!getBits(i, 27)&&!getBits(i, 28))||!getBits(i, 29)))&&((getBits(i, 30)&&getBits(i, 31))||((!getBits(i, 32)&&!getBits(i, 33))&&!getBits(i, 34)))||((getBits(i, 35)&&!getBits(i, 36))||(getBits(i, 37)&&getBits(i, 38)&&getBits(i, 39)))&&((getBits(i, 40)&&getBits(i, 41))||(getBits(i, 42)&&(getBits(i, 43)&&!getBits(i, 44))))&&((!(getBits(i, 45)&&getBits(i, 46)))||((getBits(i, 47)&&getBits(i, 48))||!getBits(i, 49)))||((getBits(i, 50)&&getBits(i, 51))||(!getBits(i, 52)&&getBits(i, 53)&&!getBits(i, 54)))&&((getBits(i, 55)&&getBits(i, 56))||((getBits(i, 57)&&getBits(i, 58))||getBits(i, 59))));
    }
    break;
// Expression #19, Amount of variables: 62
case 19:
    for (long i = element; i < (((long) 1) << 62); i += maxCores) {
        result = result && (getBits(i, 0)==((!(getBits(i, 1)&&getBits(i, 0)))||(!getBits(i, 2)&&!getBits(i, 3)&&!getBits(i, 4)))||((!getBits(i, 5)&&getBits(i, 6))||(!getBits(i, 7)||(!getBits(i, 8)&&!getBits(i, 9))))&&((getBits(i, 10)&&getBits(i, 11))||((!getBits(i, 12)&&!getBits(i, 13))||!getBits(i, 14)))&&((getBits(i, 15)&&getBits(i, 16))&&((!(getBits(i, 17)&&!getBits(i, 18)))||!getBits(i, 19)))||((getBits(i, 20)&&getBits(i, 21))||(!getBits(i, 22)||(!getBits(i, 23)&&!getBits(i, 24))))&&((getBits(i, 25)&&getBits(i, 26))||((!getBits(i, 27)&&!getBits(i, 28))||!getBits(i, 29)))&&((getBits(i, 30)&&getBits(i, 31))||((!getBits(i, 32)||!getBits(i, 33))&&!getBits(i, 34)))||((getBits(i, 35)&&!getBits(i, 36))||(getBits(i, 37)||(getBits(i, 38)&&getBits(i, 39))))&&((getBits(i, 40)&&getBits(i, 41))||(getBits(i, 42)||(getBits(i, 43)&&!getBits(i, 44))))&&((!(getBits(i, 45)&&getBits(i, 46)))||((getBits(i, 47)&&getBits(i, 48))||!getBits(i, 49)))||((getBits(i, 50)&&getBits(i, 51))||(!getBits(i, 52)&&(getBits(i, 53)||!getBits(i, 54))))&&((getBits(i, 55)&&getBits(i, 56))||((getBits(i, 57)&&getBits(i, 58))||getBits(i, 59)))||(getBits(i, 60)&&(!getBits(i, 61))));
    }
    break;
// Expression #20, Amount of variables: 60
case 20:
    for (long i = element; i < (((long) 1) << 60); i += maxCores) {
        result = result && (getBits(i, 0)==((!(getBits(i, 1)||getBits(i, 2)))||((!getBits(i, 3)||!getBits(i, 4))&&!getBits(i, 0)))||((!getBits(i, 5)&&getBits(i, 6))||(!getBits(i, 7)||(!getBits(i, 8)&&!getBits(i, 9))))&&((getBits(i, 10)&&getBits(i, 11))||((!getBits(i, 12)&&!getBits(i, 13))||!getBits(i, 14)))&&((getBits(i, 15)||getBits(i, 16))&&((!(getBits(i, 17)&&!getBits(i, 18)))&&!getBits(i, 19)))||((getBits(i, 20)&&getBits(i, 21))||(!getBits(i, 22)||(!getBits(i, 23)&&!getBits(i, 24))))&&((getBits(i, 25)&&getBits(i, 26))||(!getBits(i, 27)&&!getBits(i, 28)))&&(((getBits(i, 29)||(getBits(i, 30)&&getBits(i, 31)))||((!getBits(i, 32)||!getBits(i, 33))&&!getBits(i, 34))))||((getBits(i, 35)&&!getBits(i, 36))||(getBits(i, 37)&&(getBits(i, 38)||getBits(i, 39))))&&((getBits(i, 40)&&getBits(i, 41))||(getBits(i, 42)||(getBits(i, 43)&&!getBits(i, 44))))&&((!(getBits(i, 45)&&getBits(i, 46)))||((getBits(i, 47)&&getBits(i, 48))||!getBits(i, 49)))||((getBits(i, 50)&&getBits(i, 51))||(!getBits(i, 52)||(getBits(i, 53)&&!getBits(i, 54))))&&((getBits(i, 55)&&getBits(i, 56))||((getBits(i, 57)&&getBits(i, 58))||getBits(i, 59))));
    }
    break;
// Expression #21, Amount of variables: 63
case 21:
    for (long i = element; i < (((long) 1) << 63); i += maxCores) {
        result = result && (getBits(i, 0)==((!(getBits(i, 1)&&getBits(i, 2)))||((!getBits(i, 3)||!getBits(i, 4))&&!getBits(i, 0)))||((!getBits(i, 5)&&getBits(i, 6))||(!getBits(i, 7)&&(!getBits(i, 8)||!getBits(i, 9))))&&((getBits(i, 10)&&getBits(i, 11))||((!getBits(i, 12)||!getBits(i, 13))&&!getBits(i, 14)))&&((getBits(i, 15)&&getBits(i, 16))&&((!(getBits(i, 17)&&!getBits(i, 18)))&&!getBits(i, 19)))||((getBits(i, 20)&&getBits(i, 21))||(!getBits(i, 22)||(!getBits(i, 23)&&!getBits(i, 24))))&&((getBits(i, 25)&&getBits(i, 26))||((!getBits(i, 27)||!getBits(i, 28))&&!getBits(i, 29)))&&((getBits(i, 30)&&getBits(i, 31))||((!getBits(i, 32)&&!getBits(i, 33))||!getBits(i, 34)))||((getBits(i, 35)&&!getBits(i, 36))||(getBits(i, 37)&&(getBits(i, 38)||getBits(i, 39))))&&((getBits(i, 40)&&getBits(i, 41))||(getBits(i, 42)&&(getBits(i, 43)||!getBits(i, 44))))&&((!(getBits(i, 45)&&getBits(i, 46)))||((getBits(i, 47)&&!getBits(i, 48))||!getBits(i, 49)))||((getBits(i, 50)&&getBits(i, 51))||(!getBits(i, 52)||(getBits(i, 53)&&!getBits(i, 54))))&&((getBits(i, 55)&&getBits(i, 56))||((getBits(i, 57)&&getBits(i, 58))||getBits(i, 59)))||((getBits(i, 60)&&!getBits(i, 61))||(!getBits(i, 62))));
    }
    break;
// Expression #22, Amount of variables: 2
case 22:
    for (long i = element; i < (((long) 1) << 2); i += maxCores) {
        result = result && (getBits(i, 0)||!getBits(i, 1));
    }
    break;
// Expression #23, Amount of variables: 4
case 23:
    for (long i = element; i < (((long) 1) << 4); i += maxCores) {
        result = result && (getBits(i, 0)&&!getBits(i, 1)||getBits(i, 2)||getBits(i, 3));
    }
    break;
// Expression #24, Amount of variables: 5
case 24:
    for (long i = element; i < (((long) 1) << 5); i += maxCores) {
        result = result && (getBits(i, 0)^getBits(i, 1)||getBits(i, 2)&&!getBits(i, 1)||getBits(i, 3)||getBits(i, 4));
    }
    break;
// Expression #25, Amount of variables: 8
case 25:
    for (long i = element; i < (((long) 1) << 8); i += maxCores) {
        result = result && (getBits(i, 0)||getBits(i, 1)||getBits(i, 2)&&getBits(i, 3)||getBits(i, 4)||getBits(i, 5)||getBits(i, 6)^!getBits(i, 7));
    }
    break;
// Expression #26, Amount of variables: 9
case 26:
    for (long i = element; i < (((long) 1) << 9); i += maxCores) {
        result = result && (getBits(i, 0)^getBits(i, 1)||getBits(i, 2)||getBits(i, 3)||getBits(i, 4)||getBits(i, 1)||getBits(i, 5)||getBits(i, 6)||getBits(i, 7)||!getBits(i, 8));
    }
    break;
// Expression #27, Amount of variables: 12
case 27:
    for (long i = element; i < (((long) 1) << 12); i += maxCores) {
        result = result && (getBits(i, 0)||!getBits(i, 1)||getBits(i, 2)&&getBits(i, 3)||getBits(i, 4)||getBits(i, 5)||getBits(i, 6)&&!getBits(i, 7)||getBits(i, 8)||getBits(i, 9)||getBits(i, 10)&&getBits(i, 11));
    }
    break;
// Expression #28, Amount of variables: 10
case 28:
    for (long i = element; i < (((long) 1) << 10); i += maxCores) {
        result = result && (getBits(i, 0)&&getBits(i, 1)||getBits(i, 2)&&getBits(i, 3)||getBits(i, 4)^!getBits(i, 5)||getBits(i, 6)||getBits(i, 7)||getBits(i, 8)||!getBits(i, 5)||getBits(i, 9)^getBits(i, 5)||getBits(i, 5)||getBits(i, 8));
    }
    break;
// Expression #29, Amount of variables: 12
case 29:
    for (long i = element; i < (((long) 1) << 12); i += maxCores) {
        result = result && (getBits(i, 0)||getBits(i, 1)||getBits(i, 2)^!getBits(i, 3)||getBits(i, 4)&&getBits(i, 5)||getBits(i, 6)^!getBits(i, 7)||getBits(i, 3)^getBits(i, 0)||getBits(i, 8)&&getBits(i, 9)||getBits(i, 0)||getBits(i, 10)||getBits(i, 11)&&getBits(i, 10));
    }
    break;
// Expression #30, Amount of variables: 16
case 30:
    for (long i = element; i < (((long) 1) << 16); i += maxCores) {
        result = result && (getBits(i, 0)&&getBits(i, 1)||getBits(i, 2)||getBits(i, 3)||getBits(i, 4)&&getBits(i, 3)||getBits(i, 5)&&getBits(i, 6)||getBits(i, 7)^getBits(i, 8)||getBits(i, 3)&&getBits(i, 9)||getBits(i, 10)||!getBits(i, 11)||getBits(i, 12)||getBits(i, 13)||getBits(i, 14)||getBits(i, 15));
    }
    break;
// Expression #31, Amount of variables: 18
case 31:
    for (long i = element; i < (((long) 1) << 18); i += maxCores) {
        result = result && (getBits(i, 0)&&getBits(i, 1)||getBits(i, 2)^getBits(i, 3)||getBits(i, 4)&&getBits(i, 5)||getBits(i, 6)||getBits(i, 7)||getBits(i, 8)&&getBits(i, 9)||getBits(i, 10)^getBits(i, 11)||getBits(i, 12)^getBits(i, 13)||getBits(i, 14)&&getBits(i, 15)||getBits(i, 16)&&!getBits(i, 0)||getBits(i, 16)||!getBits(i, 17));
    }
    break;
// Expression #32, Amount of variables: 18
case 32:
    for (long i = element; i < (((long) 1) << 18); i += maxCores) {
        result = result && (getBits(i, 0)&&getBits(i, 1)||getBits(i, 2)&&getBits(i, 3)||getBits(i, 4)||!getBits(i, 5)||getBits(i, 6)^getBits(i, 7)||getBits(i, 8)^!getBits(i, 9)||getBits(i, 10)&&!getBits(i, 11)||getBits(i, 4)^getBits(i, 12)||getBits(i, 13)&&getBits(i, 14)||getBits(i, 11)^!getBits(i, 10)||getBits(i, 15)^getBits(i, 16)||getBits(i, 17)&&getBits(i, 7));
    }
    break;
// Expression #33, Amount of variables: 21
case 33:
    for (long i = element; i < (((long) 1) << 21); i += maxCores) {
        result = result && (getBits(i, 0)^getBits(i, 1)||getBits(i, 2)&&getBits(i, 3)||getBits(i, 4)||getBits(i, 5)||getBits(i, 6)&&getBits(i, 0)||getBits(i, 7)&&getBits(i, 8)||getBits(i, 9)||getBits(i, 10)||getBits(i, 11)&&getBits(i, 12)||getBits(i, 13)||getBits(i, 14)||getBits(i, 15)||getBits(i, 16)||getBits(i, 17)&&getBits(i, 18)||getBits(i, 19)^getBits(i, 2)||getBits(i, 5)^getBits(i, 20));
    }
    break;
// Expression #34, Amount of variables: 24
case 34:
    for (long i = element; i < (((long) 1) << 24); i += maxCores) {
        result = result && (getBits(i, 0)^getBits(i, 1)||getBits(i, 2)||getBits(i, 3)||getBits(i, 4)^getBits(i, 5)||getBits(i, 6)&&getBits(i, 7)||getBits(i, 8)^getBits(i, 9)||getBits(i, 10)^!getBits(i, 11)||getBits(i, 12)&&getBits(i, 13)||getBits(i, 14)&&getBits(i, 15)||getBits(i, 16)&&getBits(i, 17)||getBits(i, 18)||getBits(i, 5)||getBits(i, 19)||getBits(i, 20)||getBits(i, 21)^!getBits(i, 22)||getBits(i, 23)^getBits(i, 15));
    }
    break;
// Expression #35, Amount of variables: 26
case 35:
    for (long i = element; i < (((long) 1) << 26); i += maxCores) {
        result = result && (getBits(i, 0)&&getBits(i, 1)||getBits(i, 2)^getBits(i, 3)||getBits(i, 4)^getBits(i, 5)||getBits(i, 6)||getBits(i, 7)||getBits(i, 8)&&!getBits(i, 9)||getBits(i, 10)||getBits(i, 11)||getBits(i, 12)^!getBits(i, 13)||getBits(i, 14)&&getBits(i, 15)||getBits(i, 16)||getBits(i, 8)||getBits(i, 17)&&getBits(i, 18)||getBits(i, 19)||getBits(i, 20)||getBits(i, 15)^!getBits(i, 21)||getBits(i, 22)||!getBits(i, 23)||getBits(i, 24)&&getBits(i, 25));
    }
    break;
// Expression #36, Amount of variables: 28
case 36:
    for (long i = element; i < (((long) 1) << 28); i += maxCores) {
        result = result && (getBits(i, 0)^!getBits(i, 1)||getBits(i, 2)^getBits(i, 3)||getBits(i, 4)||getBits(i, 5)||getBits(i, 6)^getBits(i, 7)||getBits(i, 8)||getBits(i, 9)||getBits(i, 10)||!getBits(i, 11)||getBits(i, 3)^getBits(i, 12)||getBits(i, 13)&&!getBits(i, 14)||getBits(i, 15)^getBits(i, 16)||getBits(i, 17)^getBits(i, 12)||getBits(i, 18)||getBits(i, 19)||getBits(i, 20)^!getBits(i, 21)||getBits(i, 22)^getBits(i, 23)||getBits(i, 24)||getBits(i, 25)||getBits(i, 26)^getBits(i, 27));
    }
    break;
// Expression #37, Amount of variables: 29
case 37:
    for (long i = element; i < (((long) 1) << 29); i += maxCores) {
        result = result && (getBits(i, 0)&&getBits(i, 1)||getBits(i, 2)^getBits(i, 3)||getBits(i, 4)||getBits(i, 5)||getBits(i, 6)||!getBits(i, 7)||getBits(i, 1)&&getBits(i, 8)||getBits(i, 9)||!getBits(i, 10)||getBits(i, 11)^!getBits(i, 12)||getBits(i, 13)&&getBits(i, 14)||getBits(i, 12)&&!getBits(i, 15)||getBits(i, 16)&&!getBits(i, 17)||getBits(i, 18)^getBits(i, 19)||getBits(i, 20)^getBits(i, 21)||getBits(i, 22)&&getBits(i, 23)||getBits(i, 24)||getBits(i, 25)||getBits(i, 26)&&getBits(i, 27)||getBits(i, 15)^getBits(i, 28));
    }
    break;
// Expression #38, Amount of variables: 27
case 38:
    for (long i = element; i < (((long) 1) << 27); i += maxCores) {
        result = result && (getBits(i, 0)||getBits(i, 1)||getBits(i, 2)&&getBits(i, 3)||getBits(i, 4)||!getBits(i, 5)||getBits(i, 6)^!getBits(i, 7)||getBits(i, 8)^!getBits(i, 9)||getBits(i, 10)&&!getBits(i, 11)||getBits(i, 1)^getBits(i, 12)||getBits(i, 13)&&getBits(i, 14)||getBits(i, 14)^getBits(i, 15)||getBits(i, 16)||!getBits(i, 6)||getBits(i, 4)^getBits(i, 17)||getBits(i, 18)||!getBits(i, 19)||getBits(i, 7)||!getBits(i, 20)||getBits(i, 21)&&getBits(i, 9)||getBits(i, 22)^getBits(i, 23)||getBits(i, 9)&&getBits(i, 24)||getBits(i, 25)^!getBits(i, 26));
    }
    break;
// Expression #39, Amount of variables: 29
case 39:
    for (long i = element; i < (((long) 1) << 29); i += maxCores) {
        result = result && (getBits(i, 0)&&!getBits(i, 1)||getBits(i, 2)||getBits(i, 3)||getBits(i, 4)^!getBits(i, 5)||getBits(i, 6)&&getBits(i, 7)||getBits(i, 8)&&!getBits(i, 0)||getBits(i, 9)||getBits(i, 10)||getBits(i, 11)&&getBits(i, 12)||getBits(i, 13)&&getBits(i, 2)||getBits(i, 14)&&getBits(i, 15)||getBits(i, 16)^getBits(i, 5)||getBits(i, 17)&&getBits(i, 18)||getBits(i, 19)||getBits(i, 20)||getBits(i, 21)||!getBits(i, 18)||getBits(i, 8)^getBits(i, 22)||getBits(i, 23)&&getBits(i, 3)||getBits(i, 24)^getBits(i, 25)||getBits(i, 26)||!getBits(i, 27)||getBits(i, 28)^!getBits(i, 4));
    }
    break;
// Expression #40, Amount of variables: 31
case 40:
    for (long i = element; i < (((long) 1) << 31); i += maxCores) {
        result = result && (getBits(i, 0)&&getBits(i, 1)||getBits(i, 2)||getBits(i, 3)||getBits(i, 4)&&getBits(i, 5)||getBits(i, 6)^getBits(i, 7)||getBits(i, 8)^getBits(i, 3)||getBits(i, 9)&&!getBits(i, 10)||getBits(i, 11)||getBits(i, 12)||getBits(i, 13)&&!getBits(i, 14)||getBits(i, 15)||getBits(i, 16)||getBits(i, 1)||getBits(i, 7)||getBits(i, 14)^!getBits(i, 7)||getBits(i, 17)^getBits(i, 18)||getBits(i, 19)^getBits(i, 20)||getBits(i, 21)^getBits(i, 22)||getBits(i, 9)||!getBits(i, 23)||getBits(i, 24)&&!getBits(i, 25)||getBits(i, 26)||!getBits(i, 27)||getBits(i, 28)||getBits(i, 12)||getBits(i, 29)^!getBits(i, 30));
    }
    break;
// Expression #41, Amount of variables: 34
case 41:
    for (long i = element; i < (((long) 1) << 34); i += maxCores) {
        result = result && (getBits(i, 0)&&getBits(i, 1)||getBits(i, 2)&&getBits(i, 3)||getBits(i, 4)||!getBits(i, 5)||getBits(i, 6)&&getBits(i, 7)||getBits(i, 4)&&getBits(i, 8)||getBits(i, 9)||getBits(i, 10)||getBits(i, 11)^getBits(i, 12)||getBits(i, 13)^getBits(i, 14)||getBits(i, 15)^!getBits(i, 15)||getBits(i, 16)&&!getBits(i, 17)||getBits(i, 18)&&getBits(i, 19)||getBits(i, 20)^getBits(i, 21)||getBits(i, 22)^getBits(i, 23)||getBits(i, 14)||getBits(i, 24)||getBits(i, 19)^getBits(i, 25)||getBits(i, 26)^!getBits(i, 27)||getBits(i, 28)&&!getBits(i, 29)||getBits(i, 5)^getBits(i, 30)||getBits(i, 31)||!getBits(i, 32)||getBits(i, 31)||getBits(i, 33));
    }
    break;
// Expression #42, Amount of variables: 35
case 42:
    for (long i = element; i < (((long) 1) << 35); i += maxCores) {
        result = result && (getBits(i, 0)&&getBits(i, 1)||getBits(i, 2)&&getBits(i, 3)||getBits(i, 4)^!getBits(i, 5)||getBits(i, 6)^!getBits(i, 7)||getBits(i, 8)^getBits(i, 9)||getBits(i, 10)&&getBits(i, 11)||getBits(i, 12)^!getBits(i, 13)||getBits(i, 14)&&getBits(i, 11)||getBits(i, 15)&&getBits(i, 13)||getBits(i, 16)||getBits(i, 17)||getBits(i, 18)&&getBits(i, 19)||getBits(i, 20)^getBits(i, 21)||getBits(i, 22)&&getBits(i, 23)||getBits(i, 24)^!getBits(i, 1)||getBits(i, 25)||getBits(i, 9)||getBits(i, 26)&&getBits(i, 27)||getBits(i, 28)||!getBits(i, 29)||getBits(i, 30)&&getBits(i, 31)||getBits(i, 13)&&getBits(i, 7)||getBits(i, 8)||!getBits(i, 32)||getBits(i, 33)&&getBits(i, 34));
    }
    break;
// Expression #43, Amount of variables: 36
case 43:
    for (long i = element; i < (((long) 1) << 36); i += maxCores) {
        result = result && (getBits(i, 0)||getBits(i, 1)||getBits(i, 2)^!getBits(i, 3)||getBits(i, 4)^getBits(i, 5)||getBits(i, 6)||getBits(i, 7)||getBits(i, 8)^getBits(i, 9)||getBits(i, 10)&&getBits(i, 11)||getBits(i, 12)||getBits(i, 13)||getBits(i, 14)&&!getBits(i, 15)||getBits(i, 16)^getBits(i, 17)||getBits(i, 18)&&getBits(i, 0)||getBits(i, 19)&&getBits(i, 20)||getBits(i, 21)^getBits(i, 22)||getBits(i, 23)^getBits(i, 0)||getBits(i, 24)||!getBits(i, 25)||getBits(i, 22)&&getBits(i, 26)||getBits(i, 14)^getBits(i, 27)||getBits(i, 28)^getBits(i, 9)||getBits(i, 29)^getBits(i, 30)||getBits(i, 31)||!getBits(i, 32)||getBits(i, 33)&&!getBits(i, 1)||getBits(i, 5)||getBits(i, 17)||getBits(i, 34)&&getBits(i, 35));
    }
    break;
// Expression #44, Amount of variables: 40
case 44:
    for (long i = element; i < (((long) 1) << 40); i += maxCores) {
        result = result && (getBits(i, 0)||!getBits(i, 1)||getBits(i, 2)||getBits(i, 3)||getBits(i, 4)^getBits(i, 5)||getBits(i, 6)||!getBits(i, 7)||getBits(i, 8)^getBits(i, 2)||getBits(i, 2)||getBits(i, 9)||getBits(i, 10)^getBits(i, 11)||getBits(i, 12)||getBits(i, 11)||getBits(i, 13)&&getBits(i, 14)||getBits(i, 15)&&getBits(i, 16)||getBits(i, 17)||!getBits(i, 18)||getBits(i, 19)&&getBits(i, 20)||getBits(i, 21)^getBits(i, 22)||getBits(i, 23)&&getBits(i, 20)||getBits(i, 24)||getBits(i, 25)||getBits(i, 26)^getBits(i, 27)||getBits(i, 28)||!getBits(i, 14)||getBits(i, 29)||getBits(i, 30)||getBits(i, 31)||getBits(i, 32)||getBits(i, 33)^!getBits(i, 34)||getBits(i, 35)^getBits(i, 36)||getBits(i, 37)&&!getBits(i, 38)||getBits(i, 4)||getBits(i, 39));
    }
    break;
// Expression #45, Amount of variables: 39
case 45:
    for (long i = element; i < (((long) 1) << 39); i += maxCores) {
        result = result && (getBits(i, 0)^getBits(i, 1)||getBits(i, 2)^getBits(i, 3)||getBits(i, 4)^getBits(i, 5)||getBits(i, 6)&&getBits(i, 7)||getBits(i, 8)||getBits(i, 9)||getBits(i, 10)^!getBits(i, 11)||getBits(i, 12)^!getBits(i, 13)||getBits(i, 14)^!getBits(i, 15)||getBits(i, 16)^getBits(i, 17)||getBits(i, 18)||getBits(i, 19)||getBits(i, 20)&&getBits(i, 21)||getBits(i, 22)||getBits(i, 23)||getBits(i, 24)||getBits(i, 7)||getBits(i, 25)||!getBits(i, 26)||getBits(i, 27)||getBits(i, 28)||getBits(i, 12)||getBits(i, 29)||getBits(i, 19)^!getBits(i, 30)||getBits(i, 31)^!getBits(i, 1)||getBits(i, 32)&&!getBits(i, 15)||getBits(i, 33)||!getBits(i, 34)||getBits(i, 35)||getBits(i, 1)||getBits(i, 36)||getBits(i, 37)||getBits(i, 37)||getBits(i, 5)||getBits(i, 11)^getBits(i, 38));
    }
    break;
// Expression #46, Amount of variables: 42
case 46:
    for (long i = element; i < (((long) 1) << 42); i += maxCores) {
        result = result && (getBits(i, 0)&&!getBits(i, 1)||getBits(i, 2)^!getBits(i, 3)||getBits(i, 4)||getBits(i, 5)||getBits(i, 6)^getBits(i, 7)||getBits(i, 8)^getBits(i, 9)||getBits(i, 10)&&getBits(i, 11)||getBits(i, 12)||getBits(i, 13)||getBits(i, 14)&&!getBits(i, 13)||getBits(i, 15)||!getBits(i, 16)||getBits(i, 17)&&!getBits(i, 18)||getBits(i, 19)||getBits(i, 20)||getBits(i, 21)||getBits(i, 22)||getBits(i, 23)&&getBits(i, 24)||getBits(i, 25)&&getBits(i, 26)||getBits(i, 27)||getBits(i, 28)||getBits(i, 6)&&getBits(i, 29)||getBits(i, 30)^getBits(i, 31)||getBits(i, 32)||getBits(i, 2)||getBits(i, 24)^!getBits(i, 33)||getBits(i, 34)||getBits(i, 6)||getBits(i, 35)^getBits(i, 36)||getBits(i, 37)||getBits(i, 38)||getBits(i, 39)&&getBits(i, 29)||getBits(i, 1)^!getBits(i, 20)||getBits(i, 40)&&getBits(i, 41));
    }
    break;
// Expression #47, Amount of variables: 43
case 47:
    for (long i = element; i < (((long) 1) << 43); i += maxCores) {
        result = result && (getBits(i, 0)&&getBits(i, 1)||getBits(i, 2)^!getBits(i, 3)||getBits(i, 4)&&!getBits(i, 5)||getBits(i, 6)&&getBits(i, 7)||getBits(i, 8)^getBits(i, 9)||getBits(i, 10)^getBits(i, 11)||getBits(i, 12)||getBits(i, 13)||getBits(i, 14)^getBits(i, 15)||getBits(i, 16)||getBits(i, 17)||getBits(i, 18)^!getBits(i, 19)||getBits(i, 20)||!getBits(i, 1)||getBits(i, 21)^getBits(i, 22)||getBits(i, 23)^!getBits(i, 24)||getBits(i, 25)||getBits(i, 26)||getBits(i, 27)&&getBits(i, 28)||getBits(i, 28)||getBits(i, 29)||getBits(i, 2)^getBits(i, 5)||getBits(i, 30)^!getBits(i, 29)||getBits(i, 31)||!getBits(i, 32)||getBits(i, 33)&&getBits(i, 34)||getBits(i, 35)||getBits(i, 2)||getBits(i, 5)||getBits(i, 5)||getBits(i, 36)||getBits(i, 37)||getBits(i, 38)||!getBits(i, 39)||getBits(i, 40)||getBits(i, 41)||getBits(i, 42)&&getBits(i, 29));
    }
    break;
// Expression #48, Amount of variables: 43
case 48:
    for (long i = element; i < (((long) 1) << 43); i += maxCores) {
        result = result && (getBits(i, 0)||getBits(i, 1)||getBits(i, 2)&&!getBits(i, 3)||getBits(i, 4)^getBits(i, 5)||getBits(i, 5)^!getBits(i, 6)||getBits(i, 7)^getBits(i, 8)||getBits(i, 9)^!getBits(i, 10)||getBits(i, 11)||getBits(i, 9)||getBits(i, 12)&&getBits(i, 13)||getBits(i, 14)&&!getBits(i, 15)||getBits(i, 16)&&getBits(i, 17)||getBits(i, 18)^getBits(i, 9)||getBits(i, 19)&&!getBits(i, 20)||getBits(i, 21)&&getBits(i, 22)||getBits(i, 23)&&getBits(i, 24)||getBits(i, 25)||!getBits(i, 26)||getBits(i, 27)&&getBits(i, 28)||getBits(i, 14)||!getBits(i, 15)||getBits(i, 9)||getBits(i, 29)||getBits(i, 30)^getBits(i, 24)||getBits(i, 31)&&getBits(i, 19)||getBits(i, 32)&&getBits(i, 33)||getBits(i, 3)&&!getBits(i, 24)||getBits(i, 34)||getBits(i, 35)||getBits(i, 36)&&getBits(i, 26)||getBits(i, 37)&&getBits(i, 38)||getBits(i, 39)||!getBits(i, 40)||getBits(i, 41)&&!getBits(i, 42));
    }
    break;
// Expression #49, Amount of variables: 41
case 49:
    for (long i = element; i < (((long) 1) << 41); i += maxCores) {
        result = result && (getBits(i, 0)&&getBits(i, 1)||getBits(i, 2)&&!getBits(i, 3)||getBits(i, 4)^!getBits(i, 5)||getBits(i, 6)&&getBits(i, 7)||getBits(i, 8)&&getBits(i, 9)||getBits(i, 10)^!getBits(i, 11)||getBits(i, 12)&&getBits(i, 13)||getBits(i, 14)&&getBits(i, 15)||getBits(i, 16)^getBits(i, 17)||getBits(i, 18)||getBits(i, 0)||getBits(i, 19)^getBits(i, 20)||getBits(i, 13)||getBits(i, 20)||getBits(i, 9)^getBits(i, 21)||getBits(i, 22)^getBits(i, 17)||getBits(i, 23)^getBits(i, 24)||getBits(i, 25)&&getBits(i, 26)||getBits(i, 27)&&getBits(i, 28)||getBits(i, 24)||getBits(i, 3)||getBits(i, 4)^getBits(i, 29)||getBits(i, 30)^getBits(i, 31)||getBits(i, 8)||getBits(i, 32)||getBits(i, 33)^getBits(i, 0)||getBits(i, 15)&&!getBits(i, 20)||getBits(i, 34)^getBits(i, 35)||getBits(i, 15)^getBits(i, 36)||getBits(i, 37)||getBits(i, 38)||getBits(i, 2)^!getBits(i, 39)||getBits(i, 15)&&getBits(i, 40));
    }
    break;
// Expression #50, Amount of variables: 40
case 50:
    for (long i = element; i < (((long) 1) << 40); i += maxCores) {
        result = result && (getBits(i, 0)^getBits(i, 1)||getBits(i, 0)||!getBits(i, 2)||getBits(i, 3)||getBits(i, 4)||getBits(i, 5)&&getBits(i, 6)||getBits(i, 7)&&getBits(i, 8)||getBits(i, 9)&&getBits(i, 10)||getBits(i, 11)&&!getBits(i, 12)||getBits(i, 13)||getBits(i, 2)||getBits(i, 14)||getBits(i, 1)||getBits(i, 0)||!getBits(i, 15)||getBits(i, 11)^getBits(i, 16)||getBits(i, 17)&&!getBits(i, 18)||getBits(i, 19)^getBits(i, 20)||getBits(i, 12)||getBits(i, 20)||getBits(i, 0)||getBits(i, 16)||getBits(i, 21)&&!getBits(i, 4)||getBits(i, 6)^getBits(i, 20)||getBits(i, 1)^getBits(i, 22)||getBits(i, 23)&&getBits(i, 4)||getBits(i, 4)^!getBits(i, 24)||getBits(i, 25)^getBits(i, 26)||getBits(i, 27)&&getBits(i, 28)||getBits(i, 29)&&getBits(i, 16)||getBits(i, 30)&&getBits(i, 31)||getBits(i, 32)||getBits(i, 33)||getBits(i, 22)||getBits(i, 34)||getBits(i, 35)||getBits(i, 36)||getBits(i, 37)^getBits(i, 17)||getBits(i, 38)&&getBits(i, 39));
    }
    break;
// Expression #51, Amount of variables: 51
case 51:
    for (long i = element; i < (((long) 1) << 51); i += maxCores) {
        result = result && (getBits(i, 0)^!getBits(i, 1)||getBits(i, 2)||getBits(i, 3)||getBits(i, 4)&&getBits(i, 5)||getBits(i, 6)||getBits(i, 7)||getBits(i, 8)^getBits(i, 9)||getBits(i, 10)&&getBits(i, 11)||getBits(i, 12)&&!getBits(i, 13)||getBits(i, 14)^getBits(i, 15)||getBits(i, 16)^!getBits(i, 17)||getBits(i, 18)||getBits(i, 19)||getBits(i, 3)&&!getBits(i, 20)||getBits(i, 21)&&getBits(i, 22)||getBits(i, 23)&&getBits(i, 11)||getBits(i, 24)&&getBits(i, 25)||getBits(i, 26)||getBits(i, 27)||getBits(i, 28)||getBits(i, 29)||getBits(i, 12)||!getBits(i, 30)||getBits(i, 31)&&getBits(i, 5)||getBits(i, 32)||getBits(i, 33)||getBits(i, 34)&&getBits(i, 11)||getBits(i, 35)||getBits(i, 36)||getBits(i, 37)^getBits(i, 38)||getBits(i, 25)||getBits(i, 39)||getBits(i, 40)||getBits(i, 41)||getBits(i, 42)&&getBits(i, 43)||getBits(i, 44)^!getBits(i, 45)||getBits(i, 46)^getBits(i, 38)||getBits(i, 47)^getBits(i, 48)||getBits(i, 49)||getBits(i, 50)||getBits(i, 1)^!getBits(i, 50));
    }
    break;
// Expression #52, Amount of variables: 52
case 52:
    for (long i = element; i < (((long) 1) << 52); i += maxCores) {
        result = result && (getBits(i, 0)^getBits(i, 1)||getBits(i, 2)^getBits(i, 3)||getBits(i, 4)&&!getBits(i, 5)||getBits(i, 6)&&!getBits(i, 7)||getBits(i, 8)&&getBits(i, 9)||getBits(i, 10)&&getBits(i, 11)||getBits(i, 12)^getBits(i, 13)||getBits(i, 14)^getBits(i, 3)||getBits(i, 15)||getBits(i, 16)||getBits(i, 17)^getBits(i, 18)||getBits(i, 19)^getBits(i, 20)||getBits(i, 21)||getBits(i, 22)||getBits(i, 22)||getBits(i, 23)||getBits(i, 24)||!getBits(i, 25)||getBits(i, 26)||!getBits(i, 27)||getBits(i, 28)^getBits(i, 16)||getBits(i, 29)^!getBits(i, 30)||getBits(i, 31)||getBits(i, 32)||getBits(i, 33)||!getBits(i, 34)||getBits(i, 35)^getBits(i, 36)||getBits(i, 36)||!getBits(i, 37)||getBits(i, 38)&&getBits(i, 39)||getBits(i, 40)||getBits(i, 30)||getBits(i, 33)||getBits(i, 18)||getBits(i, 41)||getBits(i, 42)||getBits(i, 7)&&getBits(i, 43)||getBits(i, 44)^getBits(i, 45)||getBits(i, 46)&&getBits(i, 47)||getBits(i, 42)||getBits(i, 48)||getBits(i, 18)||getBits(i, 49)||getBits(i, 50)||getBits(i, 51));
    }
    break;
// Expression #53, Amount of variables: 54
case 53:
    for (long i = element; i < (((long) 1) << 54); i += maxCores) {
        result = result && (getBits(i, 0)||getBits(i, 1)||getBits(i, 2)&&getBits(i, 3)||getBits(i, 4)^!getBits(i, 5)||getBits(i, 3)&&getBits(i, 6)||getBits(i, 7)&&getBits(i, 8)||getBits(i, 9)||getBits(i, 10)||getBits(i, 11)^getBits(i, 12)||getBits(i, 13)||getBits(i, 10)||getBits(i, 14)^getBits(i, 15)||getBits(i, 16)^getBits(i, 17)||getBits(i, 18)^getBits(i, 19)||getBits(i, 4)^getBits(i, 20)||getBits(i, 21)&&getBits(i, 20)||getBits(i, 22)^getBits(i, 23)||getBits(i, 24)||getBits(i, 25)||getBits(i, 26)^getBits(i, 27)||getBits(i, 28)||getBits(i, 17)||getBits(i, 29)^!getBits(i, 30)||getBits(i, 31)&&!getBits(i, 32)||getBits(i, 31)^getBits(i, 33)||getBits(i, 34)^getBits(i, 35)||getBits(i, 36)&&!getBits(i, 37)||getBits(i, 38)&&!getBits(i, 39)||getBits(i, 40)&&getBits(i, 41)||getBits(i, 42)^getBits(i, 43)||getBits(i, 44)||!getBits(i, 45)||getBits(i, 8)||getBits(i, 46)||getBits(i, 47)^!getBits(i, 48)||getBits(i, 47)&&getBits(i, 49)||getBits(i, 43)&&getBits(i, 50)||getBits(i, 51)^getBits(i, 52)||getBits(i, 15)&&getBits(i, 53));
    }
    break;
// Expression #54, Amount of variables: 47
case 54:
    for (long i = element; i < (((long) 1) << 47); i += maxCores) {
        result = result && (getBits(i, 0)^getBits(i, 1)||getBits(i, 2)||getBits(i, 3)||getBits(i, 4)||getBits(i, 5)||getBits(i, 6)||!getBits(i, 7)||getBits(i, 8)||getBits(i, 9)||getBits(i, 10)&&!getBits(i, 11)||getBits(i, 12)^getBits(i, 13)||getBits(i, 14)&&getBits(i, 15)||getBits(i, 16)||!getBits(i, 17)||getBits(i, 18)&&getBits(i, 19)||getBits(i, 20)&&getBits(i, 21)||getBits(i, 22)^getBits(i, 23)||getBits(i, 24)||!getBits(i, 15)||getBits(i, 19)&&getBits(i, 25)||getBits(i, 26)^getBits(i, 27)||getBits(i, 28)&&getBits(i, 24)||getBits(i, 29)&&getBits(i, 30)||getBits(i, 7)&&getBits(i, 17)||getBits(i, 31)||getBits(i, 30)||getBits(i, 32)^!getBits(i, 33)||getBits(i, 34)||getBits(i, 35)||getBits(i, 15)||!getBits(i, 36)||getBits(i, 15)||!getBits(i, 37)||getBits(i, 38)&&!getBits(i, 38)||getBits(i, 39)&&getBits(i, 7)||getBits(i, 5)^getBits(i, 40)||getBits(i, 24)^getBits(i, 41)||getBits(i, 42)^getBits(i, 24)||getBits(i, 32)&&getBits(i, 19)||getBits(i, 43)^getBits(i, 44)||getBits(i, 3)&&!getBits(i, 10)||getBits(i, 44)||!getBits(i, 45)||getBits(i, 23)^getBits(i, 46));
    }
    break;
// Expression #55, Amount of variables: 55
case 55:
    for (long i = element; i < (((long) 1) << 55); i += maxCores) {
        result = result && (getBits(i, 0)||getBits(i, 1)||getBits(i, 2)||!getBits(i, 3)||getBits(i, 4)&&getBits(i, 5)||getBits(i, 6)^getBits(i, 7)||getBits(i, 3)^!getBits(i, 8)||getBits(i, 9)||getBits(i, 10)||getBits(i, 11)||getBits(i, 12)||getBits(i, 13)||getBits(i, 14)||getBits(i, 15)&&getBits(i, 16)||getBits(i, 17)^getBits(i, 18)||getBits(i, 19)^getBits(i, 20)||getBits(i, 21)&&getBits(i, 22)||getBits(i, 22)&&getBits(i, 23)||getBits(i, 24)^getBits(i, 25)||getBits(i, 26)^getBits(i, 27)||getBits(i, 5)||getBits(i, 28)||getBits(i, 7)||getBits(i, 29)||getBits(i, 30)^getBits(i, 31)||getBits(i, 32)&&getBits(i, 26)||getBits(i, 33)^getBits(i, 34)||getBits(i, 35)||getBits(i, 36)||getBits(i, 37)^getBits(i, 38)||getBits(i, 39)^getBits(i, 40)||getBits(i, 41)&&getBits(i, 42)||getBits(i, 43)||!getBits(i, 44)||getBits(i, 45)||getBits(i, 46)||getBits(i, 47)^getBits(i, 21)||getBits(i, 2)^getBits(i, 48)||getBits(i, 49)||getBits(i, 50)||getBits(i, 51)^getBits(i, 23)||getBits(i, 48)&&!getBits(i, 44)||getBits(i, 52)&&getBits(i, 53)||getBits(i, 54)||getBits(i, 8)||getBits(i, 21)||getBits(i, 25));
    }
    break;
// Expression #56, Amount of variables: 60
case 56:
    for (long i = element; i < (((long) 1) << 60); i += maxCores) {
        result = result && (getBits(i, 0)&&!getBits(i, 0)||getBits(i, 1)||getBits(i, 2)||getBits(i, 3)||getBits(i, 4)||getBits(i, 5)||!getBits(i, 6)||getBits(i, 7)||getBits(i, 8)||getBits(i, 9)^getBits(i, 10)||getBits(i, 11)&&getBits(i, 12)||getBits(i, 7)^!getBits(i, 13)||getBits(i, 14)||getBits(i, 15)||getBits(i, 16)^getBits(i, 17)||getBits(i, 18)&&getBits(i, 19)||getBits(i, 20)^getBits(i, 21)||getBits(i, 22)||!getBits(i, 23)||getBits(i, 24)||getBits(i, 22)||getBits(i, 25)^!getBits(i, 26)||getBits(i, 27)&&getBits(i, 28)||getBits(i, 29)^!getBits(i, 30)||getBits(i, 31)||getBits(i, 32)||getBits(i, 33)||getBits(i, 34)||getBits(i, 35)&&getBits(i, 36)||getBits(i, 37)&&getBits(i, 38)||getBits(i, 39)^getBits(i, 21)||getBits(i, 40)^getBits(i, 41)||getBits(i, 42)^getBits(i, 43)||getBits(i, 19)||!getBits(i, 44)||getBits(i, 45)&&getBits(i, 46)||getBits(i, 47)&&getBits(i, 48)||getBits(i, 49)||getBits(i, 43)||getBits(i, 0)^getBits(i, 50)||getBits(i, 51)^getBits(i, 52)||getBits(i, 53)&&getBits(i, 54)||getBits(i, 50)^getBits(i, 12)||getBits(i, 55)&&getBits(i, 56)||getBits(i, 57)&&getBits(i, 58)||getBits(i, 44)&&getBits(i, 59));
    }
    break;
// Expression #57, Amount of variables: 57
case 57:
    for (long i = element; i < (((long) 1) << 57); i += maxCores) {
        result = result && (getBits(i, 0)&&getBits(i, 1)||getBits(i, 2)&&getBits(i, 3)||getBits(i, 4)&&getBits(i, 5)||getBits(i, 6)||getBits(i, 7)||getBits(i, 8)||getBits(i, 9)||getBits(i, 7)||getBits(i, 10)||getBits(i, 11)^getBits(i, 12)||getBits(i, 9)&&getBits(i, 13)||getBits(i, 14)^getBits(i, 15)||getBits(i, 16)^!getBits(i, 17)||getBits(i, 18)&&getBits(i, 19)||getBits(i, 20)||!getBits(i, 21)||getBits(i, 22)^getBits(i, 23)||getBits(i, 24)^getBits(i, 25)||getBits(i, 3)||getBits(i, 16)||getBits(i, 26)^getBits(i, 27)||getBits(i, 28)||getBits(i, 16)||getBits(i, 15)^!getBits(i, 12)||getBits(i, 29)||getBits(i, 12)||getBits(i, 30)&&getBits(i, 31)||getBits(i, 32)&&!getBits(i, 33)||getBits(i, 34)^!getBits(i, 31)||getBits(i, 35)&&getBits(i, 12)||getBits(i, 25)&&!getBits(i, 36)||getBits(i, 37)||getBits(i, 12)||getBits(i, 38)||getBits(i, 39)||getBits(i, 40)&&getBits(i, 15)||getBits(i, 41)||!getBits(i, 42)||getBits(i, 43)||getBits(i, 44)||getBits(i, 12)||getBits(i, 45)||getBits(i, 42)&&getBits(i, 46)||getBits(i, 47)&&getBits(i, 48)||getBits(i, 49)||getBits(i, 50)||getBits(i, 51)||!getBits(i, 52)||getBits(i, 53)||getBits(i, 54)||getBits(i, 55)||getBits(i, 56));
    }
    break;
// Expression #58, Amount of variables: 58
case 58:
    for (long i = element; i < (((long) 1) << 58); i += maxCores) {
        result = result && (getBits(i, 0)&&getBits(i, 1)||getBits(i, 2)&&getBits(i, 3)||getBits(i, 4)||getBits(i, 5)||getBits(i, 6)||getBits(i, 7)||getBits(i, 8)||getBits(i, 9)||getBits(i, 10)^getBits(i, 11)||getBits(i, 12)||getBits(i, 13)||getBits(i, 14)||!getBits(i, 15)||getBits(i, 16)^getBits(i, 17)||getBits(i, 18)^getBits(i, 19)||getBits(i, 20)||getBits(i, 21)||getBits(i, 22)||getBits(i, 23)||getBits(i, 24)||!getBits(i, 25)||getBits(i, 26)&&getBits(i, 27)||getBits(i, 28)&&getBits(i, 29)||getBits(i, 30)||!getBits(i, 31)||getBits(i, 32)^getBits(i, 33)||getBits(i, 34)||getBits(i, 35)||getBits(i, 36)&&getBits(i, 36)||getBits(i, 11)||getBits(i, 7)||getBits(i, 31)||getBits(i, 37)||getBits(i, 38)||!getBits(i, 35)||getBits(i, 39)&&!getBits(i, 40)||getBits(i, 41)||getBits(i, 37)||getBits(i, 6)||getBits(i, 42)||getBits(i, 31)&&!getBits(i, 36)||getBits(i, 43)||getBits(i, 37)||getBits(i, 44)||getBits(i, 45)||getBits(i, 46)&&getBits(i, 47)||getBits(i, 30)&&!getBits(i, 39)||getBits(i, 48)&&!getBits(i, 36)||getBits(i, 49)||getBits(i, 30)||getBits(i, 35)&&getBits(i, 50)||getBits(i, 51)||getBits(i, 52)||getBits(i, 53)&&getBits(i, 54)||getBits(i, 48)^getBits(i, 55)||getBits(i, 56)||getBits(i, 57));
    }
    break;
// Expression #59, Amount of variables: 61
case 59:
    for (long i = element; i < (((long) 1) << 61); i += maxCores) {
        result = result && (getBits(i, 0)&&getBits(i, 1)||getBits(i, 2)||getBits(i, 3)||getBits(i, 4)||getBits(i, 5)||getBits(i, 6)&&getBits(i, 7)||getBits(i, 8)^getBits(i, 9)||getBits(i, 7)&&getBits(i, 10)||getBits(i, 11)||getBits(i, 12)||getBits(i, 13)||getBits(i, 14)||getBits(i, 15)&&getBits(i, 16)||getBits(i, 17)&&getBits(i, 18)||getBits(i, 19)^getBits(i, 20)||getBits(i, 21)&&getBits(i, 22)||getBits(i, 23)^getBits(i, 24)||getBits(i, 25)^getBits(i, 26)||getBits(i, 27)&&!getBits(i, 28)||getBits(i, 29)^getBits(i, 30)||getBits(i, 31)||getBits(i, 32)||getBits(i, 33)^getBits(i, 34)||getBits(i, 35)||getBits(i, 36)||getBits(i, 14)||!getBits(i, 37)||getBits(i, 38)||!getBits(i, 39)||getBits(i, 40)^getBits(i, 41)||getBits(i, 38)&&getBits(i, 28)||getBits(i, 42)^getBits(i, 43)||getBits(i, 12)||!getBits(i, 12)||getBits(i, 44)&&getBits(i, 45)||getBits(i, 20)^getBits(i, 46)||getBits(i, 45)&&!getBits(i, 47)||getBits(i, 48)&&getBits(i, 49)||getBits(i, 26)&&getBits(i, 50)||getBits(i, 51)&&getBits(i, 52)||getBits(i, 53)||getBits(i, 54)||getBits(i, 26)||getBits(i, 55)||getBits(i, 56)||getBits(i, 43)||getBits(i, 57)&&getBits(i, 58)||getBits(i, 30)&&getBits(i, 26)||getBits(i, 49)||!getBits(i, 10)||getBits(i, 59)&&getBits(i, 60));
    }
    break;
  }
}
