cmake . -DXML_SUPPORT=OFF -DCMAKE_INSTALL_PREFIX=$PREFIX 
make
make install


curl -L http://fallabs.com/tokyocabinet/tokyocabinet-1.4.48.tar.gz -o tokyocabinet.tar.gz
tar xvfz tokyocabinet.tar.gz
cd tokyocabinet-1.4.48
./configure --prefix=$PREFIX --with-zlib=$PREFIX --with-bzip=$PREFIX
make
make install

cd ../src/converters
cmake -DBOOST_INCLUDEDIR=$PREFIX/include/boost/ -DBOOST_LIBRARYDIR=$PREFIX/lib -DBOOST_ROOT=$PREFIX -DSERIALIZE="TokyoCabinet" -DCMAKE_PREFIX_PATH="$PREFIX/lib;$PREFIX" -DTokyoCabinet_INCLUDE_DIR=$PREFIX/include
make
make install
