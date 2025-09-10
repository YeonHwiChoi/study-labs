#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_LINE 128
#define MAX_PRODUCTS 100

typedef struct{
	char name[50];
	int total_qty;
} Product;

int main(int argc, char *argv[])
{
	if(argc < 2){
		printf("Usage: %s sales.csv\n", argv[0]);
		return 1;
	}

	FILE *fp = fopen(argv[1], "r");
	if(!fp){
		perror("File open error");
		return 1;
	}

	char line[MAX_LINE];
	Product product[MAX_PRODUCTS];
	int product_count = 0;

	fgets(line, sizeof(line), fp);

	while(fgets(line, sizeof(line), fp))
	{
		char* name = strtok(line, ",");
		char* str_qty = strtok(NULL, ",");

		if(!name || !str_qty)
			continue;

		int qty = atoi(str_qty);

		int found = 0;

		for(int i = 0; i < product_count; i++)
		{
			if(strcmp(product[i].name, name) == 0){
				product[i].total_qty += qty;
				found = 1;
				break;
			}
		}
		if(!found && product_count < MAX_PRODUCTS)
		{
			strcpy(product[product_count].name, name);
			product[product_count].total_qty = qty;
			product_count++;

		}
	}

	fclose(fp);

	for(int i = 0; i < product_count; i++)
	{
		printf("%s : %d\n", product[i].name, product[i].total_qty);
	}
	return 0;
}
