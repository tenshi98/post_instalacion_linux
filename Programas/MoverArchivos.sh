# =========================================================================
# =======                Trabajo_polz_asociados_system              =======
# =========================================================================
# Borro las carpetas
rm -rf /mnt/Desarrollos/Github/Trabajo_polz_asociados_system/A2XRXS_gears/
rm -rf /mnt/Desarrollos/Github/Trabajo_polz_asociados_system/EXTERNAL_LIBS/
rm -rf /mnt/Desarrollos/Github/Trabajo_polz_asociados_system/LIB_assets/
rm -rf /mnt/Desarrollos/Github/Trabajo_polz_asociados_system/LIBS_files/
rm -rf /mnt/Desarrollos/Github/Trabajo_polz_asociados_system/LIBS_js/
rm -rf /mnt/Desarrollos/Github/Trabajo_polz_asociados_system/LIBS_php/
rm -rf /mnt/Desarrollos/Github/Trabajo_polz_asociados_system/Legacy/otmar_public/
rm -rf /mnt/Desarrollos/Github/Trabajo_polz_asociados_system/sistema_polza_admin/
rm -rf /mnt/Desarrollos/Github/Trabajo_polz_asociados_system/sistema_polza_compradores/
rm -rf /mnt/Desarrollos/Github/Trabajo_polz_asociados_system/sistema_polza_corredores/
rm -rf /mnt/Desarrollos/Github/Trabajo_polz_asociados_system/sistema_polza_ejecutivos/
rm -rf /mnt/Desarrollos/Github/Trabajo_polz_asociados_system/sistema_polza_vendedores/
rm -rf /mnt/Desarrollos/Github/Trabajo_polz_asociados_system/sistema_polza_geominas/
rm -rf /mnt/Desarrollos/Github/Trabajo_polz_asociados_webs/sitio_web_polz_lomas_de_lambert/
rm -rf /mnt/Desarrollos/Github/Trabajo_polz_asociados_webs/sitio_web_polz_terrania_v2/
rm -rf /mnt/Desarrollos/Github/Trabajo_polz_asociados_webs/sitio_web_polz_geominas/

# Borro los archivos
rm -f /mnt/Desarrollos/Github/Trabajo_polz_asociados_system/Legacy/index.php

# Creo la carpeta
mkdir -p /mnt/Desarrollos/Github/Trabajo_polz_asociados_system/A2XRXS_gears
mkdir -p /mnt/Desarrollos/Github/Trabajo_polz_asociados_system/EXTERNAL_LIBS
mkdir -p /mnt/Desarrollos/Github/Trabajo_polz_asociados_system/LIB_assets
mkdir -p /mnt/Desarrollos/Github/Trabajo_polz_asociados_system/LIBS_files
mkdir -p /mnt/Desarrollos/Github/Trabajo_polz_asociados_system/LIBS_js
mkdir -p /mnt/Desarrollos/Github/Trabajo_polz_asociados_system/LIBS_php
mkdir -p /mnt/Desarrollos/Github/Trabajo_polz_asociados_system/Legacy/otmar_public
mkdir -p /mnt/Desarrollos/Github/Trabajo_polz_asociados_system/sistema_polza_admin
mkdir -p /mnt/Desarrollos/Github/Trabajo_polz_asociados_system/sistema_polza_compradores
mkdir -p /mnt/Desarrollos/Github/Trabajo_polz_asociados_system/sistema_polza_corredores
mkdir -p /mnt/Desarrollos/Github/Trabajo_polz_asociados_system/sistema_polza_ejecutivos
mkdir -p /mnt/Desarrollos/Github/Trabajo_polz_asociados_system/sistema_polza_vendedores
mkdir -p /mnt/Desarrollos/Github/Trabajo_polz_asociados_system/sistema_polza_geominas
mkdir -p /mnt/Desarrollos/Github/Trabajo_polz_asociados_webs/sitio_web_polz_lomas_de_lambert
mkdir -p /mnt/Desarrollos/Github/Trabajo_polz_asociados_webs/sitio_web_polz_terrania_v2
mkdir -p /mnt/Desarrollos/Github/Trabajo_polz_asociados_webs/sitio_web_polz_geominas

# Copio la carpeta
cp -r /mnt/Desarrollos/Entornos/docker_entorno_lamp/www/power_engine_polz_asociados/A2XRXS_gears/ /mnt/Desarrollos/Github/Trabajo_polz_asociados_system/
cp -r /mnt/Desarrollos/Entornos/docker_entorno_lamp/www/power_engine_polz_asociados/EXTERNAL_LIBS/ /mnt/Desarrollos/Github/Trabajo_polz_asociados_system/
cp -r /mnt/Desarrollos/Entornos/docker_entorno_lamp/www/power_engine_polz_asociados/LIB_assets/ /mnt/Desarrollos/Github/Trabajo_polz_asociados_system/
cp -r /mnt/Desarrollos/Entornos/docker_entorno_lamp/www/power_engine_polz_asociados/LIBS_files/ /mnt/Desarrollos/Github/Trabajo_polz_asociados_system/
cp -r /mnt/Desarrollos/Entornos/docker_entorno_lamp/www/power_engine_polz_asociados/LIBS_js/ /mnt/Desarrollos/Github/Trabajo_polz_asociados_system/
cp -r /mnt/Desarrollos/Entornos/docker_entorno_lamp/www/power_engine_polz_asociados/LIBS_php/ /mnt/Desarrollos/Github/Trabajo_polz_asociados_system/
cp -r /mnt/Desarrollos/Entornos/docker_entorno_lamp/www/power_engine_polz_asociados/Legacy/otmar_public/ /mnt/Desarrollos/Github/Trabajo_polz_asociados_system/Legacy/
cp -r /mnt/Desarrollos/Entornos/docker_entorno_lamp/www/power_engine_polz_asociados/sistema_polza_admin/ /mnt/Desarrollos/Github/Trabajo_polz_asociados_system/
cp -r /mnt/Desarrollos/Entornos/docker_entorno_lamp/www/power_engine_polz_asociados/sistema_polza_compradores/ /mnt/Desarrollos/Github/Trabajo_polz_asociados_system/
cp -r /mnt/Desarrollos/Entornos/docker_entorno_lamp/www/power_engine_polz_asociados/sistema_polza_corredores/ /mnt/Desarrollos/Github/Trabajo_polz_asociados_system/
cp -r /mnt/Desarrollos/Entornos/docker_entorno_lamp/www/power_engine_polz_asociados/sistema_polza_ejecutivos/ /mnt/Desarrollos/Github/Trabajo_polz_asociados_system/
cp -r /mnt/Desarrollos/Entornos/docker_entorno_lamp/www/power_engine_polz_asociados/sistema_polza_vendedores/ /mnt/Desarrollos/Github/Trabajo_polz_asociados_system/
cp -r /mnt/Desarrollos/Entornos/docker_entorno_lamp/www/power_engine_polz_asociados/sistema_polza_geominas/ /mnt/Desarrollos/Github/Trabajo_polz_asociados_system/
cp -r /mnt/Desarrollos/Entornos/docker_entorno_lamp/www/power_engine_polz_asociados/sitio_web_polz_lomas_de_lambert/ /mnt/Desarrollos/Github/Trabajo_polz_asociados_webs/
cp -r /mnt/Desarrollos/Entornos/docker_entorno_lamp/www/power_engine_polz_asociados/sitio_web_polz_terrania_v2/ /mnt/Desarrollos/Github/Trabajo_polz_asociados_webs/
cp -r /mnt/Desarrollos/Entornos/docker_entorno_lamp/www/power_engine_polz_asociados/sitio_web_polz_geominas/ /mnt/Desarrollos/Github/Trabajo_polz_asociados_webs/

# Copio Archivos
cp /mnt/Desarrollos/Entornos/docker_entorno_lamp/www/power_engine_polz_asociados/Legacy/index.php /mnt/Desarrollos/Github/Trabajo_polz_asociados_system/Legacy/

# Borro el archivo de configuracion
rm -f /mnt/Desarrollos/Github/Trabajo_polz_asociados_system/sistema_polza_admin/A1XRXS_sys/xrxs_configuracion/config.php
rm -f /mnt/Desarrollos/Github/Trabajo_polz_asociados_system/sistema_polza_admin/A1XRXS_sys/xrxs_configuracion/config_cron.php
rm -f /mnt/Desarrollos/Github/Trabajo_polz_asociados_system/sistema_polza_compradores/A1XRXS_sys/xrxs_configuracion/config.php
rm -f /mnt/Desarrollos/Github/Trabajo_polz_asociados_system/sistema_polza_corredores/A1XRXS_sys/xrxs_configuracion/config.php
rm -f /mnt/Desarrollos/Github/Trabajo_polz_asociados_system/sistema_polza_ejecutivos/A1XRXS_sys/xrxs_configuracion/config.php
rm -f /mnt/Desarrollos/Github/Trabajo_polz_asociados_system/sistema_polza_vendedores/A1XRXS_sys/xrxs_configuracion/config.php
rm -f /mnt/Desarrollos/Github/Trabajo_polz_asociados_system/sistema_polza_geominas/A1XRXS_sys/xrxs_configuracion/config.php
rm -f /mnt/Desarrollos/Github/Trabajo_polz_asociados_webs/sitio_web_polz_lomas_de_lambert/A1XRXS_sys/xrxs_configuracion/config.php
rm -f /mnt/Desarrollos/Github/Trabajo_polz_asociados_webs/sitio_web_polz_terrania_v2/A1XRXS_sys/xrxs_configuracion/config.php
rm -f /mnt/Desarrollos/Github/Trabajo_polz_asociados_webs/sitio_web_polz_geominas/A1XRXS_sys/xrxs_configuracion/config.php

# Borro la carpeta
rm -rf /mnt/Desarrollos/Github/Trabajo_polz_asociados_system/sistema_polza_admin/ClientFiles/_public/
rm -rf /mnt/Desarrollos/Github/Trabajo_polz_asociados_system/sistema_polza_admin/templates/
rm -rf /mnt/Desarrollos/Github/Trabajo_polz_asociados_system/sistema_polza_admin/upload/
rm -rf /mnt/Desarrollos/Github/Trabajo_polz_asociados_webs/sitio_web_polz_lomas_de_lambert/FUERA/
rm -rf /mnt/Desarrollos/Github/Trabajo_polz_asociados_webs/sitio_web_polz_terrania_v2/FUERA/
rm -rf /mnt/Desarrollos/Github/Trabajo_polz_asociados_webs/sitio_web_polz_geominas/FUERA/

# Creo la carpeta
mkdir -p /mnt/Desarrollos/Github/Trabajo_polz_asociados_system/sistema_polza_admin/ClientFiles/_public
mkdir -p /mnt/Desarrollos/Github/Trabajo_polz_asociados_system/sistema_polza_admin/ClientFiles/_public/.quarantine
mkdir -p /mnt/Desarrollos/Github/Trabajo_polz_asociados_system/sistema_polza_admin/ClientFiles/_public/.tmb
mkdir -p /mnt/Desarrollos/Github/Trabajo_polz_asociados_system/sistema_polza_admin/ClientFiles/_public/.trash
mkdir -p /mnt/Desarrollos/Github/Trabajo_polz_asociados_system/sistema_polza_admin/templates
mkdir -p /mnt/Desarrollos/Github/Trabajo_polz_asociados_system/sistema_polza_admin/upload

# Copio Archivos
cp /mnt/Desarrollos/Entornos/docker_entorno_lamp/www/power_engine_polz_asociados/sistema_polza_admin/templates/.htaccess /mnt/Desarrollos/Github/Trabajo_polz_asociados_system/sistema_polza_admin/templates/
cp /mnt/Desarrollos/Entornos/docker_entorno_lamp/www/power_engine_polz_asociados/sistema_polza_admin/templates/index.php /mnt/Desarrollos/Github/Trabajo_polz_asociados_system/sistema_polza_admin/templates/
cp /mnt/Desarrollos/Entornos/docker_entorno_lamp/www/power_engine_polz_asociados/sistema_polza_admin/upload/.htaccess /mnt/Desarrollos/Github/Trabajo_polz_asociados_system/sistema_polza_admin/upload/
cp /mnt/Desarrollos/Entornos/docker_entorno_lamp/www/power_engine_polz_asociados/sistema_polza_admin/upload/index.php /mnt/Desarrollos/Github/Trabajo_polz_asociados_system/sistema_polza_admin/upload/

# =========================================================================
# =======                         CoreEngine                        =======
# =========================================================================
# Borro las carpetas
rm -rf /mnt/Desarrollos/Github/fullstack/frontend-plataforma-monolitica/

# Creo la carpeta
mkdir -p /mnt/Desarrollos/Github/fullstack/frontend-plataforma-monolitica

# Copio la carpeta
cp -r /mnt/Desarrollos/Entornos/docker_entorno_lamp/www/coreEngine/admin/ /mnt/Desarrollos/Github/fullstack/frontend-plataforma-monolitica/
cp -r /mnt/Desarrollos/Entornos/docker_entorno_lamp/www/coreEngine/sites_csjpro_web/ /mnt/Desarrollos/Github/fullstack/frontend-plataforma-monolitica/
cp -r /mnt/Desarrollos/Entornos/docker_entorno_lamp/www/coreEngine/sites_deimosCorp_web/ /mnt/Desarrollos/Github/fullstack/frontend-plataforma-monolitica/
cp -r /mnt/Desarrollos/Entornos/docker_entorno_lamp/www/coreEngine/sites_deimosMetrics_web/ /mnt/Desarrollos/Github/fullstack/frontend-plataforma-monolitica/
cp -r /mnt/Desarrollos/Entornos/docker_entorno_lamp/www/coreEngine/sites_digitalCreations_web/ /mnt/Desarrollos/Github/fullstack/frontend-plataforma-monolitica/
cp -r /mnt/Desarrollos/Entornos/docker_entorno_lamp/www/coreEngine/sites_enConstruccion/ /mnt/Desarrollos/Github/fullstack/frontend-plataforma-monolitica/
cp -r /mnt/Desarrollos/Entornos/docker_entorno_lamp/www/coreEngine/sites_frucomex_web/ /mnt/Desarrollos/Github/fullstack/frontend-plataforma-monolitica/
cp -r /mnt/Desarrollos/Entornos/docker_entorno_lamp/www/coreEngine/vendors/ /mnt/Desarrollos/Github/fullstack/frontend-plataforma-monolitica/

# =========================================================================
# =======                  CoreEngine(Version Publica)              =======
# =========================================================================
# Borro las carpetas
rm -rf /mnt/Desarrollos/Github/coreEngine/admin/
rm -rf /mnt/Desarrollos/Github/coreEngine/vendors/

# Copio la carpeta
cp -r /mnt/Desarrollos/Entornos/docker_entorno_lamp/www/coreEngine/admin/ /mnt/Desarrollos/Github/coreEngine/
cp -r /mnt/Desarrollos/Entornos/docker_entorno_lamp/www/coreEngine/vendors/ /mnt/Desarrollos/Github/coreEngine/
