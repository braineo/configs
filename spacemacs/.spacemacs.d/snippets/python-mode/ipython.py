# -*- mode: snippet -*-
# name: IPython
# key: ipython
# --

from IPython.terminal import embed;
ipshell=embed.InteractiveShellEmbed(config=embed.load_default_config())(local_ns=locals())