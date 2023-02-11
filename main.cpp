#include <thread>
#include <unistd.h>
#include <gpiod.hpp>

#define BUTTON 21

int main()
{
   gpiod::chip chip("/dev/gpiochip0");

   auto line = chip.get_line(BUTTON);

   struct gpiod::line_request req = {
      "gpiodtest",
      gpiod::line_request::DIRECTION_INPUT,
      gpiod::line_request::FLAG_BIAS_PULL_UP
   };

   line.request(req);

   int last_value = 1;

   while (1)
   {
      int value = line.get_value();
      if (value == last_value == 0)
      {
         execl("/usr/sbin/shutdown", "shutdown", "-P", "now", nullptr);
      }
      last_value = value;
      std::this_thread::sleep_for(std::chrono::milliseconds(500));
   }

   return 0; // never reached
}
