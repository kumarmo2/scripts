#!/bin/lua

local cmd = "ps -eF | awk '/ picom/ {print $11}'"

local output_handle = io.popen(cmd)

if output_handle == nil then
  -- this might be the place to start the picom.
  print("no output of the command found");
  return;

end

io.input(output_handle);

while true do
  local line = io.read("*lines")

  if line == nil then
    break;
    -- sfdf
  end
  if line == 'picom' then
    print("found picom")
    os.execute("killall picom")
    return
  end
end

os.execute("picom -b --experimental-backend")


