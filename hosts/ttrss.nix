{ pkgs, ... }:
let
  # TODO: add your ssh key here in order to be able to log in via SSH
  sshKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGbN8I8+VYqdhWf5KzuSGwGTUm5NUmwP/i2OCtspO3QT evie@janus";

  # TODO: change this based on your repo: server.<BRANCH>.<REPONAME>.<GITHUB ORG/USER>.garnix.me
  host = "server.ad-test-garnix-us.template-ttrss.garnix-io.garnix.me";
in
{
  # This sets up networking and filesystems in a way that works with garnix
  # hosting.
  garnix.server.enable = true;

  # This is so we can log in.
  #   - First we enable SSH
  services.openssh.enable = true;

  #   - Then we create a user called "me". You can change it if you like; just
  #     remember to use that user when ssh'ing into the machine.
  users.users.me = {
    # This lets NixOS know this is a "real" user rather than a system user,
    # giving you for example a home directory.
    isNormalUser = true;
    description = "me";
    extraGroups = [ "wheel" "systemd-journal" ];
    openssh.authorizedKeys.keys = [ sshKey ];
  };

  # This allows you to use `sudo` without a password when ssh'ed into the machine.
  security.sudo.wheelNeedsPassword = false;

  # This specifies what packages are available in your system. You can choose
  # from over 100,000 - search for them here:
  #   https://search.nixos.org/options?channel=24.05
  environment.systemPackages = [
    pkgs.htop
    pkgs.tree
  ];

  services.tt-rss = {
    enable = true;
    virtualHost = host;
    selfUrlPath = "https://${host}";
    forceArticlePurge = 5;
    singleUserMode = true;
  };

  # We open these ports.
  networking.firewall.allowedTCPPorts = [ 80 443 ];

  # This is currently the only allowed value.
  nixpkgs.hostPlatform = "x86_64-linux";
}
