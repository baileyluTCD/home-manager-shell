{
  inputs = {
    home-manager-shell.url = "@home_manager_shell@";
    home-manager.follows = "home-manager-shell/home-manager";
    flake-utils.follows = "home-manager-shell/flake-utils";
  };

  outputs = {
    self,
    flake-utils,
    home-manager,
    home-manager-shell,
  }:
    flake-utils.lib.eachDefaultSystem (system: {
      packages.home-manager-shell = home-manager-shell.lib {inherit self system;};
    })
    // {
      homeManagerProfiles.nobody.programs.bat = {
        enable = true;
        config.style = "numbers";
      };
    };
}
