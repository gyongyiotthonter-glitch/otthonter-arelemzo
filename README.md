# 🏠 OtthonTér Árelemző

**Streamlit Cloud-ra deployolt árelemző alkalmazás
ingatlan-comparable-ek értékelésére.**

Forrás: ingatlan.com és ingatlanbazár.hu (JS bulk-kinyerő scriptekből).

---

## Funkciók (MVP-1)

- 📂 JSON-fájl feltöltés a bulk-kinyerő outputjából
- 📍 Tárgy ingatlan paramétereinek bevitele (méret, hely, állapot)
- 📊 Alap-statisztikák (átlag, medián, szórás, min, max)
- 💰 Becsült ár 3 módszerrel: átlag, medián, lineáris regresszió
- 📈 Scatter + regressziós illesztés Plotly-val (interaktív)
- 📋 Részletes adattábla

---

## Tervezett bővítések (MVP-2 — MVP-5)

| Fázis  | Funkciók                                                |
|--------|---------------------------------------------------------|
| MVP-2  | Comparable-kártyák képpel, szűrők, egyéni súlyozás      |
| MVP-3  | Térkép (Folium), PDF szakvélemény, megjegyzés-mező       |
| MVP-4  | Ingatlanbazár-források bekapcsolása, dedup logika       |
| MVP-5  | Supabase mentés, idősoros riport                        |

---

## Helyi futtatás (Windows)

1. Klónozzd a repót, vagy töltsd le ZIP-ben.
2. Kattints duplán az **`ELINDITAS.bat`** fájlra.
3. A böngészőben megnyílik az app a `http://localhost:8501` címen.

A `.bat` automatikusan létrehoz egy virtuális környezetet,
telepíti a függőségeket és elindítja az appot.

---

## Streamlit Cloud-on való futtatás

A repo GitHub-on, az app a **Streamlit Community Cloud**-on fut.
Bármely változtatás a `main` ágon → automatikus újradeploy.

---

## Tesztelés példa-adattal

A `pelda_data/pelda_comparables.json` fájl 10 fiktív
Győr-Nádorvárosi panellakás-comparable-t tartalmaz.

1. Indítsd el az appot.
2. A bal oldali sávban tölts fel `pelda_data/pelda_comparables.json`-t.
3. Lásd a statisztikákat és a scatter-diagramot.

---

## A bulk-kinyerő scriptek

A repo **NEM** tartalmazza a JS-kinyerő scripteket
(`ingatlan_com_kinyero.js`, `ingatlanbazar_kinyero.js`).
Ezeket Gyöngyi külön mappában tárolja.

A scriptek a böngésző fejlesztői konzoljában futnak,
és a kinyert JSON-t letöltik a felhasználó gépére.
Az így kapott JSON-t kell az árelemzőbe feltölteni.

---

## Tech-stack

- **Streamlit** — UI keretrendszer
- **Pandas** — adatkezelés
- **Plotly + Statsmodels** — interaktív diagramok + OLS regresszió
- **NumPy** — lineáris algebra

---

## Licenc

Magán-projekt. Minden jog fenntartva.
