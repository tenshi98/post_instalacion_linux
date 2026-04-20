#!/bin/bash
# ============================================================
#  SUDO KEEP-ALIVE (evita pedir password en cada comando)
# ============================================================

init_sudo() {
    # Pedir password una sola vez
    sudo -v || { echo "Se requiere acceso sudo"; exit 1; }

    # Mantener sudo vivo en background
    while true; do
        sudo -n true
        sleep 60
    done 2>/dev/null &

    SUDO_KEEP_ALIVE_PID=$!
}

# ============================================================
#  Script: trabajo_polz.sh
#  Descripcion: Copia archivos con animacion de gatito ASCII
# ============================================================

# --- Colores ANSI ---
RESET="\033[0m"
BOLD="\033[1m"

# Colores de texto
C_CYAN="\033[36m"
C_MAGENTA="\033[35m"
C_YELLOW="\033[33m"
C_GREEN="\033[32m"
C_BLUE="\033[34m"
C_RED="\033[31m"
C_WHITE="\033[97m"
C_GRAY="\033[90m"

# Colores de fondo
BG_BLUE="\033[44m"
BG_MAGENTA="\033[45m"
BG_CYAN="\033[46m"
BG_DARK="\033[40m"

# Colores brillantes
C_BRIGHT_CYAN="\033[96m"
C_BRIGHT_MAGENTA="\033[95m"
C_BRIGHT_YELLOW="\033[93m"
C_BRIGHT_GREEN="\033[92m"
C_BRIGHT_BLUE="\033[94m"
C_BRIGHT_WHITE="\033[97m"

# --- Configuracion de terminal ---
init_sudo           # Inicializar sudo antes de la UI
tput civis          # Ocultar cursor
trap cleanup EXIT   # Limpiar al salir

cleanup() {
    tput cnorm      # Mostrar cursor
    tput rmcup      # Restaurar pantalla original

    # Matar keep-alive de sudo si existe
    if [[ -n "$SUDO_KEEP_ALIVE_PID" ]]; then
        kill "$SUDO_KEEP_ALIVE_PID" 2>/dev/null
    fi
}

# Usar pantalla alternativa para no mezclar con el historial
tput smcup
clear

# --- Variables globales ---
TOTAL_STEPS=79
CURRENT_STEP=0
CURRENT_SECTION=""
CURRENT_TASK=""
CAT_FRAME=0
FRAME_COUNTER=0
FRAME_DELAY=0.25   # 0.25s por frame (igual que la animacion original del gato)
TICKS_PER_FRAME=1  # 1 tick por frame (cada sleep es un frame completo)

# --- Frames del gatito japones (12 frames) ---
# Cada frame tiene 9 lineas
CAT_FRAMES=(
"　　　　　🌸＞　　フ  z
　　　　　| 　-　 - l
　 　　　／\` ミ_wノ
　　 　 /　　　 　 |
　　　 /　 ヽ　　 ﾉ
　 　 │　　|　|　|
　／￣|　　 |　|　|
　| (￣ヽ＿_ヽ_)__)
　＼二つ"
"　　　　　🌸＞　　フ   zZ
　　　　　| 　-　 - l
　 　　　／\` ミ_wノ
　　 　 /　　　 　 |
　　　 /　 ヽ　　 ﾉ
　 　 │　　|　|　|
　／￣|　　 |　|　|
　| (￣ヽ＿_ヽ_)__)
　＼二つ"
"　　　　　🌸＞　　フ    zZz
　　　　　| 　-　 - l
　 　　　／\` ミ_wノ
　　 　 /　　　 　 |
　　　 /　 ヽ　　 ﾉ
　 　 │　　|　|　|
　／￣|　　 |　|　|
　| (￣ヽ＿_ヽ_)__)
　＼二つ"
"　　　　　🌸＞　　フ     ZzZ
　　　　　| 　-　 - l
　 　　　／\` ミ_wノ
　　 　 /　　　 　 |
　　　 /　 ヽ　　 ﾉ
　 　 │　　|　|　|
　／￣|　　 |　|　|
　| (￣ヽ＿_ヽ_)__)
　＼二つ"
"　　　　　🌸＞　　フ      ZZz
　　　　　| 　-　 - l
　 　　　／\` ミ_wノ
　　 　 /　　　 　 |
　　　 /　 ヽ　　 ﾉ
　 　 │　　|　|　|
　／￣|　　 |　|　|
　| (￣ヽ＿_ヽ_)__)
　＼二つ"
"　　　　　🌸＞　　フ       zzz
　　　　　| 　-　 - l
　 　　　／\` ミ_wノ
　　 　 /　　　 　 |
　　　 /　 ヽ　　 ﾉ
　 　 │　　|　|　|
　／￣|　　 |　|　|
　| (￣ヽ＿_ヽ_)__)
　＼二つ"
"　　　　　🌸＞　　フ        
　　　　　| 　-　 - l
　 　　　／\` ミ_wノ
　　 　 /　　　 　 |
　　　 /　 ヽ　　 ﾉ
　 　 │　　|　|　|
　／￣|　　 |　|　|
　| (￣ヽ＿_ヽ_)__)
　＼二つ"
"　　　　　🌸＞　　フ   z
　　　　　| 　-　 - l
　 　　　／\` ミ_wノ
　　 　 /　　　 　 |
　　　 /　 ヽ　　 ﾉ
　 　 │　　|　|　|
　／￣|　　 |　|　|
　| (￣ヽ＿_ヽ_)__)
　＼二つ"
"　　　　　🌸＞　　フ    zZ
　　　　　| 　o　 - l
　 　　　／\` ミ_wノ
　　 　 /　　　 　 |
　　　 /　 ヽ　　 ﾉ
　 　 │　　|　|　|
　／￣|　　 |　|　|
　| (￣ヽ＿_ヽ_)__)
　＼二つ"
"　　　　　🌸＞　　フ     zZz
　　　　　| 　o　 o l
　 　　　／\` ミ_wノ
　　 　 /　　　 　 |
　　　 /　 ヽ　　 ﾉ
　 　 │　　|　|　|
　／￣|　　 |　|　|
　| (￣ヽ＿_ヽ_)__)
　＼二つ"
"　　　　　🌸＞　　フ      ZzZ
　　　　　| 　-　 o l
　 　　　／\` ミ_wノ
　　 　 /　　　 　 |
　　　 /　 ヽ　　 ﾉ
　 　 │　　|　|　|
　／￣|　　 |　|　|
　| (￣ヽ＿_ヽ_)__)
　＼二つ"
"　　　　　🌸＞　　フ       zzz
　　　　　| 　-　 - l
　 　　　／\` ミ_wノ
　　 　 /　　　 　 |
　　　 /　 ヽ　　 ﾉ
　 　 │　　|　|　|
　／￣|　　 |　|　|
　| (￣ヽ＿_ヽ_)__)
　＼二つ"
)

CAT_TOTAL_FRAMES=12

# --- Funcion: dibujar el gatito japones en posicion fija ---
draw_cat() {
    local frame=$(( $1 % CAT_TOTAL_FRAMES ))
    local row=3
    local i=0

    # Leer el frame seleccionado linea por linea
    while IFS= read -r line; do
        tput cup $(( row + i )) 0
        printf "%-60s" "$line"
        (( i++ ))
    done <<< "${CAT_FRAMES[$frame]}"

    # Limpiar lineas sobrantes si el frame anterior era mas alto
    while (( i < 9 )); do
        tput cup $(( row + i )) 0
        printf "%-60s" " "
        (( i++ ))
    done
}

# --- Funcion: dibujar barra de progreso coloreada ---
draw_progress() {
    local step=$1
    local total=$2
    local row=13

    # Calcular porcentaje (sin superar 100)
    local pct=$(( step * 100 / total ))
    if (( pct > 100 )); then pct=100; fi

    # Ancho de la barra (44 caracteres)
    local bar_width=44
    local filled=$(( pct * bar_width / 100 ))
    local empty=$(( bar_width - filled ))

    # Color dinamico segun avance
    local bar_color
    if (( pct < 30 )); then
        bar_color="${C_BRIGHT_BLUE}"
    elif (( pct < 60 )); then
        bar_color="${C_BRIGHT_CYAN}"
    elif (( pct < 85 )); then
        bar_color="${C_BRIGHT_YELLOW}"
    else
        bar_color="${C_BRIGHT_GREEN}"
    fi

    local bar_filled=""
    local bar_empty=""
    local i
    for (( i=0; i<filled; i++ )); do bar_filled="${bar_filled}█"; done
    for (( i=0; i<empty;  i++ )); do bar_empty="${bar_empty}░";   done

    tput cup $row 0
    printf "  ${BOLD}${C_BRIGHT_WHITE}Progreso:${RESET} ${C_GRAY}[${RESET}${BOLD}${bar_color}%s${RESET}${C_GRAY}%s${RESET}${C_GRAY}]${RESET} ${BOLD}${C_BRIGHT_WHITE}%3d%%${RESET}   " \
        "$bar_filled" "$bar_empty" "$pct"

    tput cup $(( row+1 )) 0
    printf "  ${C_BRIGHT_CYAN}Paso:${RESET} ${BOLD}${C_WHITE}%d${RESET}${C_GRAY} / ${RESET}${BOLD}${C_WHITE}%d${RESET}%-20s" \
        "$step" "$total" ""
}

# --- Funcion: dibujar seccion y tarea ---
draw_info() {
    local row=16

    tput cup $row 0
    printf "  ${BOLD}${C_BRIGHT_MAGENTA}Seccion :${RESET} ${C_BRIGHT_WHITE}%-50s${RESET}" "$CURRENT_SECTION"

    tput cup $(( row+1 )) 0
    printf "  ${BOLD}${C_BRIGHT_CYAN}Tarea   :${RESET} ${C_YELLOW}%-50s${RESET}" "$CURRENT_TASK"
}

# --- Funcion: dibujar encabezado (solo una vez) ---
draw_header() {
    tput cup 0 0
    printf "${BOLD}${C_BRIGHT_MAGENTA}╔══════════════════════════════════════════════════════╗${RESET}"
    tput cup 1 0
    printf "${BOLD}${C_BRIGHT_MAGENTA}║${RESET} ${C_BRIGHT_CYAN}😺 Sincronizacion Proyectos${RESET} ${C_GRAY}—${RESET} ${C_BRIGHT_YELLOW}Sincronizando...       ${RESET}${BOLD}${C_BRIGHT_MAGENTA}║${RESET}"
    tput cup 2 0
    printf "${BOLD}${C_BRIGHT_MAGENTA}╚══════════════════════════════════════════════════════╝${RESET}"
}

# --- Funcion: dibujar separador ---
draw_separator() {
    tput cup 19 0
    printf " ${C_BRIGHT_BLUE}──────────────────────────────────────────────────────${RESET}"
    tput cup 20 0
    printf " ${BOLD}${C_BRIGHT_MAGENTA}Log:${RESET}"
}

# --- Funcion: agregar linea de log (filas 21..27, rotando) ---
LOG_LINE=21
log_msg() {
    if (( LOG_LINE > 27 )); then
        # Limpiar area de log
        local i
        for (( i=21; i<=27; i++ )); do
            tput cup $i 0
            printf "%-58s" " "
        done
        LOG_LINE=21
    fi
    tput cup $LOG_LINE 0
    printf " ${C_BRIGHT_GREEN}›${RESET} ${C_GREEN}%-54s${RESET}" "$1"
    (( LOG_LINE++ ))
}

# --- Funcion principal: ejecutar paso ---
run_step() {
    local task_name="$1"
    shift
    local cmd=("$@")

    (( CURRENT_STEP++ ))
    CURRENT_TASK="$task_name"

    # Ejecutar comando en segundo plano
    "${cmd[@]}" 2>/dev/null &
    local pid=$!

    # Animar mientras el comando corre
    local tick=0
    while kill -0 "$pid" 2>/dev/null; do
        draw_cat $CAT_FRAME
        draw_progress $CURRENT_STEP $TOTAL_STEPS
        draw_info
        (( tick++ ))
        # Cambiar frame del gato cada TICKS_PER_FRAME ticks
        if (( tick % TICKS_PER_FRAME == 0 )); then
            (( CAT_FRAME++ ))
        fi
        sleep "$FRAME_DELAY"
    done
    wait "$pid"

    # Dibujar una vez mas al terminar
    draw_cat $CAT_FRAME
    draw_progress $CURRENT_STEP $TOTAL_STEPS
    draw_info
    log_msg "✔ $task_name"
    (( CAT_FRAME++ ))
}

# ============================================================
#  DIBUJO INICIAL
# ============================================================
clear
draw_header
draw_cat 0
draw_progress 0 $TOTAL_STEPS
CURRENT_SECTION="Iniciando..."
CURRENT_TASK="Preparando entorno"
draw_info
draw_separator
sleep 0.5

# ============================================================
#  SECCION 1: Trabajo_polz_asociados_system
# ============================================================
CURRENT_SECTION="Trabajo_polz_asociados_system"

# --- Borrar carpetas (16 pasos) ---
run_step "rm -rf A2XRXS_gears"                     rm -rf /mnt/Desarrollos/Github/Trabajo_polz_asociados_system/A2XRXS_gears/
run_step "rm -rf EXTERNAL_LIBS"                    rm -rf /mnt/Desarrollos/Github/Trabajo_polz_asociados_system/EXTERNAL_LIBS/
run_step "rm -rf LIB_assets"                       rm -rf /mnt/Desarrollos/Github/Trabajo_polz_asociados_system/LIB_assets/
run_step "rm -rf LIBS_files"                       rm -rf /mnt/Desarrollos/Github/Trabajo_polz_asociados_system/LIBS_files/
run_step "rm -rf LIBS_js"                          rm -rf /mnt/Desarrollos/Github/Trabajo_polz_asociados_system/LIBS_js/
run_step "rm -rf LIBS_php"                         rm -rf /mnt/Desarrollos/Github/Trabajo_polz_asociados_system/LIBS_php/
run_step "rm -rf Legacy/otmar_public"              rm -rf /mnt/Desarrollos/Github/Trabajo_polz_asociados_system/Legacy/otmar_public/
run_step "rm -rf sistema_polza_admin"              rm -rf /mnt/Desarrollos/Github/Trabajo_polz_asociados_system/sistema_polza_admin/
run_step "rm -rf sistema_polza_compradores"        rm -rf /mnt/Desarrollos/Github/Trabajo_polz_asociados_system/sistema_polza_compradores/
run_step "rm -rf sistema_polza_corredores"         rm -rf /mnt/Desarrollos/Github/Trabajo_polz_asociados_system/sistema_polza_corredores/
run_step "rm -rf sistema_polza_ejecutivos"         rm -rf /mnt/Desarrollos/Github/Trabajo_polz_asociados_system/sistema_polza_ejecutivos/
run_step "rm -rf sistema_polza_vendedores"         rm -rf /mnt/Desarrollos/Github/Trabajo_polz_asociados_system/sistema_polza_vendedores/
run_step "rm -rf sistema_polza_geominas"           rm -rf /mnt/Desarrollos/Github/Trabajo_polz_asociados_system/sistema_polza_geominas/
run_step "rm -rf sitio_web_polz_lomas_de_lambert"  rm -rf /mnt/Desarrollos/Github/Trabajo_polz_asociados_webs/sitio_web_polz_lomas_de_lambert/
run_step "rm -rf sitio_web_polz_terrania_v2"       rm -rf /mnt/Desarrollos/Github/Trabajo_polz_asociados_webs/sitio_web_polz_terrania_v2/
run_step "rm -rf sitio_web_polz_geominas"          rm -rf /mnt/Desarrollos/Github/Trabajo_polz_asociados_webs/sitio_web_polz_geominas/

# --- Borrar archivo (1 paso) ---
run_step "rm -f Legacy/index.php"   rm -f /mnt/Desarrollos/Github/Trabajo_polz_asociados_system/Legacy/index.php

# --- Crear carpetas (1 paso agrupado) ---
run_step "mkdir -p todas las carpetas (polz_system)" bash -c "
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
"

# --- Copiar carpetas (16 pasos) ---
run_step "cp -r A2XRXS_gears"                     cp -r /mnt/Desarrollos/Entornos/docker_entorno_lamp/www/power_engine_polz_asociados/A2XRXS_gears/                    /mnt/Desarrollos/Github/Trabajo_polz_asociados_system/
run_step "cp -r EXTERNAL_LIBS"                    cp -r /mnt/Desarrollos/Entornos/docker_entorno_lamp/www/power_engine_polz_asociados/EXTERNAL_LIBS/                   /mnt/Desarrollos/Github/Trabajo_polz_asociados_system/
run_step "cp -r LIB_assets"                       cp -r /mnt/Desarrollos/Entornos/docker_entorno_lamp/www/power_engine_polz_asociados/LIB_assets/                      /mnt/Desarrollos/Github/Trabajo_polz_asociados_system/
run_step "cp -r LIBS_files"                       cp -r /mnt/Desarrollos/Entornos/docker_entorno_lamp/www/power_engine_polz_asociados/LIBS_files/                      /mnt/Desarrollos/Github/Trabajo_polz_asociados_system/
run_step "cp -r LIBS_js"                          cp -r /mnt/Desarrollos/Entornos/docker_entorno_lamp/www/power_engine_polz_asociados/LIBS_js/                         /mnt/Desarrollos/Github/Trabajo_polz_asociados_system/
run_step "cp -r LIBS_php"                         cp -r /mnt/Desarrollos/Entornos/docker_entorno_lamp/www/power_engine_polz_asociados/LIBS_php/                        /mnt/Desarrollos/Github/Trabajo_polz_asociados_system/
run_step "cp -r Legacy/otmar_public"              cp -r /mnt/Desarrollos/Entornos/docker_entorno_lamp/www/power_engine_polz_asociados/Legacy/otmar_public/             /mnt/Desarrollos/Github/Trabajo_polz_asociados_system/Legacy/
run_step "cp -r sistema_polza_admin"              cp -r /mnt/Desarrollos/Entornos/docker_entorno_lamp/www/power_engine_polz_asociados/sistema_polza_admin/             /mnt/Desarrollos/Github/Trabajo_polz_asociados_system/
run_step "cp -r sistema_polza_compradores"        cp -r /mnt/Desarrollos/Entornos/docker_entorno_lamp/www/power_engine_polz_asociados/sistema_polza_compradores/       /mnt/Desarrollos/Github/Trabajo_polz_asociados_system/
run_step "cp -r sistema_polza_corredores"         cp -r /mnt/Desarrollos/Entornos/docker_entorno_lamp/www/power_engine_polz_asociados/sistema_polza_corredores/        /mnt/Desarrollos/Github/Trabajo_polz_asociados_system/
run_step "cp -r sistema_polza_ejecutivos"         cp -r /mnt/Desarrollos/Entornos/docker_entorno_lamp/www/power_engine_polz_asociados/sistema_polza_ejecutivos/        /mnt/Desarrollos/Github/Trabajo_polz_asociados_system/
run_step "cp -r sistema_polza_vendedores"         cp -r /mnt/Desarrollos/Entornos/docker_entorno_lamp/www/power_engine_polz_asociados/sistema_polza_vendedores/        /mnt/Desarrollos/Github/Trabajo_polz_asociados_system/
run_step "cp -r sistema_polza_geominas"           cp -r /mnt/Desarrollos/Entornos/docker_entorno_lamp/www/power_engine_polz_asociados/sistema_polza_geominas/          /mnt/Desarrollos/Github/Trabajo_polz_asociados_system/
run_step "cp -r sitio_web_polz_lomas_de_lambert"  cp -r /mnt/Desarrollos/Entornos/docker_entorno_lamp/www/power_engine_polz_asociados/sitio_web_polz_lomas_de_lambert/ /mnt/Desarrollos/Github/Trabajo_polz_asociados_webs/
run_step "cp -r sitio_web_polz_terrania_v2"       cp -r /mnt/Desarrollos/Entornos/docker_entorno_lamp/www/power_engine_polz_asociados/sitio_web_polz_terrania_v2/      /mnt/Desarrollos/Github/Trabajo_polz_asociados_webs/
run_step "cp -r sitio_web_polz_geominas"          cp -r /mnt/Desarrollos/Entornos/docker_entorno_lamp/www/power_engine_polz_asociados/sitio_web_polz_geominas/         /mnt/Desarrollos/Github/Trabajo_polz_asociados_webs/

# --- Copiar archivo Legacy/index.php (1 paso) ---
run_step "cp Legacy/index.php"  cp /mnt/Desarrollos/Entornos/docker_entorno_lamp/www/power_engine_polz_asociados/Legacy/index.php /mnt/Desarrollos/Github/Trabajo_polz_asociados_system/Legacy/

# --- Borrar configs (1 paso agrupado) ---
run_step "rm -f configs (polz_system)" bash -c "
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
"

# --- Borrar carpetas extras (1 paso agrupado) ---
run_step "rm -rf carpetas extras (admin/webs)" bash -c "
rm -rf /mnt/Desarrollos/Github/Trabajo_polz_asociados_system/sistema_polza_admin/ClientFiles/_public/
rm -rf /mnt/Desarrollos/Github/Trabajo_polz_asociados_system/sistema_polza_admin/templates/
rm -rf /mnt/Desarrollos/Github/Trabajo_polz_asociados_system/sistema_polza_admin/upload/
rm -rf /mnt/Desarrollos/Github/Trabajo_polz_asociados_webs/sitio_web_polz_lomas_de_lambert/FUERA/
rm -rf /mnt/Desarrollos/Github/Trabajo_polz_asociados_webs/sitio_web_polz_terrania_v2/FUERA/
rm -rf /mnt/Desarrollos/Github/Trabajo_polz_asociados_webs/sitio_web_polz_geominas/FUERA/
"

# --- Crear carpetas extras (1 paso agrupado) ---
run_step "mkdir -p ClientFiles/_public y subcarpetas" bash -c "
mkdir -p /mnt/Desarrollos/Github/Trabajo_polz_asociados_system/sistema_polza_admin/ClientFiles/_public
mkdir -p /mnt/Desarrollos/Github/Trabajo_polz_asociados_system/sistema_polza_admin/ClientFiles/_public/.quarantine
mkdir -p /mnt/Desarrollos/Github/Trabajo_polz_asociados_system/sistema_polza_admin/ClientFiles/_public/.tmb
mkdir -p /mnt/Desarrollos/Github/Trabajo_polz_asociados_system/sistema_polza_admin/ClientFiles/_public/.trash
mkdir -p /mnt/Desarrollos/Github/Trabajo_polz_asociados_system/sistema_polza_admin/templates
mkdir -p /mnt/Desarrollos/Github/Trabajo_polz_asociados_system/sistema_polza_admin/upload
"

# --- Copiar archivos extras (1 paso agrupado) ---
run_step "cp templates y upload (admin)" bash -c "
cp /mnt/Desarrollos/Entornos/docker_entorno_lamp/www/power_engine_polz_asociados/sistema_polza_admin/templates/.htaccess  /mnt/Desarrollos/Github/Trabajo_polz_asociados_system/sistema_polza_admin/templates/
cp /mnt/Desarrollos/Entornos/docker_entorno_lamp/www/power_engine_polz_asociados/sistema_polza_admin/templates/index.php  /mnt/Desarrollos/Github/Trabajo_polz_asociados_system/sistema_polza_admin/templates/
cp /mnt/Desarrollos/Entornos/docker_entorno_lamp/www/power_engine_polz_asociados/sistema_polza_admin/upload/.htaccess     /mnt/Desarrollos/Github/Trabajo_polz_asociados_system/sistema_polza_admin/upload/
cp /mnt/Desarrollos/Entornos/docker_entorno_lamp/www/power_engine_polz_asociados/sistema_polza_admin/upload/index.php     /mnt/Desarrollos/Github/Trabajo_polz_asociados_system/sistema_polza_admin/upload/
"

# ============================================================
#  SECCION 2: CoreEngine
# ============================================================
CURRENT_SECTION="CoreEngine"

# --- Borrar carpeta (1 paso) ---
run_step "rm -rf frontend-plataforma-monolitica"  rm -rf /mnt/Desarrollos/Github/fullstack/frontend-plataforma-monolitica/

# --- Crear carpeta (1 paso) ---
run_step "mkdir -p frontend-plataforma-monolitica" mkdir -p /mnt/Desarrollos/Github/fullstack/frontend-plataforma-monolitica

# --- Copiar carpetas (9 pasos) ---
run_step "cp -r admin"                       cp -r /mnt/Desarrollos/Entornos/docker_entorno_lamp/www/coreEngine/admin/                       /mnt/Desarrollos/Github/fullstack/frontend-plataforma-monolitica/
run_step "cp -r sites_csjpro_web"            cp -r /mnt/Desarrollos/Entornos/docker_entorno_lamp/www/coreEngine/sites_csjpro_web/            /mnt/Desarrollos/Github/fullstack/frontend-plataforma-monolitica/
run_step "cp -r sites_deimosCorp_web"        cp -r /mnt/Desarrollos/Entornos/docker_entorno_lamp/www/coreEngine/sites_deimosCorp_web/        /mnt/Desarrollos/Github/fullstack/frontend-plataforma-monolitica/
run_step "cp -r sites_deimosMetrics_web"     cp -r /mnt/Desarrollos/Entornos/docker_entorno_lamp/www/coreEngine/sites_deimosMetrics_web/     /mnt/Desarrollos/Github/fullstack/frontend-plataforma-monolitica/
run_step "cp -r sites_digitalCreations_web"  cp -r /mnt/Desarrollos/Entornos/docker_entorno_lamp/www/coreEngine/sites_digitalCreations_web/  /mnt/Desarrollos/Github/fullstack/frontend-plataforma-monolitica/
run_step "cp -r sites_enConstruccion"        cp -r /mnt/Desarrollos/Entornos/docker_entorno_lamp/www/coreEngine/sites_enConstruccion/        /mnt/Desarrollos/Github/fullstack/frontend-plataforma-monolitica/
run_step "cp -r sites_frucomex_admin"        cp -r /mnt/Desarrollos/Entornos/docker_entorno_lamp/www/coreEngine/sites_frucomex_admin/        /mnt/Desarrollos/Github/fullstack/frontend-plataforma-monolitica/
run_step "cp -r sites_frucomex_web"          cp -r /mnt/Desarrollos/Entornos/docker_entorno_lamp/www/coreEngine/sites_frucomex_web/          /mnt/Desarrollos/Github/fullstack/frontend-plataforma-monolitica/
run_step "cp -r sites_orionix_admin"         cp -r /mnt/Desarrollos/Entornos/docker_entorno_lamp/www/coreEngine/sites_orionix_admin/         /mnt/Desarrollos/Github/fullstack/frontend-plataforma-monolitica/
run_step "cp -r sites_orionix_web"           cp -r /mnt/Desarrollos/Entornos/docker_entorno_lamp/www/coreEngine/sites_orionix_web/           /mnt/Desarrollos/Github/fullstack/frontend-plataforma-monolitica/
run_step "cp -r vendors (coreEngine)"        cp -r /mnt/Desarrollos/Entornos/docker_entorno_lamp/www/coreEngine/vendors/                     /mnt/Desarrollos/Github/fullstack/frontend-plataforma-monolitica/

# ============================================================
#  SECCION 3: CoreEngine (Version Publica)
# ============================================================
CURRENT_SECTION="CoreEngine (Version Publica)"

# --- Borrar carpetas (2 pasos) ---
run_step "rm -rf coreEngine/admin"    rm -rf /mnt/Desarrollos/Github/coreEngine/admin/
run_step "rm -rf coreEngine/vendors"  rm -rf /mnt/Desarrollos/Github/coreEngine/vendors/

# --- Copiar carpetas (2 pasos) ---
run_step "cp -r admin (coreEngine publico)"    cp -r /mnt/Desarrollos/Entornos/docker_entorno_lamp/www/coreEngine/admin/   /mnt/Desarrollos/Github/coreEngine/
run_step "cp -r vendors (coreEngine publico)"  cp -r /mnt/Desarrollos/Entornos/docker_entorno_lamp/www/coreEngine/vendors/ /mnt/Desarrollos/Github/coreEngine/

# --- Borrar configs (1 paso agrupado) ---
run_step "rm -f ConfigAPP/Data/Mail/Token (coreEngine)" bash -c "
rm -f /mnt/Desarrollos/Github/coreEngine/admin/app/config/ConfigAPP.php
rm -f /mnt/Desarrollos/Github/coreEngine/admin/app/config/ConfigData.php
rm -f /mnt/Desarrollos/Github/coreEngine/admin/app/config/ConfigMail.php
rm -f /mnt/Desarrollos/Github/coreEngine/admin/app/config/ConfigToken.php
"

# --- Borrar modulos privados (1 paso) ---
run_step "rm -rf admin/app/modules/campanas"  rm -rf /mnt/Desarrollos/Github/coreEngine/admin/app/modules/campanas/

# ============================================================
#  SECCION 4: Reset Navicat Premium
# ============================================================
CURRENT_SECTION="Reset Navicat Premium"

# --- Backup dconf (1 paso) ---
run_step "Backup dconf user" bash -c "
DATE=\$(date '+%Y%m%d_%H%M%S')
cp ~/.config/dconf/user ~/.config/dconf/user.\${DATE}.bk
"

# --- Backup preferences.json (1 paso) ---
run_step "Backup preferences.json (Navicat)" bash -c "
DATE=\$(date '+%Y%m%d_%H%M%S')
cp ~/.config/navicat/Premium/preferences.json ~/.config/navicat/Premium/preferences.json.\${DATE}.bk
"

# --- Reset dconf Navicat (1 paso) ---
run_step "dconf reset Navicat Premium" bash -c "
dconf reset -f /com/premiumsoft/navicat-premium/
"

# --- Limpiar campos en preferences.json (1 paso) ---
run_step "sed reset preferences.json (Navicat)" bash -c "
sed -i -E 's/,?\"([A-F0-9]+)\":\{([^\}]+)},?//g' ~/.config/navicat/Premium/preferences.json
"

# ============================================================
#  SECCION 5: Mantenimiento Linux Mint
# ============================================================
CURRENT_SECTION="Mantenimiento Linux Mint"

# --- Actualizar repositorios ---
run_step "apt update" sudo apt update -y

# --- Actualizar paquetes ---
run_step "apt upgrade" sudo apt upgrade -y

# --- Eliminar paquetes innecesarios ---
run_step "apt autoremove" sudo apt autoremove -y

# --- Limpiar cache de paquetes ---
run_step "apt clean" sudo apt clean

# --- Limpiar cache de paquetes descargados ---
run_step "apt autoclean" sudo apt autoclean

# --- Limpiar thumbnails ---
run_step "rm thumbnails cache" bash -c "
rm -rf ~/.cache/thumbnails/*
"

# --- Limpiar cache general del usuario ---
run_step "rm ~/.cache/*" bash -c "
rm -rf ~/.cache/*
"

# --- Limpiar logs antiguos (>7 días) ---
run_step "journalctl vacuum" sudo journalctl --vacuum-time=7d

# --- Limpiar archivos temporales ---
run_step "rm /tmp/*" sudo rm -rf /tmp/*

# --- Limpiar snaps antiguos (si existen) ---
run_step "snap cleanup old revisions" bash -c '
set -e
if command -v snap >/dev/null 2>&1; then
    snap list --all | awk "/disabled/{print \$1, \$3}" | while read snapname revision; do
        sudo snap remove "$snapname" --revision="$revision"
    done
fi
'

# --- Limpiar kernels antiguos ---
run_step "apt autoremove" sudo apt autoremove --purge

# ============================================================
#  PANTALLA FINAL
# ============================================================
CURRENT_STEP=$TOTAL_STEPS
CURRENT_TASK="Completado exitosamente"
CURRENT_SECTION="Todos los proyectos sincronizados"

clear
draw_header

# Gato final (ultimo frame de la animacion — ojos abiertos, celebrando)
tput cup 3 0
printf "　　　　　🌸＞　　フ       ✨"
tput cup 4 0
printf "　　　　　| 　o　 o l"
tput cup 5 0
printf "　 　　　／\` ミ_wノ"
tput cup 6 0
printf "　　 　 /　　　 　 |"
tput cup 7 0
printf "　　　 /　 ヽ　　 ﾉ"
tput cup 8 0
printf "　 　 │　　|　|　|"
tput cup 9 0
printf "　／￣|　　 |　|　|"
tput cup 10 0
printf "　| (￣ヽ＿_ヽ_)__)"
tput cup 11 0
printf "　＼二つ"

draw_progress $TOTAL_STEPS $TOTAL_STEPS

tput cup 16 0
printf "  ${BOLD}${C_BRIGHT_MAGENTA}Seccion :${RESET} ${C_BRIGHT_WHITE}%-50s${RESET}" "$CURRENT_SECTION"
tput cup 17 0
printf "  ${BOLD}${C_BRIGHT_CYAN}Tarea   :${RESET} ${C_BRIGHT_GREEN}%-50s${RESET}" "$CURRENT_TASK"

draw_separator

tput cup 21 0
printf " ${BOLD}${C_BRIGHT_GREEN}✅  Sincronizacion completada sin errores.${RESET}"
tput cup 22 0
printf " ${C_GRAY}Presiona${RESET} ${BOLD}${C_BRIGHT_WHITE}ENTER${RESET}${C_GRAY} para salir...${RESET}"

tput cnorm
read -r