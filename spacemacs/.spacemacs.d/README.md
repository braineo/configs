# Private directory

The content of this directory is ignored by Git. This is the default place
where to store your private configuration layers.

To create a new configuration layer:

    SPC SPC configuration-layer/create-layer RET

Then enter the name of your configuration in the prompt.

A directory named after the created configuration layer will be created here
along with template files within it (packages.el and extensions.el, more info
on the meaning of those files can be found in the [documentation][conf_layers]).

Each created file has further guidance written in them.

Once the configuration is done, restart Emacs to load, install and configure
your layer.

## Install dependencies

```bash
# Python auto complete
pip install --upgrade "jedi>=0.9.0" "json-rpc>=1.8.1" "service_factory>=0.1.5"

# Python syntax check
pip install flake8

# React related
npm install -g tern eslint babel-eslint eslint-plugin-react js-beautify
```

[conf_layers]: https://github.com/syl20bnr/spacemacs/blob/master/doc/DOCUMENTATION.org#extensions-and-packages
