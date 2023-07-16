'*************************************************************************
'Scapegoat.moa 17.11.02
'
'Ohjelma: Triangl
'*************************************************************************

DECLARE SUB AlkuPiste (x AS INTEGER, y AS INTEGER, suunta AS INTEGER, nopeus AS INTEGER)
DECLARE SUB LoppuPiste (xx AS INTEGER, yy AS INTEGER, suunta2 AS INTEGER, nopeus2 AS INTEGER)

DIM x AS INTEGER, xx AS INTEGER, y AS INTEGER, yy AS INTEGER
DIM suunta AS INTEGER, suunta2 AS INTEGER
DIM nopeus AS INTEGER, nopeus2 AS INTEGER
DIM i AS INTEGER, vari AS INTEGER
DIM viive AS DOUBLE

SCREEN 12
CLS

RANDOMIZE TIMER
x = INT(RND * 640)                                    'arvotaan.
xx = INT(RND * 640)                                   '
y = INT(RND * 480)                                    '
yy = INT(RND * 480)                                   '
suunta = INT(RND * 4) + 1                             '
suunta2 = INT(RND * 4) + 1                            '
nopeus = INT((RND * 30) + 5)                          '
nopeus2 = (RND * 30) + 5                              '

DO
  CALL AlkuPiste(x, y, suunta, nopeus)
  CALL LoppuPiste(xx, yy, suunta2, nopeus2)


  FOR i = 0 TO 24 STEP 4                              '"kopioidaan"...
      vari = i                                        'viivaa. (6 kpl).
      IF vari = 0 OR vari = 24 THEN
         vari = 9
      ELSE vari = 1
      END IF
      LINE (0, 0)-(639, 479), 1, B                             'reunaviiva.
      LINE (x - i, y - i)-(xx - i, yy - i), vari               'ite...
      LINE (xx - i, yy - i)-(664 - x - i, 504 - y - i), vari   'kol-...
      LINE (664 - x - i, 504 - y - i)-(x - i, y - i), vari     'mio.
      
  NEXT
   SLEEP 1
  FOR viive = 1 TO 8000
  NEXT
LOOP WHILE INKEY$ = ""


SUB AlkuPiste (x AS INTEGER, y AS INTEGER, suunta AS INTEGER, nopeus AS INTEGER)

DIM ylosvasen  AS INTEGER
DIM ylosoikea AS INTEGER
DIM alasvasen AS INTEGER
DIM alasoikea AS INTEGER

ylosvasen = 1                                         'suunnnat.
ylosoikea = 2                                         '
alasvasen = 3                                         '
alasoikea = 4                                         '

SELECT CASE suunta
       CASE ylosvasen
            CLS                                       'puhdistetaan välillä.
            x = x - nopeus
            y = y - nopeus
            IF x <= 24 THEN                           '24 0:N sijasta,...
               nopeus = INT(RND * 30) + 5             'koska viivoja...
               suunta = ylosoikea                     'on 6 kpl ja ne...
            ELSEIF y <= 24 THEN                       'ovat 4:n välein.
               nopeus = INT(RND * 30) + 5             '+ 5, jottei olisi...
               suunta = alasvasen                     'liian hidas.
            END IF
       CASE ylosoikea
            CLS                                       'ja puhdistetaan.
            x = x + nopeus
            y = y - nopeus
            IF x >= 640 THEN
               nopeus = INT(RND * 30) + 5
               suunta = ylosvasen
            ELSEIF y <= 24 THEN
               nopeus = INT(RND * 30) + 5
               suunta = alasoikea
            END IF
       CASE alasvasen
            x = x - nopeus
            y = y + nopeus
            IF x <= 24 THEN
               nopeus = INT(RND * 30) + 5
               suunta = alasoikea
            ELSEIF y >= 480 THEN
               nopeus = INT(RND * 30) + 5
               suunta = ylosvasen
            END IF
       CASE alasoikea
            x = x + nopeus
            y = y + nopeus
            IF x >= 640 THEN
               nopeus = INT(RND * 30) + 5
               suunta = alasvasen
            ELSEIF y >= 480 THEN
               nopeus = INT(RND * 30) + 5
               suunta = ylosoikea
            END IF
END SELECT

END SUB


SUB LoppuPiste (xx AS INTEGER, yy AS INTEGER, suunta2 AS INTEGER, nopeus2 AS INTEGER)

DIM ylosvasen  AS INTEGER
DIM ylosoikea AS INTEGER
DIM alasvasen AS INTEGER
DIM alasoikea AS INTEGER

ylosvasen = 1
ylosoikea = 2
alasvasen = 3
alasoikea = 4

SELECT CASE suunta2
       CASE ylosvasen
            xx = xx - nopeus2
            yy = yy - nopeus2
            IF xx <= 24 THEN
               nopeus2 = INT(RND * 30) + 5
               suunta2 = ylosoikea
            ELSEIF yy <= 24 THEN
               nopeus2 = INT(RND * 30) + 5
               suunta2 = alasvasen
            END IF
       CASE ylosoikea
            xx = xx + nopeus2
            yy = yy - nopeus2
            IF xx >= 640 THEN
               nopeus2 = INT(RND * 30) + 5
               suunta2 = ylosvasen
            ELSEIF yy <= 24 THEN
               nopeus2 = INT(RND * 30) + 5
               suunta2 = alasoikea
            END IF
       CASE alasvasen
            xx = xx - nopeus2
            yy = yy + nopeus2
            IF xx <= 24 THEN
               nopeus2 = INT(RND * 30) + 5
               suunta2 = alasoikea
            ELSEIF yy >= 480 THEN
               nopeus2 = INT(RND * 30) + 5
               suunta2 = ylosvasen
            END IF
       CASE alasoikea
            xx = xx + nopeus2
            yy = yy + nopeus2
            IF xx >= 640 THEN
               nopeus2 = INT(RND * 30) + 5
               suunta2 = alasvasen
            ELSEIF yy >= 480 THEN
               nopeus2 = INT(RND * 30) + 5
               suunta2 = ylosoikea
            END IF
END SELECT

END SUB