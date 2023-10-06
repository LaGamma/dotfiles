cd ~
# depends on many things, including ncurses
git clone https://github.com/python/cpython.git
cd cpython/
./configure --prefix=$HOME/.local --enable-optimizations
make -s -j16 && make install
# can add make test before make install if you want to test python

echo "export PATH=$PATH:~/.local/bin" >> ~/.bashrc
source ~/.bashrc

cd ~
git clone https://github.com/vim/vim.git
cd vim/
./configure --prefix=$HOME/.local --enable-multibyte --with-features=huge --enable-fail-if-missing
make -s -j16 && make install

# depends on automake and libtool
cd ~
git clone https://github.com/libevent/libevent.git
cd libevent/
sh autogen.sh
./configure --prefix=$HOME/.local
make -s -j16 && make install

# depends on libevent, bison, ncurses
cd ~
git clone https://github.com/tmux/tmux.git
cd tmux/
sh autogen.sh
# see https://gist.github.com/ryin/3106801
./configure --prefix=$HOME/.local CFLAGS="-I$HOME/.local/include" LDFLAGS="-L$HOME/.local/lib -L$HOME/.local/include" CPPFLAGS="-I$HOME/.local/include" LDFLAGS="-static -L$HOME/.local/include -L$HOME/.local/lib"
make -s -j16 && make install
