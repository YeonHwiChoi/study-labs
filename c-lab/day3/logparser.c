#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>

#define BUF_SIZE 8192

static FILE* open_file(const char* path, const char* mode)
{
    FILE* fp = fopen(path, mode);
    if(!fp)
    {
        fprintf("[ERROR] 파일 오픈 실패 : %s(%s)\m",path,strerror(errno));
        exit(EXIT_FAILURE);
    }
    return fp;
}

int main (int argc, char* argv[]){
    if(argc < 2)
    {
        fprintf(stderr, "Usage: %s <input_log>\n", argv[0]);
        return EXIT_FAILURE;
    }

    const char* input_path = argv[1];
    FILE* fp = open_file(input_path, "r");

    long cnt_error = 0;
    long cnt_warning = 0;
    char line[BUF_SIZE];

    while(fgets(line, sizeof(line), fp)){
        if(strstr(line, "ERROR")){
            cnt_error++;
        }
        if(strstr(line, "WARNING")){
            cnt_warning++;
        }
    }

    fclose(fp);

    printf("ERROR: %ld\n", cnt_error);
    printf("WARNING: %ld\n", cnt_warning);

    return EXIT_SUCCESS;

}