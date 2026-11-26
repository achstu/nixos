let
  x1c8 = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFpa/kk58+ncGj6tZ89fFcQdP6hD/pLDiF5iSiTBPvxl root@x1c8";
  achstu = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGlRQXR1zynOWI4Pc3FNDuktFYli+7jzXgve4h8x1m/p achstu@x1c8";
in
{
  "achstu-password.age".publicKeys = [ x1c8 achstu ];
  "root-password.age".publicKeys = [ x1c8 achstu ];
  "openrouter-api-key.age".publicKeys = [ x1c8 achstu ];
  "wise-api-key.age".publicKeys = [ x1c8 achstu ];
}
