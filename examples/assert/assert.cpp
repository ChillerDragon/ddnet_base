#include <ddnet_base/base/system.h>

int main()
{
	dbg_assert(false, "this fails because %d is not 10", 2);
}
