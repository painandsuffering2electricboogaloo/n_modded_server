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
    user = "root";
    image = "docker.io/itzg/minecraft-server:java21-graalvm";
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
      "MOTD" = "o/";
      "USE_MEOWICE_FLAGS" = "true";
      "USE_MEOWICE_GRAALVM_FLAGS" = "true";
      "DIFFICULTY" = "2";
      "SPAWN_PROTECTION" = "0";
      "REGION_FILE_COMPRESSION" = "lz4";
      "OPS" =
        "chsck
        nvmcd
        Elbertson";
      "ALLOW_FLIGHT" = "true";
      "MAX_TICK_TIME" = "240000";
      "MODS" =
        "https://cdn.modrinth.com/data/g96Z4WVZ/versions/S2qthD5S/BadOptimizations-2.4.1-1.21.1.jar
        https://cdn.modrinth.com/data/fALzjamp/versions/LuFhm4eU/Chunky-NeoForge-1.4.23.jar
        https://cdn.modrinth.com/data/Wnxd13zP/versions/jo7lDoK4/Clumps-neoforge-1.21.1-19.0.0.1.jar
        https://cdn.modrinth.com/data/FYpiwiBR/versions/dgLCqZyo/ConnectorExtras-1.12.1%2B1.21.1.jar
        https://cdn.modrinth.com/data/R2OftAxM/versions/wpkbWnVh/FarmersDelight-1.21.1-1.3.3.jar
        https://cdn.modrinth.com/data/qQyHxfxd/versions/ZV8eL55E/NoChatReports-NEOFORGE-1.21.1-v2.9.1.jar
        https://cdn.modrinth.com/data/bQh7xzFq/versions/8SBaRv1t/Not%20Enough%20Recipe%20Book-NEOFORGE-0.4.3%2B1.21.jar
        https://cdn.modrinth.com/data/RH2KUdKJ/versions/yVCCi6TK/OctoLib-NEOFORGE-0.6.2%2B1.21.jar
        https://cdn.modrinth.com/data/qnQsVE2z/versions/yvp3Jbmk/Quark-4.1-482.jar
        https://cdn.modrinth.com/data/oLS8HdJ1/versions/DcgPMrvF/StreamsReflowing-1.21.1-neoforge-2.12.6.jar
        https://cdn.modrinth.com/data/EkkPwdCY/versions/apj1lnco/UnionLib-1.21.1-12.0.18-NeoForge-all.jar
        https://cdn.modrinth.com/data/MVARlG2f/versions/9GjNW2Gf/Zeta-1.1-40.jar
        https://cdn.modrinth.com/data/wjpmYU1u/versions/wsXjRa7l/aerocopycats-1.1.1.jar
        https://cdn.modrinth.com/data/b8kG1VGq/versions/XDz1C9KI/aileron-1.21.1-neoforge-1.1.4.jar
        https://cdn.modrinth.com/data/lhGA9TYQ/versions/1IiqEQGl/architectury-13.0.11-neoforge.jar
        https://cdn.modrinth.com/data/ftdbN0KK/versions/RNyYl9M3/badpackets-neo-0.8.2.jar
        https://cdn.modrinth.com/data/cGdLzhfA/versions/QOUuJnFs/betteritembreaking-1.21.1-6.3.jar
        https://cdn.modrinth.com/data/VsM5EDoI/versions/5JOCYuQM/blueprint-1.21.1-8.1.0.jar
        https://cdn.modrinth.com/data/xxaCKdq3/versions/3KHer3VE/cbc_going_ballistic-0.3.0.jar
        https://cdn.modrinth.com/data/jJfV67b1/versions/ZkgKf4xj/citadel-2.7.1-1.21.1.jar
        https://cdn.modrinth.com/data/jImqv1M5/versions/aRyfYH0t/climbable_ropes-2.1.1.jar
        https://cdn.modrinth.com/data/u58R1TMW/versions/IITF0PRC/connector-2.0.0-beta.17%2B1.21.1-full.jar
        https://cdn.modrinth.com/data/UT2M39wf/versions/kecZ0sl7/copycats-3.0.4%2Bmc.1.21.1-neoforge.jar
        https://cdn.modrinth.com/data/LNytGWDc/versions/UjX6dr61/create-1.21.1-6.0.10.jar
        https://cdn.modrinth.com/data/oWaK0Q19/versions/Vzp221Un/create-aeronautics-bundled-1.21.1-1.3.1.jar
        https://cdn.modrinth.com/data/Gxj4Ihed/versions/uDnC1TSw/create_aero_radar-0.1.1-1.21.1.jar
        https://cdn.modrinth.com/data/BLu2Yqfq/versions/AntNFNAx/create_radar-0.4.9.4-1.21.1.jar
        https://cdn.modrinth.com/data/H6bJ8Ju4/versions/csCe2v7f/create_tweaked_controllers-1.21.1-1.2.7.jar
        https://cdn.modrinth.com/data/GWp4jCJj/versions/bOiDu0LS/createbigcannons-5.11.7%2Bmc.1.21.1.jar
        https://cdn.modrinth.com/data/7nEkcq0F/versions/lCcKRKFT/creaturefeature-1.2.2.2.jar
        https://cdn.modrinth.com/data/Yd4wb5wZ/versions/aeDUpTJS/crittersandcompanions-neoforge-1.21.1-2.7.0.jar
        https://cdn.modrinth.com/data/gOQjCAAD/versions/gdWm3nOx/cuisinedelight-1.2.10.jar
        https://cdn.modrinth.com/data/hB899VmG/versions/KZR7AUbh/exposure-neoforge-1.21.1-1.9.18.jar
        https://cdn.modrinth.com/data/uXXizFIs/versions/x7kQWVju/ferritecore-7.0.3-neoforge.jar
        https://cdn.modrinth.com/data/72RRCWM6/versions/IHeF9qnB/fieldguide-neoforge-1.21.1-1.15.2.jar
        https://cdn.modrinth.com/data/8BmcQJ2H/versions/tPkJmim6/geckolib-neoforge-1.21.1-4.9.2.jar
        https://cdn.modrinth.com/data/RYtXKJPr/versions/rMGJpjaM/gravestone-neoforge-1.21.1-1.0.40.jar
        https://cdn.modrinth.com/data/PKoLkD98/versions/iSgEIIkY/immersiveoverlays-1.8.0%2B1.21.1-neoforge.jar
        https://cdn.modrinth.com/data/u6dRKJwZ/versions/LtwmFHuF/jei-1.21.1-neoforge-19.44.0.403.jar
        https://cdn.modrinth.com/data/umyGl7zF/versions/F2nzeC19/kubejs-neoforge-2101.7.2-build.368.jar
        https://cdn.modrinth.com/data/BZemjxZb/versions/EK0wJfqY/kubejsadditions-neoforge-1.21.1-6.0.0.jar
        https://cdn.modrinth.com/data/lKiXKLvv/versions/3ApXwZMf/lod-server-support-neoforge-0.11.1%2B1.21.1.jar
        https://cdn.modrinth.com/data/fJFETWDN/versions/5AZDyUSn/lootjs-neoforge-1.21.1-3.7.0.jar
        https://cdn.modrinth.com/data/gPCdW0Wr/versions/qHvQZt4g/make_bubbles_pop-0.4.0-beta.1-neoforge-mc1.21-1.21.1.jar
        https://cdn.modrinth.com/data/IEg0z2Uv/versions/suPqovqC/mendingrework-1.21.1-neo-0.4.jar
        https://cdn.modrinth.com/data/nmDcB62a/versions/VsJnrw8k/modernfix-neoforge-5.27.20%2Bmc1.21.1.jar
        https://cdn.modrinth.com/data/twkfQtEc/versions/fiyhLK1O/moonlight-1.21.1-3.4.0-neoforge.jar
        https://cdn.modrinth.com/data/c7m1mi73/versions/2C41Q8WX/packetfixer-3.3.1-1.20.5-1.21.X-merged.jar
        https://cdn.modrinth.com/data/64LYq6Wj/versions/DliuSIK0/peaceless-1.0.jar
        https://cdn.modrinth.com/data/L3Jv0QZI/versions/czVeSmZo/railways-0.3.0-beta.2%2Bneoforge-mc1.21.1.jar
        https://cdn.modrinth.com/data/sk9knFPE/versions/SqkDvOLG/rhino-2101.2.8-build.91.jar
        https://cdn.modrinth.com/data/B3pb093D/versions/hZ6B2Z0x/ritchiesprojectilelib-2.1.2%2Bmc.1.21.1-neoforge.jar
        https://cdn.modrinth.com/data/T9PomCSv/versions/U678xqle/sable-neoforge-1.21.1-2.0.5.jar
        https://cdn.modrinth.com/data/coyNPDey/versions/hghOJFVs/seeu-neoforge-1.21.1-0.7.3.jar
        https://cdn.modrinth.com/data/l6YH9Als/versions/v5qtqRQi/spark-1.10.124-neoforge.jar
        https://cdn.modrinth.com/data/rex9wwpz/versions/gMPsUePI/spawn-4.0.7-1.21.1.jar
        https://cdn.modrinth.com/data/h2jXvxNR/versions/gDYg666K/starcatcher-3.0.6-NEOFORGE-1.21.1.jar
        https://cdn.modrinth.com/data/yz7AM2zx/versions/5ZFXdRz4/structurify-neoforge-2.0.33%2Bmc1.21.1.jar
        https://cdn.modrinth.com/data/2UJdja33/versions/q5C0EErE/swingthroughgrass-neoforge-1.0.1-1.21.1.jar
        https://cdn.modrinth.com/data/rLJ1qF79/versions/lZTBRemW/teallib-1.3.teal.jar
        https://cdn.modrinth.com/data/QFR0NFEH/versions/AxM8UD5v/the_beyond-0.0.5-InDev.jar
        https://cdn.modrinth.com/data/w6JSkKSH/versions/pDkjMI8q/toofast-1.21.0-0.4.3.5.jar
        https://cdn.modrinth.com/data/zuARv1N7/versions/lRpm2YCs/vista-1.21.1-5.4.4-neoforge.jar
        https://cdn.modrinth.com/data/9eGKb6K1/versions/2s7zUspF/voicechat-neoforge-1.21.1-2.6.22.jar
        https://cdn.modrinth.com/data/WWLeFuHa/versions/ezd5tjP2/voicemessages-neoforge-1.0.12-1.21.1.jar
        https://cdn.modrinth.com/data/YOs4tZea/versions/73U02HbA/xercapaint-neoforge-1.21.1-2.0.1.jar
        https://cdn.modrinth.com/data/1eAoo2KR/versions/7TVdVtxF/yet_another_config_lib_v3-3.8.2%2B1.21.1-neoforge.jar";
      "CF_API_KEY" = (builtins.readFile ./cf-api-key);
      "CURSEFORGE_FILES" = "antique-atlas:6849155";
      "RCON_CMDS_FIRST_CONNECT" = "gamerule doFireTick true";
      "RCON_CMDS_LAST_DISCONNECT" = "gamerule doFireTick false";
    };
  };
}
