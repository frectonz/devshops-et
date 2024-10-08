{ stdenv
, lib
, mkShell
, myEnv
, libnotify
, inotify-tools
, terminal-notifier
, darwin
, elixir-ls
, nodePackages
, ...
}:
mkShell {
  packages = [
    myEnv.beamPackages.erlang
    myEnv.beamPackages.elixir
    myEnv.nodePackages.nodejs

    elixir-ls
    nodePackages.typescript-language-server
    nodePackages."@tailwindcss/language-server"
  ] ++
  # Linux only
  lib.optionals stdenv.isLinux [
    # for ExUnit notifier
    libnotify

    # for package - file_system
    inotify-tools
  ] ++
  # Darwin only
  lib.optionals stdenv.isDarwin [
    # for ExUnit notifier
    terminal-notifier

    # for package - file_system
    darwin.apple_sdk.frameworks.CoreFoundation
    darwin.apple_sdk.frameworks.CoreServices
  ];

  shellHook = ''
    # limit mix to current project
    mkdir -p .nix-mix
    export MIX_HOME=$PWD/.nix-mix

    # rewire executables
    export PATH=$MIX_HOME/bin:$PATH
    export PATH=$MIX_HOME/escripts:$PATH

    # limit history to current project
    export ERL_AFLAGS="-kernel shell_history enabled -kernel shell_history_path '\"$PWD/.erlang-history\"'"
  '';
}
