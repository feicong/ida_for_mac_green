# ida plugins installer by fei_cong.

export IDA_PLUGINS_PATH=/Applications/IDAPro6.95/idaq.app/Contents/MacOS/plugins
export IDA_PYTHON_PATH=/Applications/IDAPro6.95/idaq.app/Contents/MacOS/python

echo 'sys.path.append(os.path.join(sys.executable, IDAPYTHON_DYNLOAD_BASE, "python", "lib", "python2.7", "site-packages"))' >> $IDA_PYTHON_PATH/init.py

cd $IDA_PLUGINS_PATH
mkdir git
cd git

# findcrypt-yara
#sudo python -m pip install yara-python
python -m pip install --ignore-installed --no-cache-dir --install-option="--prefix=$IDA_PYTHON_PATH" yara-python
git clone https://github.com/polymorf/findcrypt-yara
ln -s -f $IDA_PLUGINS_PATH/git/findcrypt-yara/findcrypt3.py $IDA_PLUGINS_PATH/findcrypt3.py
ln -s -f $IDA_PLUGINS_PATH/git/findcrypt-yara/findcrypt3.rules $IDA_PLUGINS_PATH/findcrypt3.rules

# keypatch
python -m pip install --ignore-installed --no-cache-dir --install-option="--prefix=$IDA_PYTHON_PATH" keystone-engine
git clone https://github.com/keystone-engine/keypatch
ln -s -f $IDA_PLUGINS_PATH/git/keypatch/keypatch.py $IDA_PLUGINS_PATH/keypatch.py

# auto_re
git clone https://github.com/a1ext/auto_re
ln -s -f $IDA_PLUGINS_PATH/git/auto_re/auto_re.py $IDA_PLUGINS_PATH/auto_re.py

# nao
python -m pip install --ignore-installed --no-cache-dir --install-option="--prefix=$IDA_PYTHON_PATH" unicorn
git clone https://github.com/tkmru/nao
ln -s -f $IDA_PLUGINS_PATH/git/nao/nao $IDA_PLUGINS_PATH/nao

# idaemu
# python -m pip install --ignore-installed --no-cache-dir --install-option="--prefix=$IDA_PYTHON_PATH" unicorn
git clone https://github.com/36hours/idaemu
ln -s -f $IDA_PLUGINS_PATH/git/idaemu/idaemu.py $IDA_PLUGINS_PATH/idaemu.py

# Rematch
# python -m pip install rematch-idaplugin --target="$IDA_PLUGINS_PATH"
git clone https://github.com/nirizr/rematch
ln -s -f $IDA_PLUGINS_PATH/git/rematch/idaplugin/plugin_rematch.py $IDA_PLUGINS_PATH/plugin_rematch.py
ln -s -f $IDA_PLUGINS_PATH/git/rematch/idaplugin/rematch $IDA_PLUGINS_PATH/rematch

# dumpDex
git clone https://github.com/CvvT/dumpDex

# dsc_fix
git clone https://github.com/deepinstinct/dsc_fix
ln -s -f $IDA_PLUGINS_PATH/git/dsc_fix/dsc_fix.py $IDA_PLUGINS_PATH/dsc_fix.py

# diaphora
git clone https://github.com/joxeankoret/diaphora

# python-idb
git clone https://github.com/williballenthin/python-idb

# devirtualize
git clone https://github.com/ALSchwalm/devirtualize
ln -s -f $IDA_PLUGINS_PATH/git/devirtualize/devirtualize_main.py $IDA_PLUGINS_PATH/devirtualize_main.py
ln -s -f $IDA_PLUGINS_PATH/git/devirtualize/devirtualize $IDA_PLUGINS_PATH/devirtualize

# ida_ifl
git clone https://github.com/hasherezade/ida_ifl
ln -s -f $IDA_PLUGINS_PATH/git/ida_ifl/ifl.py $IDA_PLUGINS_PATH/ifl.py

# IDAtropy
git clone https://github.com/danigargu/IDAtropy
ln -s -f $IDA_PLUGINS_PATH/git/IDAtropy/IDAtropy.py $IDA_PLUGINS_PATH/IDAtropy.py

# flare-ida
git clone https://github.com/fireeye/flare-ida

# uEmu
git clone https://github.com/alexhude/uEmu
ln -s -f $IDA_PLUGINS_PATH/git/uEmu/uEmu.py $IDA_PLUGINS_PATH/uEmu.py

# Ponce
# git clone https://github.com/illera88/Ponce
curl -o $IDA_PLUGINS_PATH/ponce_x64_IDA68_mac.pmc64 https://raw.githubusercontent.com/illera88/Ponce/master/latest_builds/ponce_x64_IDA68_mac.pmc64
curl -o $IDA_PLUGINS_PATH/ponce_x86_IDA68_mac.pmc https://raw.githubusercontent.com/illera88/Ponce/master/latest_builds/ponce_x86_IDA68_mac.pmc

# sk3wldbg
# git clone https://github.com/cseagle/sk3wldbg
# TODO check git committed plugin version.
curl -o $IDA_PLUGINS_PATH/sk3wldbg_user.pmc64 https://raw.githubusercontent.com/cseagle/sk3wldbg/master/bins/mac/sk3wldbg_user.pmc64
curl -o $IDA_PLUGINS_PATH/sk3wldbg_user.pmc https://raw.githubusercontent.com/cseagle/sk3wldbg/master/bins/mac/sk3wldbg_user.pmc

# IDA-Function-Tagger
git clone https://github.com/alessandrogario/IDA-Function-Tagger
ln -s -f $IDA_PLUGINS_PATH/git/IDA-Function-Tagger/IDAFunctionTagger.py $IDA_PLUGINS_PATH/IDAFunctionTagger.py
ln -s -f $IDA_PLUGINS_PATH/git/IDA-Function-Tagger/cfg $IDA_PLUGINS_PATH/cfg

# idaref
git clone https://github.com/nologic/idaref
ln -s -f $IDA_PLUGINS_PATH/git/idaref/idaref.py $IDA_PLUGINS_PATH/idaref.py
ln -s -f $IDA_PLUGINS_PATH/git/idaref/archs $IDA_PLUGINS_PATH/archs

# lighthouse
git clone https://github.com/gaasedelen/lighthouse
ln -s -f $IDA_PLUGINS_PATH/git/lighthouse/plugin/lighthouse_plugin.py $IDA_PLUGINS_PATH/lighthouse_plugin.py
ln -s -f $IDA_PLUGINS_PATH/git/lighthouse/plugin/lighthouse $IDA_PLUGINS_PATH/lighthouse

# HexRaysPyTools
git clone https://github.com/igogo-x86/HexRaysPyTools
ln -s -f $IDA_PLUGINS_PATH/git/HexRaysPyTools/HexRaysPyTools.py $IDA_PLUGINS_PATH/HexRaysPyTools.py
ln -s -f $IDA_PLUGINS_PATH/git/HexRaysPyTools/HexRaysPyTools $IDA_PLUGINS_PATH/HexRaysPyTools

# ida-images
git clone https://github.com/rr-/ida-images
ln -s -f $IDA_PLUGINS_PATH/git/ida-images/rgb-ida.py $IDA_PLUGINS_PATH/rgb-ida.py
ln -s -f $IDA_PLUGINS_PATH/git/ida-images/librgb $IDA_PLUGINS_PATH/librgb

# prefix
git clone https://github.com/gaasedelen/prefix
ln -s -f $IDA_PLUGINS_PATH/git/prefix/plugin/ida_prefix.py $IDA_PLUGINS_PATH/ida_prefix.py
ln -s -f $IDA_PLUGINS_PATH/git/prefix/plugin/prefix $IDA_PLUGINS_PATH/prefix

# pytest-idapro
git clone https://github.com/nirizr/pytest-idapro

# ida-swift-demangle
git clone https://github.com/tobefuturer/ida-swift-demangle

# android-scripts
git clone https://github.com/strazzere/android-scripts

# idapython_virtualenv
git clone https://github.com/Kerrigan29a/idapython_virtualenv

# nrs
#git clone https://github.com/isra17/nrs
CFLAGS=-m32 LDFLAGS=-m32 python -m pip install --ignore-installed --no-cache-dir --install-option="--prefix=$IDA_PYTHON_PATH" nrs

# FRIEND
# git clone https://github.com/alexhude/FRIEND


