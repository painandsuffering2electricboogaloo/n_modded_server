{
  config,
  lib,
  pkgs,
  ...
}:

{
  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
    defaultNetwork.settings.dns_enabled = true;
  };

  virtualisation.oci-containers.backend = "podman";

  virtualisation.oci-containers.containers."n_modded_server" = {
    autoStart = false;
    user = "nix";
    image = "itzg/minecraft-server:java21-graalvm";
    ports = [
      "25565:25565/tcp"
      "25565:25565/udp"
      "24454:24454/udp"
    ];
    volumes = [
      "/home/nix/n_modded_server:/data:rw"
    ];
    environment = {
      "EULA" = "TRUE";
      "TYPE" = "NEOFORGE";
      "VERSION" = "1.21.1";
      "NEOFORGE_VERSION" = "21.1.248";
      "MEMORY" = "16384M";
      "MAX_PLAYERS" = "32";
      "MOTD" = ":)";
      "ICON" = "/data/icon.png";
      "USE_MEOWICE_FLAGS" = "true";
      "USE_MEOWICE_GRAALVM_FLAGS" = "true";
      "DIFFICULTY" = "3";
      "SPAWN_PROTECTION" = "0";
      "REGION_FILE_COMPRESSION" = "lz4";
      "OPS" =
        "chsck
        nvmcd
        Elbertson";
      "ALLOW_FLIGHT" = "true";
      "MAX_TICK_TIME" = "240000";
      "MODS" =
        "
        ";
      "MODRINTH_PROJECTS_DEFAULT_VERSION_TYPE" = "beta";
      "MODRINTH_PROJECTS" =
        "
        ";
      "CF_API_KEY" = (builtins.readFile ./cf-api-key);
      "CURSEFORGE_FILES" =
        "antique-atlas:6849155
        cirrus:8689121";
      "RCON_CMDS_FIRST_CONNECT" = "gamerule doFireTick true";
      "RCON_CMDS_LAST_DISCONNECT" = "gamerule doFireTick false";
    };
  };
}
