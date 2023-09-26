### Logs Demos

#### Demo 1 *Event Viewer App*

1. Introduce the environment.
2. Open Event Viewer app
3. Identify the 5 logs, 3 with unique icons.
   1. Describe what types of events the applicaiton, security and system logs contain.
      1. Application: captures events related to anything outside of the core system events. Ie. "Application X" has failed to start.
      2. Security: captures audit events only. Ie., Event ID 4624 "An account was successfully logged on" at 3:00 a.m., that's weird?
      3. System: captures events related to the, um, system. Ie., Services failing to start or system reboots.
4. Select application log and describe the types of events, informational, warning and error.
5. Select the security log and describe the types of events
   1. Audit success and failure.
6. View the properties of the log file and where it lives
7. Browse to %systemroot%




#### Demo 2 *Windows Event Utility*

1. Open PowerShell
2. Type wevtutil displays help. Scroll through the options
3. A lot of logs

```batch
# shows help options
wevtutil 
# shows logs
wevtutil enum-logs


```