@0x99f9db243de9f4eb;

using Spk = import "/sandstorm/package.capnp";
# This imports:
#   $SANDSTORM_HOME/latest/usr/include/sandstorm/package.capnp
# Check out that file to see the full, documented package definition format.

const pkgdef :Spk.PackageDefinition = (
  # The package definition. Note that the spk tool looks specifically for the
  # "pkgdef" constant.

  id = "qkgkaxfqhgsff8zgx2f4nf1a8xvmpte6wa19egmfkk06mzt7e8dh",
  # Your app ID is actually its public key. The private key was placed in
  # your keyring. All updates must be signed with the same key.

  manifest = (
    # This manifest is included in your app package to tell Sandstorm
    # about your app.

    appTitle = (defaultText = "Let's Chat"),

    appVersion = 8,  # Increment this for every release.

    appMarketingVersion = (defaultText = "0.4.2"),

    actions = [
      # Define your "new document" handlers here.
      ( title = (defaultText = "New Let's Chat"),
        nounPhrase = (defaultText = "chatroom"),
        command = .myCommand
        # The command to run when starting for the first time. (".myCommand"
        # is just a constant defined at the bottom of the file.)
      )
    ],

    continueCommand = .myCommand,
    # This is the command called to start your app back up after it has been
    # shut down for inactivity. Here we're using the same command as for
    # starting a new instance, but you could use different commands for each
    # case.

    metadata = (
      icons = (
        appGrid = (png = (
          dpi1x = embed "app-graphics/letschat-128.png",
          dpi2x = embed "app-graphics/letschat-256.png"
        )),
        grain = (png = (
          dpi1x = embed "app-graphics/letschat-24.png",
          dpi2x = embed "app-graphics/letschat-48.png"
        )),
        market =  (png = (
          dpi1x = embed "app-graphics/letschat-150.png",
          dpi2x = embed "app-graphics/letschat-300.png"
        )),
      ),

      website = "https://sdelements.github.io/lets-chat/",
      codeUrl = "https://github.com/jparyani/lets-chat",
      license = (openSource = mit),
      categories = [office, productivity],

      author = (
        contactEmail = "jparyani@sandstorm.io",
        pgpSignature = embed "pgp-signature",
        upstreamAuthor = "Security Compass",
      ),
      pgpKeyring = embed "pgp-keyring",

      description = (defaultText = embed "description.md"),

      screenshots = [
        (width = 438, height = 251, png = embed "sandstorm-screenshot.png")
      ],

      changeLog = (defaultText = embed "CHANGELOG.md"),
    ),
  ),

  sourceMap = (
    # Here we defined where to look for files to copy into your package. The
    # `spk dev` command actually figures out what files your app needs
    # automatically by running it on a FUSE filesystem. So, the mappings
    # here are only to tell it where to find files that the app wants.
    searchPath = [
      ( sourcePath = "." ),  # Search this directory first.
      ( sourcePath = "hosts", packagePath = "etc/hosts" ),  # Search this directory first.
      ( sourcePath = "/",    # Then search the system root directory.
        hidePaths = [ "home", "proc", "sys",
                      "etc/passwd", "etc/hosts", "etc/host.conf",
                      "etc/nsswitch.conf", "etc/resolv.conf" ]
        # You probably don't want the app pulling files from these places,
        # so we hide them. Note that /dev, /var, and /tmp are implicitly
        # hidden because Sandstorm itself provides them.
      )
    ]
  ),

  fileList = "sandstorm-files.list",
  # `spk dev` will write a list of all the files your app uses to this file.
  # You should review it later, before shipping your app.

  alwaysInclude = ["media", "templates", "extras"]
  # Fill this list with more names of files or directories that should be
  # included in your package, even if not listed in sandstorm-files.list.
  # Use this to force-include stuff that you know you need but which may
  # not have been detected as a dependency during `spk dev`. If you list
  # a directory here, its entire contents will be included recursively.
);

const myCommand :Spk.Manifest.Command = (
  # Here we define the command used to start up your server.
  argv = ["/sandstorm-http-bridge", "33411", "--", "bash", "run_grain.sh"],
  environ = [
    # Note that this defines the *entire* environment seen by your app.
    (key = "PATH", value = "/usr/local/bin:/usr/bin:/bin")
  ]
);
