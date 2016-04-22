VERSION = 4.60

mkdir glpk
cd glpk
wget ftp://ftp.gnu.org/gnu/glpk/glpk-4.60.tar.gz
tar -xzvf glpk-4.60.tar.gz
cd glpk-4.60
./configure
make
make install
