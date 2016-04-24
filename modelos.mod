/* Declaracion de constantes */
param PORC_MAX_ESPALDA_COMPLETO;
param PORC_MIN_CRAWL_BRAZADA;

/* Declaracion de variables */
var E >= 0;
var E_c >= 0;
var E_b >= 0;
var E_p >= 0;
var C >= 0;
var C_c >= 0;
var C_b >= 0;
var C_p >= 0;

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

end;