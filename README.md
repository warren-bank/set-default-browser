### [SetDefaultBrowser](https://github.com/warren-bank/set-default-browser)

#### Summary:

Command-line shell script for Windows to set registry values that configure the default web browser.

#### Usage:

```bash
SetDefaultBrowser "C:\path\to\www\browser.exe" [--optional --command-line="switches"]
```

#### Methodology:

* [SetDefaultBrowser.reg.tpl](https://github.com/warren-bank/set-default-browser/blob/master/tpl/SetDefaultBrowser.reg.tpl) is a template for a Windows registry file
  * it contains placeholders that get populated by input parameters
  * the fully populated Windows registry file is saved to a [temporary directory](https://github.com/warren-bank/set-default-browser/tree/master/tmp), and then imported by the Windows registry

#### 3rd-Party Dependencies:

* binaries included in [tools](https://github.com/warren-bank/set-default-browser/tree/master/tools)
  * [fart.exe](http://fart-it.sourceforge.net/)

#### Legal:

* copyright: [Warren Bank](https://github.com/warren-bank)
* license: [GPL-2.0](https://www.gnu.org/licenses/old-licenses/gpl-2.0.txt)
