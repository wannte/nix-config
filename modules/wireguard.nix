{pkgs, ...}: {
  environment.systemPackages = [pkgs.wireguard-tools];

  launchd.daemons.wireguard-vpn = {
    serviceConfig = {
      ProgramArguments = [
        "${pkgs.wireguard-tools}/bin/wg-quick"
        "up"
        "/etc/wireguard/vpn_dp.conf"
      ];
      RunAtLoad = true;
      KeepAlive = {
        NetworkState = true;
      };
      StandardOutPath = "/var/log/wireguard-vpn.log";
      StandardErrorPath = "/var/log/wireguard-vpn.log";
    };
  };
}
