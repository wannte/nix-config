###################################################################################
#
#  Home server configuration
#  - Prevents sleep (including clamshell / lid closed)
#  - Enables SSH remote login
#  - Power management for always-on operation
#
###################################################################################
{lib, ...}: {
  # Prevent sleep even with lid closed (clamshell mode)
  launchd.daemons.caffeinate = {
    serviceConfig = {
      ProgramArguments = ["/usr/bin/caffeinate" "-s"];
      RunAtLoad = true;
      KeepAlive = true;
    };
  };

  # Enable SSH and configure power management
  system.activationScripts.postActivation.text = lib.mkAfter ''
    # Enable remote login (SSH)
    systemsetup -setremotelogin on 2>/dev/null || true

    # Never sleep, even with lid closed
    pmset -a sleep 0
    pmset -a disablesleep 1
    pmset -a displaysleep 5
    pmset -a womp 1
  '';
}
