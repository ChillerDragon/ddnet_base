#include <cstdio>
#include <ddnet_base/base/str.h>

int main()
{
	char aBuf[512] = "";
	str_append(aBuf, "hello");
	str_append(aBuf, " ");
	str_append(aBuf, "world");
	puts(aBuf);
}
