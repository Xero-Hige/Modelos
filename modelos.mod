/* Declaracion de constantes */
param PORC_MAX_ESPALDA_COMPLETO;
param PORC_MIN_CRAWL_BRAZADA;
param ALFA;
param v;
param V;
param OLIMP;

#Las ciudades del viajante
set INTERVALOS;

/* Declaracion de variables */
var E >= 0;								/* metros nadados estilo espalda totales */
var E_c >= 0;							/* Metros ejercitacion espalda, variacion completa */
var E_b >= 0;                           /* Metros ejercitacion espalda, variacion solo brazada */
var E_p >= 0;                           /* Metros ejercitacion espalda, variacion solo patada */
var C >= 0;                             /* metros nadados estilo crawl totales */
var C_c >= 0;                           /* Metros ejercitacion crawl, variacion completa */
var C_b >= 0;                           /* Metros ejercitacion crawl, variacion solo brazada */
var C_p >= 0;                           /* Metros ejercitacion crawl, variacion solo patada */
var M_t >= 0;                           /* metros nadados totales */
var M_1 >= 0;                           /* Metros nadados en intervalo 1 */
var M_2 >= 0;                           /* Metros nadados en intervalo 2 */
var M_3 >= 0;                           /* Metros nadados en intervalo 3 */
var E_1 >= 0;                           /* Metros nadados estilo espalda en intervalo 1 */
var E_2 >= 0;                           /* Metros nadados estilo espalda en intervalo 2 */
var E_3 >= 0;                           /* Metros nadados estilo espalda en intervalo 3 */
var C_1 >= 0;                           /* Metros nadados estilo crawl en intervalo 1 */
var C_2 >= 0;                           /* Metros nadados estilo crawl en intervalo 2 */
var C_3 >= 0;                           /* Metros nadados estilo crawl en intervalo 3 */
                                        
var E_c_1 >= 0;                         /* Metros nadados estilo espalda variacion completa en intervalo 1*/
var E_c_2 >= 0;                         /* Metros nadados estilo espalda variacion completa en intervalo 2*/
var E_c_3 >= 0;                         /* Metros nadados estilo espalda variacion completa en intervalo 3*/
var E_b_1 >= 0;                         /* Metros nadados estilo espalda variacion brazada en intervalo 1*/
var E_b_2 >= 0;                         /* Metros nadados estilo espalda variacion brazada en intervalo 2*/
var E_b_3 >= 0;                         /* Metros nadados estilo espalda variacion brazada en intervalo 3*/
var E_p_1 >= 0;                         /* Metros nadados estilo espalda variacion patada en intervalo 1*/
var E_p_2 >= 0;                         /* Metros nadados estilo espalda variacion patada en intervalo 2*/
var E_p_3 >= 0;                         /* Metros nadados estilo espalda variacion patada en intervalo 3*/
var C_c_1 >= 0;                         /* Metros nadados estilo crawl variacion completa en intervalo 1*/
var C_c_2 >= 0;                         /* Metros nadados estilo crawl variacion completa en intervalo 2*/
var C_c_3 >= 0;                         /* Metros nadados estilo crawl variacion completa en intervalo 3*/
var C_b_1 >= 0;                         /* Metros nadados estilo crawl variacion brazada en intervalo 1*/
var C_b_2 >= 0;                         /* Metros nadados estilo crawl variacion brazada en intervalo 2*/
var C_b_3 >= 0;                         /* Metros nadados estilo crawl variacion brazada en intervalo 3*/
var C_p_1 >= 0;                         /* Metros nadados estilo crawl variacion patada en intervalo 1*/
var C_p_2 >= 0;                         /* Metros nadados estilo crawl variacion patada en intervalo 2*/
var C_p_3 >= 0;                         /* Metros nadados estilo crawl variacion patada en intervalo 3*/
                                        
var Y_e_1 >= 0, binary;                 /* se nado estilo espalda en el intervalo 1 */
var Y_e_2 >= 0, binary;                 /* se nado estilo espalda en el intervalo 2 */
var Y_e_3 >= 0, binary;                 /* se nado estilo espalda en el intervalo 3 */
var Y_c_1 >= 0, binary;                 /* se nado estilo crawl en el intervalo 1 */
var Y_c_2 >= 0, binary;                 /* se nado estilo crawl en el intervalo 2 */
var Y_c_3 >= 0, binary;                 /* se nado estilo crawl en el intervalo 3 */
var Y_s_e_1 >= 0, binary;               /* se nado unicamente estilo espalda en intervalo 1 */
var Y_s_e_2 >= 0, binary;               /* se nado unicamente estilo espalda en intervalo 2 */
var Y_s_e_3 >= 0, binary;               /* se nado unicamente estilo espalda en intervalo 3 */
var Y_s_c_1 >= 0, binary;               /* se nado unicamente estilo crawl en intervalo 1 */
var Y_s_c_2 >= 0, binary;               /* se nado unicamente estilo crawl en intervalo 2 */
var Y_s_c_3 >= 0, binary;               /* se nado unicamente estilo crawl en intervalo 3 */
                                        
var Y_f_2_c >= 0, binary;               /* Hay aumento de eficiencia de nado en intervalo 2 por haber nadado primero estilo espalda, luego crawl */
var Y_f_2_e >= 0, binary;               /* Hay aumento de eficiencia de nado en intervalo 2 por haber nadado primero estilo crawl, luego espalda */
var Y_f_3_c >= 0, binary;               /* Hay aumento de eficiencia de nado en intervalo 3 por haber nadado primero estilo espalda, luego crawl */
var Y_f_3_e >= 0, binary;               /* Hay aumento de eficiencia de nado en intervalo 3 por haber nadado primero estilo crawl, luego espalda */
                                        
var Y_f_1 >=0, binary;                  /* Hay aumento de eficiencia de nado en intervalo 1 :: DEBERIA SER CERO*/
var Y_f_2 >=0, binary;                  /* Hay aumento de eficiencia de nado en intervalo 2 */
var Y_f_3 >=0, binary;                  /* Hay aumento de eficiencia de nado en intervalo 3 */
                                        
var T >= 0;                             /* tiempo total de nado */
var T_1 >= 0;                           /* Tiempo de nado en intervalo 1 */
var T_2 >= 0;                           /* Tiempo de nado en intervalo 2 */
var T_3 >= 0;                           /* Tiempo de nado en intervalo 3 */
                                        
var T_f_1 >= 0;                         /* Tiempo de nado eficiente en intervalo 1 */
var T_f_2 >= 0;                         /* Tiempo de nado eficiente en intervalo 2 */
var T_f_3 >= 0;                         /* Tiempo de nado eficiente en intervalo 3 */
var T_n_1 >= 0;                         /* Tiempo de nado normal en intervalo 1 */
var T_n_2 >= 0;                         /* Tiempo de nado normal en intervalo 2 */
var T_n_3 >= 0;                         /* Tiempo de nado normal en intervalo 3 */
                                        
var T_e_1 >= 0;                         /* Tiempo de nado estilo espalda en intervalo 1 */
var T_e_2 >= 0;                         /* Tiempo de nado estilo espalda en intervalo 2 */
var T_e_3 >= 0;                         /* Tiempo de nado estilo espalda en intervalo 3 */
var T_c_1 >= 0;                         /* Tiempo de nado estilo crawl en intervalo 1 */
var T_c_2 >= 0;                         /* Tiempo de nado estilo crawl en intervalo 2 */
var T_c_3 >= 0;                         /* Tiempo de nado estilo crawl en intervalo 3 */

/* Definicion del funcional */
minimize z: T;

/* Restricciones -------------------------------------------------------------------------- */

/* metros minimos de cada estilo */
s.t. metrosMinimosE: E >= 2000;
s.t. metrosMinimosC: C >= 2 * E;

/* Composicion de cada estilo */
s.t. composicionEspalda: 	E = E_c + E_b + E_p;
s.t. composicionCrawl:		C = C_c + C_b + C_p;

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
s.t. tercerIntervaloNoNulo: M_3 >= v;

/* Estilos por intervalos*/
s.t. espaldaIntervalos: E = E_1 + E_2 + E_3;
s.t. crawlIntervalos: C = C_1 + C_2 + C_3;

/* Repeticion de ejercicios */
s.t. espaldaIntervaloUno: E_1 = (E_c_1 + E_p_1 + E_b_1) * ALFA;				/*ALFA es la tasa de repeticion*/
s.t. espaldaIntervaloDos: E_2 = (E_c_2 + E_p_2 + E_b_2) * ALFA;             /*ALFA es la tasa de repeticion*/
s.t. espaldaIntervaloTres: E_3 = (E_c_3 + E_p_3 + E_b_3) * ALFA;            /*ALFA es la tasa de repeticion*/
s.t. crawlIntervaloUno: C_1 = (C_c_1 + C_p_1 + C_b_1) * ALFA;               /*ALFA es la tasa de repeticion*/
s.t. crawlIntervaloDos: C_2 = (C_c_2 + C_p_2 + C_b_2) * ALFA;               /*ALFA es la tasa de repeticion*/
s.t. crawlIntervaloTres: C_3 = (C_c_3 + C_p_3 + C_b_3) * ALFA;              /*ALFA es la tasa de repeticion*/
                                                                            
/* Variaciones de Espalda por intervalo*/                                   
s.t. espaldaCompletoPorIntervalo: E_c = (E_c_1 + E_c_2 + E_c_3) * ALFA;     /*ALFA es la tasa de repeticion*/
s.t. espaldaBrazadaPorIntervalo: E_b = (E_b_1 + E_b_2 + E_b_3) * ALFA;      /*ALFA es la tasa de repeticion*/
s.t. espaldaPatadaPorIntervalo: E_p = (E_p_1 + E_p_2 + E_p_3) * ALFA;       /*ALFA es la tasa de repeticion*/
                                                                            
/* Variaciones de Crawl por intervalo*/                                     
s.t. crawlCompletoPorIntervalo: C_c = (C_c_1 + C_c_2 + C_c_3) * ALFA;       /*ALFA es la tasa de repeticion*/
s.t. crawlBrazadaPorIntervalo: C_b = (C_b_1 + C_b_2 + C_b_3) * ALFA;        /*ALFA es la tasa de repeticion*/
s.t. crawlPatadaPorIntervalo: C_p = (C_p_1 + C_p_2 + C_p_3) * ALFA;         /*ALFA es la tasa de repeticion*/

/* Determinacion de estilos*/
s.t. detEstilosMinUno: Y_e_1 + Y_c_1 >= 1;
s.t. detEstilosMinDos: Y_e_2 + Y_c_2 >= 1;
s.t. detEstilosMinTres: Y_e_3 + Y_c_3 >= 1;

/* Anulacion de tiempo de espalda por intervalo */
s.t. espaldaBivalenteMinUno: E_1 >= v * Y_e_1;
s.t. espaldaBivalenteMaxUno: E_1 <= V * Y_e_1;

s.t. espaldaBivalenteMinDos: E_2 >= v * Y_e_2;
s.t. espaldaBivalenteMaxDos: E_2 <= V * Y_e_2;

s.t. espaldaBivalenteMinTres: E_3 >= v * Y_e_3;
s.t. espaldaBivalenteMaxTres: E_3 <= V * Y_e_3;

/* Anulacion de tiempo de crawl por intervalo */
s.t. crawlBivalenteMinUno: C_1 >= v * Y_c_1;
s.t. crawlBivalenteMaxUno: C_1 <= V * Y_c_1;

s.t. crawlBivalenteMinDos: C_2 >= v * Y_c_2;
s.t. crawlBivalenteMaxDos: C_2 <= V * Y_c_2;

s.t. crawlBivalenteMinTres: C_3 >= v * Y_c_3;
s.t. crawlBivalenteMaxTres: C_3 <= V * Y_c_3;

/* Bivalente unicamente espalda por intervalo */
s.t. espaldaUnicoBivalenteMinUno:  Y_e_1 + (1 - Y_c_1) >= 2 * Y_s_e_1;
s.t. espaldaUnicoBivalenteMaxUno:  Y_e_1 + (1 - Y_c_1) <= 1 + Y_s_e_1;

s.t. espaldaUnicoBivalenteMinDos:  Y_e_2 + (1 - Y_c_2) >= 2 * Y_s_e_2;
s.t. espaldaUnicoBivalenteMaxDos:  Y_e_2 + (1 - Y_c_2) <= 1 + Y_s_e_2;

s.t. espaldaUnicoBivalenteMinTres:  Y_e_3 + (1 - Y_c_3) >= 2 * Y_s_e_3;
s.t. espaldaUnicoBivalenteMaxTres:  Y_e_3 + (1 - Y_c_3) <= 1 + Y_s_e_3;

/* Bivalente unicamente crawl por intervalo */
s.t. crawlUnicoBivalenteMinUno:  Y_c_1 + (1 - Y_e_1) >= 2 * Y_s_c_1;
s.t. crawlUnicoBivalenteMaxUno:  Y_c_1 + (1 - Y_e_1) <= 1 + Y_s_c_1;

s.t. crawlUnicoBivalenteMinDos:  Y_c_2 + (1 - Y_e_2) >= 2 * Y_s_c_2;
s.t. crawlUnicoBivalenteMaxDos:  Y_c_2 + (1 - Y_e_2) <= 1 + Y_s_c_2;

s.t. crawlUnicoBivalenteMinTres:  Y_c_3 + (1 - Y_e_3) >= 2 * Y_s_c_3;
s.t. crawlUnicoBivalenteMaxTres:  Y_c_3 + (1 - Y_e_3) <= 1 + Y_s_c_3;

s.t. bivalenteUnicoEstiloUno: 	Y_s_c_1 + Y_s_e_1 <= 1;
s.t. bivalenteUnicoEstiloDos: 	Y_s_c_2 + Y_s_e_2 <= 1;
s.t. bivalenteUnicoEstiloTres: 	Y_s_c_3 + Y_s_e_3 <= 1;

/* condicionAumentoEficiencia Intervalo dos */
s.t. aumentoEfiEspaldaCrawlMin: Y_s_e_1 + Y_s_c_2 >= 2 * Y_f_2_c;
s.t. aumentoEfiEspaldaCrawlMax: Y_s_e_1 + Y_s_c_2 <= 1 + Y_f_2_c;

s.t. aumentoEfiCrawlEspaldaMin: Y_s_c_1 + Y_s_e_2 >= 2 * Y_f_2_e;
s.t. aumentoEfiCrawlEspaldaMax: Y_s_c_1 + Y_s_e_2 <= 1 + Y_f_2_e;

s.t. aumentoEfiDosMin: 	Y_f_2_c + Y_f_2_e >= Y_f_2;
s.t. aumentoEfiDosMax: 	Y_f_2_c + Y_f_2_e <= 2 * Y_f_2;
s.t. bivalenteEfiDos: 	Y_f_2_c + Y_f_2_e <= 1;

/* condicionAumentoEficiencia Intervalo tres */
s.t. aumentoEfiEspDosCrawlTresMin: Y_s_e_2 + Y_s_c_3 >= 2 * Y_f_3_c;
s.t. aumentoEfiEspDosCrawlTresMax: Y_s_e_2 + Y_s_c_3 <= 1 + Y_f_3_c;

s.t. aumentoEfiCrawlDosEspTresMin: Y_s_c_2 + Y_s_e_3 >= 2 * Y_f_3_e;
s.t. aumentoEfiCrawlDosEspTresMax: Y_s_c_2 + Y_s_e_3 <= 1 + Y_f_3_e;

s.t. aumentoEfiTresMin: Y_f_3_c + Y_f_3_e >= Y_f_3;
s.t. aumentoEfiTresMax: Y_f_3_c + Y_f_3_e <= 2 * Y_f_3;
s.t. bivalenteEfiTres: 	Y_f_3_c + Y_f_3_e <= 1;

/* Fondos disponibles */
s.t. presupuestoDiario: T * 500 + OLIMP <= 2000;

/* Tiempo y aumento de eficiencia */
s.t. tiempoEficienciaIntervalo1: 		T_f_1 = 0;
s.t. posibilidadEficienciaIntervalo1: 	Y_f_1 = 0;
s.t. tiempoTotalIntervalo: 				T = T_1 + T_2 + T_3;

/* Tiempos por intervalo normal y eficiente */
s.t. tiempoUnoNormalEficiente: 	T_1 = T_n_1;
s.t. tiempoDosNormalEficiente: 	T_2 = T_n_2 + T_f_2;
s.t. tiempoTresNormalEficiente: T_3 = T_n_3 + T_f_3;

/* Tiempo espalda por intevalo */
s.t. tiempoEspaldaUno: 	T_e_1 = (E_c_1 * 1 + E_b_1 * 1.25 + E_p_1 * 1.3 ) * ALFA/3600;	/*ALFA es la tasa de repeticion. 3600 representa una hora*/
s.t. tiempoEspaldaDos: 	T_e_2 = (E_c_2 * 1 + E_b_2 * 1.25 + E_p_2 * 1.3 ) * ALFA/3600;  /*ALFA es la tasa de repeticion. 3600 representa una hora*/
s.t. tiempoEspaldaTres: T_e_3 = (E_c_3 * 1 + E_b_3 * 1.25 + E_p_3 * 1.3 ) * ALFA/3600;  /*ALFA es la tasa de repeticion. 3600 representa una hora*/
                                                                                        
s.t. tiempoCrawlUno: 	T_c_1 = (C_c_1 * 0.5 + C_b_1 * 0.6 + C_p_1 * 0.65) * ALFA/3600; 	/*ALFA es la tasa de repeticion. 3600 representa una hora*/
s.t. tiempoCrawlDos: 	T_c_2 = (C_c_2 * 0.5 + C_b_2 * 0.6 + C_p_2 * 0.65) * ALFA/3600;    	/*ALFA es la tasa de repeticion. 3600 representa una hora*/
s.t. tiempoCrawlTres: 	T_c_3 = (C_c_3 * 0.5 + C_b_3 * 0.6 + C_p_3 * 0.65) * ALFA/3600;   	/*ALFA es la tasa de repeticion. 3600 representa una hora*/

/* Bivalentes de tiempo*/
s.t. tiempoEfiEstilosDos: 		T_f_2 >= (T_e_2 + T_c_2) * 0.9 - V * (1 - Y_f_2);
s.t. tiempoEfiEstilosTres: 		T_f_3 >= (T_e_3 + T_c_3) * 0.9 - V * (1 - Y_f_3);

s.t. tiempoNormalEstiloUno: 	T_n_1 = T_e_1 + T_c_1;
s.t. tiempoNormalEstiloDos: 	T_n_2 >= T_e_2 + T_c_2 - V * Y_f_2;
s.t. tiempoNormalEstiloTres: 	T_n_3 >= T_e_3 + T_c_3 - V * Y_f_3;


/* EL PROBLEMA DE LA INCOMPATIBILIDAD ESTABA EN QUE SE ESTABA ESTABLECIENDO UNA IGUALACION
PARA T_f_? Y AL MISMO TIEMPO IMPONIENDO CONDICIONES DE <= QUE HACIAN QUE LA VARIABLE FUESE INCOMPATIBLE.
USE ELIMINACION DE RESTRICCIONES PARA RESOLVERLO. */
/* Bivalentes de tiempo*/
/*s.t. tiempoEfiMinDos: 	T_f_2 	>= v * Y_f_2;
s.t. tiempoEfiMaxDos: 	T_f_2 	<= V * Y_f_2;
s.t. tiempoEfiMinTres: 	T_f_3 	>= v * Y_f_3;
s.t. tiempoEfiMaxTres: 	T_f_3 	<= V * Y_f_3;*/

/*s.t. tiempoNormalMinDos: 	T_n_2 	>= 	v * (1 - Y_f_2);
s.t. tiempoNormalMaxDos: 	T_n_2 	<= 	V * (1 - Y_f_2);
s.t. tiempoNormalMinTres: 	T_n_3 	>= 	v * (1 - Y_f_3);
s.t. tiempoNormalMaxTres: 	T_n_3 	<= 	V * (1 - Y_f_3);*/

/* ESTA PARTE HACE AL SISTEMA INCOMPATIBLE, el sistema los trata de hacer 0 
s.t. tiempoEfiEstilosDos: T_f_2 	= (T_e_2 + T_c_2) * 0.9;
s.t. tiempoEfiEstilosTres: T_f_3 	= (T_e_3 + T_c_3) * 0.9;
/* ESTA PARTE HACE AL SISTEMA INCOMPATIBLE */


end;
