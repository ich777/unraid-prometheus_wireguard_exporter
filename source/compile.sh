# Clone Repository and compile Prometheus Wireguard Exporter
cd ${DATA_DIR}
git clone https://github.com/MindFlavor/prometheus_wireguard_exporter
cd ${DATA_DIR}/prometheus_wireguard_exporter
git checkout $LAT_V
cargo install --path . --root ${DATA_DIR}/${LAT_V}/usr/ -j${CPU_COUNT}

# Download icon and cleanup
mkdir -p ${DATA_DIR}/v${LAT_V} ${DATA_DIR}/${LAT_V}/usr/local/emhttp/plugins/prometheus_wireguard_exporter/images
wget -q -O ${DATA_DIR}/${LAT_V}/usr/local/emhttp/plugins/prometheus_wireguard_exporter/images/prometheus_wireguard_exporter.png https://raw.githubusercontent.com/ich777/docker-templates/master/ich777/images/wireguard.png
cd ${DATA_DIR}/${LAT_V}
rm -rf ${DATA_DIR}/${LAT_V}/usr/.crate*
chmod -R 755 ${DATA_DIR}/$LAT_V/

# Create Slackware package
makepkg -l y -c y ${DATA_DIR}/v$LAT_V/$APP_NAME-"$(date +'%Y.%m.%d')".tgz
cd ${DATA_DIR}/v$LAT_V
md5sum $APP_NAME-"$(date +'%Y.%m.%d')".tgz > $APP_NAME-"$(date +'%Y.%m.%d')".tgz.md5