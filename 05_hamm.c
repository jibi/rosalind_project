#include <stdio.h>
#include <string.h>

int main(int argc, char *argv[]) {
	int diff = 0;
	int len;

	if (argc < 3) {
		return 1;
	}

	len = strlen(argv[1]);
	for (int i = 0; i < len; i++) {
		if (argv[1][i] != argv[2][i]) {
			diff++;
		}
	}

	printf("%d\n", diff);
	return 0;
}


