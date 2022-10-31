#include<stdio.h>
int numJewelsInStones(char *jewels, char *stones){
    int counter = 0;
    char array[128] = {0};
    for(*jewels != '\0'; jewels++)
    {
        array[*jewels] = 1;
    }
    for(*stones != '\0'; stones++)
    {
        if(array[*stones] == 1)
        {
            counter++;
        }
    }
    printf("The result is %d:\n",counter);
}
int main()
{
    char *j1="aA";
    char *s1="aAAbbbb";
    numJewelsInStones(j1,s1);
}