(defrule MAIN::gejala1
   =>
   (printout t "Apakah Anda merasa sakit kepala? (iya/tidak)" crlf)
   (assert (gejala1 (read))))

(defrule MAIN::gejala2
   =>
   (printout t "Apakah Anda merasa sakit kepala hanya di salah satu bagian kepala kanan/kiri? (iya/tidak)" crlf)
   (assert (gejala2 (read))))

(defrule MAIN::gejala3
   =>
   (printout t "Apakah Anda merasa mual atau muntah? (iya/tidak)" crlf)
   (assert (gejala3 (read))))

(defrule MAIN::gejala4
   =>
   (printout t "Apakah Anda sering merasa sakit kepala selama 1 bulan terakhir? (iya/tidak)" crlf)
   (assert (gejala4 (read))))

(defrule MAIN::gejala5
   =>
   (printout t "Apakah sakit kepala Anda disertai dengan demam? (iya/tidak)" crlf)
   (assert (gejala5 (read))))

(defrule MAIN::Vgejala
   ?vg1 <- (gejala1 ?g1)
   ?vg2 <- (gejala2 ?g2)
   ?vg3 <- (gejala3 ?g3)
   ?vg4 <- (gejala4 ?g4)
   ?vg5 <- (gejala5 ?g5)
   =>
   (retract ?vg1)
   (retract ?vg2)
   (retract ?vg3)
   (retract ?vg4)
   (retract ?vg5)
   (if (eq ?g1 iya)
      then
      (if (eq ?g2 iya)
         then
         (if (eq ?g3 iya)
            then
            (if (eq ?g4 iya)
               then
               (printout t "Anda menderita sakit kepala migrain kronis." crlf)
               else
               (printout t "Anda menderita sakit kepala migrain." crlf))
            else
            (printout t "Anda menderita sakit kepala migrain ringan." crlf))
         else
         (if (eq ?g5 iya)
            then
            (printout t "Anda menderita sakit kepala akibat sinusitis." crlf)
            else
            (printout t "Anda menderita sakit kepala biasa." crlf)))
      else
      (printout t "Anda tidak menderita sakit kepala." crlf)))
