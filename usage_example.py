from script_tracker import ScriptTracker
import time

script_tracker = ScriptTracker()
script_tracker.initialize('asad007mahmood@gmail.com', '123456', 'Eavein Script')

total_done = 0
total_crashed = 0
unique_crash_logs = []
for i in range(100):
    total_done+=1
    time.sleep(2)
    script_tracker.send_data(total_done, total_crashed, unique_crash_logs)
    print(i)

script_tracker.set_status_to_completed()
