# ida plugins installer by fei_cong.

export IDA_INSTALL_PATH=/Applications/IDAPro6.95/idaq.app/Contents/MacOS
export IDA_PLUGINS_PATH=$IDA_INSTALL_PATH/plugins
export IDA_PROCS_PATH=$IDA_INSTALL_PATH/procs
export IDA_LOADERS_PATH=$IDA_INSTALL_PATH/loaders
export IDA_PYTHON_PATH=$IDA_INSTALL_PATH/python

echo 'sys.path.append(os.path.join(sys.executable, IDAPYTHON_DYNLOAD_BASE, "python", "lib", "python2.7", "site-packages"))' >> $IDA_PYTHON_PATH/init.py

ln -s -f $IDA_PYTHON_PATH/lib/python2.7/site-packages/unicorn/lib/libunicorn.dylib $IDA_INSTALL_PATH/libunicorn.dylib
ln -s -f $IDA_PYTHON_PATH/lib/python2.7/site-packages/unicorn/lib/libunicorn.dylib $IDA_INSTALL_PATH/libunicorn.1.dylib

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
ln -s -f $IDA_PLUGINS_PATH/git/idaemu/idaemu.py $IDA_PYTHON_PATH/idaemu.py

# Rematch
# python -m pip install rematch-idaplugin --target="$IDA_PLUGINS_PATH"
git clone  --recurse-submodules https://github.com/nirizr/rematch
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
ln -s -f $IDA_PLUGINS_PATH/git/flare-ida/apply_callee_type_plugin.py $IDA_PLUGINS_PATH/apply_callee_type_plugin.py
ln -s -f $IDA_PLUGINS_PATH/git/flare-ida/shellcode_hashes_search_plugin.py $IDA_PLUGINS_PATH/shellcode_hashes_search_plugin.py
ln -s -f $IDA_PLUGINS_PATH/git/flare-ida/stackstrings_plugin.py $IDA_PLUGINS_PATH/stackstrings_plugin.py
ln -s -f $IDA_PLUGINS_PATH/git/flare-ida/struct_typer_plugin.py $IDA_PLUGINS_PATH/struct_typer_plugin.py

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
install_name_tool -change libunicorn.1.dylib @executable_path/libunicorn.1.dylib $IDA_PLUGINS_PATH/sk3wldbg_user.pmc
install_name_tool -change libunicorn.1.dylib @executable_path/libunicorn.1.dylib $IDA_PLUGINS_PATH/sk3wldbg_user.pmc64


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
# for 6.95
cp -f 6.95/FRIEND.pmc $IDA_PLUGINS_PATH/FRIEND.pmc
cp -f 6.95/FRIEND.pmc64 $IDA_PLUGINS_PATH/FRIEND.pmc64

# Free_the_Debuggers
git clone https://github.com/techbliss/Free_the_Debuggers
ln -s -f $IDA_PLUGINS_PATH/git/Free_the_Debuggers/Free_The_Debuggers.py $IDA_PLUGINS_PATH/Free_The_Debuggers.py

# HexRaysCodeXplorer
git clone https://github.com/REhints/HexRaysCodeXplorer
# for 6.8
#curl -o $IDA_PLUGINS_PATH/HexRaysCodeXplorer.pmc64 https://raw.githubusercontent.com/REhints/HexRaysCodeXplorer/master/bin/v2.0%20%5BBlackHat%20Edition%5D/IDA%20v6.8/Mac/HexRaysCodeXplorer.pmc64
#curl -o $IDA_PLUGINS_PATH/HexRaysCodeXplorer.pmc https://raw.githubusercontent.com/REhints/HexRaysCodeXplorer/master/bin/v2.0%20%5BBlackHat%20Edition%5D/IDA%20v6.8/Mac/HexRaysCodeXplorer.pmc
# for 6.95
curl -o $IDA_PLUGINS_PATH/HexRaysCodeXplorer.pmc64 https://raw.githubusercontent.com/REhints/HexRaysCodeXplorer/master/bin/Hex-Rays%20Plugin%20contest/2015/Mac/HexRaysCodeXplorer.pmc64
curl -o $IDA_PLUGINS_PATH/HexRaysCodeXplorer.pmc https://raw.githubusercontent.com/REhints/HexRaysCodeXplorer/master/bin/Hex-Rays%20Plugin%20contest/2015/Mac/HexRaysCodeXplorer.pmc

# findcrypt
# for 6.95
cp -f 6.95/findcrypt.pmc $IDA_PLUGINS_PATH/findcrypt.pmc
cp -f 6.95/findcrypt.pmc64 $IDA_PLUGINS_PATH/findcrypt.pmc64

# hexrays_hlight
cp -f py/hexrays_hlight.py $IDA_PLUGINS_PATH/hexrays_hlight.py

# VMAttack
git clone https://github.com/anatolikalysch/VMAttack
echo 'export VMAttack=$IDA_PLUGINS_PATH/VMAttack' >> ~/.bash_profile
source ~/.bash_profile
python -m pip install --ignore-installed --no-cache-dir --install-option="--prefix=$IDA_PYTHON_PATH" distorm3
python -m pip install --ignore-installed --no-cache-dir --install-option="--prefix=$IDA_PYTHON_PATH" idacute
ln -s -f $IDA_PLUGINS_PATH/git/VMAttack/VMAttack_plugin_stub.py $IDA_PLUGINS_PATH/VMAttack_plugin_stub.py
ln -s -f $IDA_PLUGINS_PATH/git/VMAttack $IDA_PLUGINS_PATH/VMAttack

# BinDiff
cp -f 6.95/zynamics_bindiff_4_3.pmc $IDA_PLUGINS_PATH/zynamics_bindiff_4_3.pmc
cp -f 6.95/zynamics_bindiff_4_3.pmc64 $IDA_PLUGINS_PATH/zynamics_bindiff_4_3.pmc64
cp -f 6.95/zynamics_binexport_9.pmc $IDA_PLUGINS_PATH/zynamics_binexport_9.pmc
cp -f 6.95/zynamics_binexport_9.pmc64 $IDA_PLUGINS_PATH/zynamics_binexport_9.pmc64

# DrGadget
git clone https://github.com/patois/DrGadget
ln -s -f $IDA_PLUGINS_PATH/git/DrGadget/drgadget.py $IDA_PLUGINS_PATH/drgadget.py
ln -s -f $IDA_PLUGINS_PATH/git/DrGadget/drgadget $IDA_PLUGINS_PATH/drgadget

# syms2elf
git clone https://github.com/danigargu/syms2elf
ln -s -f $IDA_PLUGINS_PATH/git/syms2elf/syms2elf.py $IDA_PLUGINS_PATH/syms2elf.py

# ida-scripts
git clone https://github.com/danigargu/ida-scripts

# x86emu
# for 6.8
#curl -o $IDA_PLUGINS_PATH/x86emu_qt.pmc http://www.idabook.com/x86emu/mac32/ida68/x86emu_qt.pmc
#curl -o $IDA_PLUGINS_PATH/x86emu_qt.pmc64 http://www.idabook.com/x86emu/mac64/ida68/x86emu_qt.pmc64
# for 6.9
#curl -o $IDA_PLUGINS_PATH/x86emu_qt.pmc http://www.idabook.com/x86emu/mac32/ida69/x86emu_qt.pmc
#curl -o $IDA_PLUGINS_PATH/x86emu_qt.pmc64 http://www.idabook.com/x86emu/mac64/ida69/x86emu_qt.pmc64
# git clone https://github.com/cseagle/x86emu
# for 6.95
curl -o $IDA_PLUGINS_PATH/x86emu_qt.pmc https://raw.githubusercontent.com/cseagle/x86emu/master/bin/mac32/ida695/x86emu_qt.pmc
curl -o $IDA_PLUGINS_PATH/x86emu_qt.pmc64 https://raw.githubusercontent.com/cseagle/x86emu/master/bin/mac64/ida695/x86emu_qt.pmc64

# ida_clemency
git clone https://github.com/cseagle/ida_clemency
ln -s -f $IDA_PLUGINS_PATH/git/ida_clemency/clemency_dump.py $IDA_PLUGINS_PATH/clemency_dump.py
ln -s -f $IDA_PLUGINS_PATH/git/ida_clemency/clemency_fix.py $IDA_PLUGINS_PATH/clemency_fix.py
ln -s -f $IDA_PLUGINS_PATH/git/ida_clemency/clemency_proc.py $IDA_PROCS_PATH/clemency_proc.py
ln -s -f $IDA_PLUGINS_PATH/git/ida_clemency/clemency_ldr.py $IDA_LOADERS_PATH/clemency_ldr.py

# collabREate
# git clone https://github.com/cseagle/collabREate
# TODO need compile.

# dwarfexport
#git clone https://github.com/ALSchwalm/dwarfexport
curl -o $IDA_PLUGINS_PATH/dwarfexport.pmc https://raw.githubusercontent.com/ALSchwalm/dwarfexport/master/bin/dwarfexport.pmc
curl -o $IDA_PLUGINS_PATH/dwarfexport.pmc64 https://raw.githubusercontent.com/ALSchwalm/dwarfexport/master/bin/dwarfexport.pmc64

# ida-cmake
git clone https://github.com/zyantific/ida-cmake

# IDASkins
# git clone https://github.com/zyantific/IDASkins
# for ida 6.95
cp -f 6.95/IDASkins.pmc $IDA_PLUGINS_PATH/IDASkins.pmc
cp -f 6.95/IDASkins.pmc64 $IDA_PLUGINS_PATH/IDASkins.pmc64
cp -f 6.95/skin $IDA_INSTALL_PATH/skin

# Tinytool
git clone https://github.com/ThomasKing2014/ReverseTinytoolDemo
ln -s -f $IDA_PLUGINS_PATH/git/ReverseTinytoolDemo/ELFARM32_lod.py $IDA_LOADERS_PATH/ELFARM32_lod.py

# ida-arm-system-highlight
git clone https://github.com/gdelugre/ida-arm-system-highlight

# golang_loader_assist
git clone https://github.com/strazzere/golang_loader_assist

# LoadProcConfig
git clone https://github.com/alexhude/LoadProcConfig
cp -f $IDA_PLUGINS_PATH/git/LoadProcConfig/bin/LoadProcConfig.pmc $IDA_PLUGINS_PATH/LoadProcConfig.pmc
cp -f $IDA_PLUGINS_PATH/git/LoadProcConfig/bin/LoadProcConfig.pmc64 $IDA_PLUGINS_PATH/LoadProcConfig.pmc64

