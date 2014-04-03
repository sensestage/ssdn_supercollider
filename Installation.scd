~directory = "/home/nescivi/git/ssdn/ssdn_supercollider/"
~target = Platform.resourceDir +/+ "Extensions";

("cd" + ~target ++";" + "ln -s" + ~directory ).unixCmd;
// not working yet..