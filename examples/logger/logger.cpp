#include <ddnet_base/base/log.h>
#include <ddnet_base/base/logger.h>

int main()
{
	log_set_global_logger_default();
	log_info("sample", "hello world");
}
