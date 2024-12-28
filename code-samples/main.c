#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[]) {
	if (argc != 2) {
		printf("Bad number of arguments!\n");
		return -1;
	}
	
	int num = atoi(argv[1]);
	switch (num) {
		case 1:
			printf("Learning to Linux\n");
			break;
		case 2:
			printf("Learning to work with Network\n");
			break;
		case 3:
			printf("Learning to Monitoring\n");
			break;
		case 4:
			printf("Learning to extra Monitoring\n");
			break;
		case 5:
			printf("Learning to Docker\n");
			break;
		case 6:
			printf("Learning to CI/CD\n");
			break;
		default:
			printf("Bad number!\n");
			return -2;
	}

    return 0;
}