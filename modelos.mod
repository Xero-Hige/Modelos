/* Declaracion de constantes */
param PORC_MAX_ESPALDA_COMPLETO;
param PORC_MIN_CRAWL_BRAZADA;
param ALFA;
param v;
param V;

#Las ciudades del viajante
set INTERVALOS;

/* Declaracion de variables */
var E >= 0;
var E_c >= 0;
var E_b >= 0;
var E_p >= 0;
var C >= 0;
var C_c >= 0;
var C_b >= 0;
var C_p >= 0;
var M_t >= 0;
var M_1 >= 0;
var M_2 >= 0;
var M_3 >= 0;
var E_1 >= 0;
var E_2 >= 0;
var E_3 >= 0;
var C_1 >= 0;
var C_2 >= 0;
var C_3 >= 0;

var E_c_1 >= 0;
var E_c_2 >= 0;
var E_c_3 >= 0;
var E_b_1 >= 0;
var E_b_2 >= 0;
var E_b_3 >= 0;
var E_p_1 >= 0;
var E_p_2 >= 0;
var E_p_3 >= 0;
var C_c_1 >= 0;
var C_c_2 >= 0;
var C_c_3 >= 0;
var C_b_1 >= 0;
var C_b_2 >= 0;
var C_b_3 >= 0;
var C_p_1 >= 0;
var C_p_2 >= 0;
var C_p_3 >= 0;

var Y_e_1 >= 0, binary;
var Y_e_2 >= 0, binary;
var Y_e_3 >= 0, binary;
var Y_c_1 >= 0, binary;
var Y_c_2 >= 0, binary;
var Y_c_3 >= 0, binary;
var Y_s_e_1 >= 0, binary;
var Y_s_e_2 >= 0, binary;
var Y_s_e_3 >= 0, binary;
var Y_s_c_1 >= 0, binary;
var Y_s_c_2 >= 0, binary;
var Y_s_c_3 >= 0, binary;

/* Definicion del funcional */
/*minimize z: T;*/

/* Restricciones */

/* metros minimos de cada estilo */
s.t. metrosMinimosE: E >= 2000;
s.t. metrosMinimosC: C >= 2 * E;

/* Composicion de cada estilo */
s.t. composicionEspalda: E = E_c + E_b + E_p;
s.t. composicionCrawl: C = C_c + C_b + C_p;

/* cuota ejercicios */
s.t. cuotaEspaldaCompleto: E_c <= PORC_MAX_ESPALDA_COMPLETO * E;
s.t. cuotaEspaldaBrazada: E_b >= 0.12 * E;
s.t. cuotaEspaldaPatadaMinimo: E_p >= 0.08 * E;
s.t. cuotaEspaldaPatadaMaximo: E_p <= 0.2 * E;
s.t. cuotaCrawlCompleto: C_c >= 0.65 * C;
s.t. cuotaCrawlBrazadaMinimo: C_b >= PORC_MIN_CRAWL_BRAZADA * C;
s.t. cuotaCrawlBrazadaMaximo: C_b <= 0.25 * C;
s.t. cuotaCrawlPatada: C_p <= 0.18 * C;

/* metros totales */
s.t. metrosEntreEstilos: M_t = E + C;
s.t. metrosEntreIntervalos: M_t = M_1 + M_2 + M_3;
s.t. metrosEstilosIntervaloUno: M_1 = E_1 + C_1;
s.t. metrosEstilosIntervaloDos: M_2 = E_2 + C_2;
s.t. metrosEstilosIntervaloTres: M_3 = E_3 + C_3;

/* metros por intervalos*/
s.t. metrosIntervaloUnoMinimo: M_1 >= 0.42 * M_t;
s.t. metrosIntervaloDosMinimo: M_1 + M_2 >= 0.72 * M_t;

/* Estilos por intervalos*/
s.t. espaldaIntervalos: E = E_1 + E_2 + E_3;
s.t. crawlIntervalos: C = C_1 + C_2 + C_3;

/* Repeticion de ejercicios */
s.t. espaldaIntervaloUno: E_1 = (E_c_1 + E_p_1 + E_b_1) * ALFA;
s.t. espaldaIntervaloDos: E_2 = (E_c_2 + E_p_2 + E_b_2) * ALFA;
s.t. espaldaIntervaloTres: E_3 = (E_c_3 + E_p_3 + E_b_3) * ALFA;
s.t. crawlIntervaloUno: C_1 = (C_c_1 + C_p_1 + C_b_1) * ALFA;
s.t. crawlIntervaloDos: C_2 = (C_c_2 + C_p_2 + C_b_2) * ALFA;
s.t. crawlIntervaloTres: C_3 = (C_c_3 + C_p_3 + C_b_3) * ALFA;

/* Variaciones de Espalda por intervalo*/
s.t. espaldaCompletoPorIntervalo: E_c = (E_c_1 + E_c_2 + E_c_3) * ALFA;
s.t. espaldaBrazadaPorIntervalo: E_b = (E_b_1 + E_b_2 + E_b_3) * ALFA;
s.t. espaldaPatadaPorIntervalo: E_p = (E_p_1 + E_p_2 + E_p_3) * ALFA;

/* Variaciones de Crawl por intervalo*/
s.t. crawlCompletoPorIntervalo: C_c = (C_c_1 + C_c_2 + C_c_3) * ALFA;
s.t. crawlBrazadaPorIntervalo: C_b = (C_b_1 + C_b_2 + C_b_3) * ALFA;
s.t. crawlPatadaPorIntervalo: C_p = (C_p_1 + C_p_2 + C_p_3) * ALFA;

/* Determinacion de estilos*/
s.t. detEstilosMinUno: Y_e_1 + Y_c_1 >= 1;
s.t. detEstilosMaxUno: Y_e_1 + Y_c_1 <= 2;
s.t. detEstilosMinDos: Y_e_2 + Y_c_2 >= 1;
s.t. detEstilosMaxDos: Y_e_2 + Y_c_2 <= 2;
s.t. detEstilosMinTres: Y_e_3 + Y_c_3 >= 1;
s.t. detEstilosMaxTres: Y_e_3 + Y_c_3 <= 2;

s.t. espaldaBivalenteMinUno: E_1 >= v * Y_e_1;
s.t. espaldaBivalenteMaxUno: E_1 <= V * Y_e_1;
s.t. espaldaBivalenteMinDos: E_2 >= v * Y_e_2;
s.t. espaldaBivalenteMaxDos: E_2 <= V * Y_e_2;
s.t. espaldaBivalenteMinTres: E_3 >= v * Y_e_3;
s.t. espaldaBivalenteMaxTres: E_3 <= V * Y_e_3;

s.t. crawlBivalenteMinUno: C_1 >= v * Y_c_1;
s.t. crawlBivalenteMaxUno: C_1 <= V * Y_c_1;
s.t. crawlBivalenteMinDos: C_2 >= v * Y_c_2;
s.t. crawlBivalenteMaxDos: C_2 <= V * Y_c_2;
s.t. crawlBivalenteMinTres: C_3 >= v * Y_c_3;
s.t. crawlBivalenteMaxTres: C_3 <= V * Y_c_3;

s.t. espaldaUnicoBivalenteMinUno:  Y_e_1 + (1 - Y_c_1) >= 2 * Y_s_e_1;
s.t. espaldaUnicoBivalenteMaxUno:  Y_e_1 + (1 - Y_c_1) <= 1 + Y_s_e_1;
s.t. espaldaUnicoBivalenteMinDos:  Y_e_2 + (1 - Y_c_2) >= 2 * Y_s_e_2;
s.t. espaldaUnicoBivalenteMaxDos:  Y_e_2 + (1 - Y_c_2) <= 1 + Y_s_e_2;
s.t. espaldaUnicoBivalenteMinTres:  Y_e_3 + (1 - Y_c_3) >= 2 * Y_s_e_3;
s.t. espaldaUnicoBivalenteMaxTres:  Y_e_3 + (1 - Y_c_3) <= 1 + Y_s_e_3;

s.t. crawlUnicoBivalenteMinUno:  Y_c_1 + (1 - Y_e_1) >= 2 * Y_s_c_1;
s.t. crawlUnicoBivalenteMaxUno:  Y_c_1 + (1 - Y_e_1) <= 1 + Y_s_c_1;
s.t. crawlUnicoBivalenteMinDos:  Y_c_2 + (1 - Y_e_2) >= 2 * Y_s_c_2;
s.t. crawlUnicoBivalenteMaxDos:  Y_c_2 + (1 - Y_e_2) <= 1 + Y_s_c_2;
s.t. crawlUnicoBivalenteMinTres:  Y_c_3 + (1 - Y_e_3) >= 2 * Y_s_c_3;
s.t. crawlUnicoBivalenteMaxTres:  Y_c_3 + (1 - Y_e_3) <= 1 + Y_s_c_3;

s.t. bivalenteUnicoEstiloUno: Y_s_c_1 + Y_s_e_1 <= 1;
s.t. bivalenteUnicoEstiloDos: Y_s_c_2 + Y_s_e_2 <= 1;
s.t. bivalenteUnicoEstiloTres: Y_s_c_3 + Y_s_e_3 <= 1;

end;