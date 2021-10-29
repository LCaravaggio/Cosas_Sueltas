clear all
import excel "C:\Users\lcaravaggio_mecon\Desktop\Libro3.xlsx", sheet("Hoja1") firstrow
tsset fecha
foreach var of varlist * {
if "`var'"!="fecha"{
gen L`var' = `var' / L.`var'-1
}
}

foreach var of varlist LAGRO-LVALO {
if "`var'"!="fecha"{
quietly inspect `var'
if r(N) >100{
local num = 100
}
if r(N) <=100{
local num = 5
}

if r(N) ==0{
local num = 1
}
display `num'

quietly xcorr `var' LBHIP, lags(`num') name(`var'G) tab

}
}

graph combine LAGROG LALUAG LAPBRG LAUSOG LBMAG LBOLTG LCECO2G LCEPUG LCOMEG
graph combine LCRESG LDGCU2G LEDNG LERARG LFRANG LGGALG LJMING LMIRGG LPAMPG
graph combine LPETRG LPGRG LSAMIG LTECO2G LTGNO4G LTGSU2G LTRANG LTSG LYPFDG
graph combine LBHIPG LBPATG LBRIOG LBRIO6G LBYMAG LCADOG LCAPUG LCAPXG LCARCG
graph combine LCELUG LCGPA2G LCOLOG LCTIOG LCVHG LDYCAG LESMEG LFERRG LFIPLG
graph combine LGAROG LGBANG LGCLAG LGRIMG LHAVAG LINDUG LINTRG LINVJG LIRCPG
graph combine LIRSAG LLEDEG LLONGG LMETRG LMOLAG LMOLIG LMORIG LOESTG
graph combine LPATYG LPESAG LPOLLG LPSURG LREPG LRIGOG LROSEG LSEMIG LSTDG
graph combine LSUPVG LTEFG LTGLTG LVALOG
graph display LBHIPG
