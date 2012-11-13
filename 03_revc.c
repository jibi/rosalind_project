#include <stdio.h>
#include <string.h>

int
main() {
	char dataset[] = "AAAACCCGGT";
	int len = strlen(dataset);

	for (int i = 0; i < len; i++) {
		if (dataset[i] == 'A')
			dataset[i] = 'T';

		else if (dataset[i] == 'T')
			dataset[i] = 'A';

		else if (dataset[i] == 'C')
			dataset[i] = 'G';

		else if (dataset[i] == 'G')
			dataset[i] = 'C';
	}

	for (int i = 0; i < len / 2; i++) {
		char c = dataset[i];

		dataset[i] = dataset[len - i - 1];
		dataset[len - i - 1] = c;
	}

	printf("%s\n", dataset);

	return 0;
}

